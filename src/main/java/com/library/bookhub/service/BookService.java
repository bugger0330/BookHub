package com.library.bookhub.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		LocalDateTime now = LocalDateTime.now().plusDays(7);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String returnDate = now.format(formatter);
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
		BookBorrow bookBorrowEntity = bookRepository.selectBorrow(bookId, username);
		if(bookBorrowEntity == null) {
			return false;
		}
		int borrowEndresult = bookRepository.borrowUserEnd(bookBorrowEntity.getId());
		if(borrowEndresult == 0) {
			throw new RuntimeException("bh_book_borrow 테이블에 대출기록 삭제 실패!");
		}
		Book book = bookRepository.bookInfo(bookId);
		if(book != null) {
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
