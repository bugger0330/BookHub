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
	
	public List<Book> bookListAll(){
		return bookRepository.bookListAll();
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
		
		book.setBorrow(book.getBorrow() + 1);
		book.setStatus("대출 불가");
		book.setWdate(returnDate);
		int bookResult = bookRepository.borrowBook(book);
		if(bookResult == 0) {
			throw new RuntimeException("bh_book에 대출정보 수정 실패!");
		}
		
		return true;
	}

		
	
}
