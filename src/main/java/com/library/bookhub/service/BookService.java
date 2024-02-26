package com.library.bookhub.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import com.library.bookhub.entity.Book;
import com.library.bookhub.entity.BookBorrow;
import com.library.bookhub.repository.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	public List<Book> bookListAll(int pageNum){
		if(pageNum == 1) {
			pageNum = 0;
		}else {
			pageNum = pageNum * 30;
		}
		return bookRepository.bookListAll(pageNum);
	}
	
	public Book bookInfo(int id) {
		return bookRepository.bookInfo(id);
	}
	
	@Transactional
	public boolean bookBorrow(int bookId, String username) {
		// 현재 시간 + 7일 = 반납일자 / 형태 2024-02-16 17:40:57
		LocalDateTime now = LocalDateTime.now().plusDays(7);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String returnDate = now.format(formatter);

		// 만약 borrow 테이블에 이미 내역이 존재하면 대출이 되어선 안됨
		BookBorrow borrowEntity = bookRepository.selectBorrow(bookId, username);
		if(borrowEntity != null) {
			return false;
		}
		
		BookBorrow bookBorrow = BookBorrow.builder()
				.userName(username)
				.bookNo(bookId)
				.returnDate(returnDate)
				.build();
		int userResult = bookRepository.borrowUser(bookBorrow);
		if(userResult == 0) {
			throw new RuntimeException("bh_book_borrow에 대출정보 등록 실패!");
		}
		
		Book book = bookRepository.bookInfo(bookId);
		// 북에 대출건수 +1 하고, 대출여부 수정해야함
		if(book != null) {
			book.setBorrow(book.getBorrow() + 1);
			book.setStatus("대출 불가");
			book.setWdate(returnDate);
			int bookResult = bookRepository.borrowBook(book);
			if(bookResult == 0) {
				throw new RuntimeException("bh_book에 대출정보 수정 실패!");
			}
		}
		return true;
	}

	@Transactional
	public boolean bookBorrowEnd(int bookId, String username) {
		// 만약 반납일자가 기존 반납일보다 지났을때 어떻게 할지 고민.. 일단 안했음!
		// 먼저 대출을 했는지 여부 확인부터 하고
		BookBorrow bookBorrowEntity = bookRepository.selectBorrow(bookId, username);
		if(bookBorrowEntity == null) {
			return false;
		}
		// 대출내역이 있으면 반납기능 수행
		int borrowEndresult = bookRepository.borrowUserEnd(bookBorrowEntity.getId());
		System.out.println("대출기록 삭제 아이디 : " + bookBorrowEntity.getId());
		if(borrowEndresult == 0) {
			throw new RuntimeException("bh_book_borrow 테이블에 대출기록 삭제 실패!");
		}
		// book 정보 수정
		Book book = bookRepository.bookInfo(bookId);
		if(book != null) {
			System.out.println("===========================실행완료?" + book);
			book.setStatus("대출 가능");
			int bookResult = bookRepository.borrowBookEnd(book);
			if(bookResult == 0) {
				throw new RuntimeException("bh_book에 반납정보 수정 실패!");
			}
		}
		return true;
	}
	
	public List<Book> findByBookOption(String option, String inputValue){
		return bookRepository.findByBookOption(option, inputValue);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
