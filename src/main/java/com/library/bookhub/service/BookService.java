package com.library.bookhub.service;

import java.time.LocalDateTime;
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
		int result = 0;
		System.out.println("===================================");
		// 현재 시간 + 7일 = 반납일자 / 형태 2024-02-16 17:40:57
		LocalDateTime now = LocalDateTime.now();
		System.out.println("현재시간--"+now);
		//now.plusDays(7);
		now.plusMonths(11);
		System.out.println("대출기한--" + now);// 안됨..
		
		
		BookBorrow bookBorrow = BookBorrow.builder()
				.userName(username)
				.bookNo(bookId)
				.returnDate("")
				.build();
//		int userResult = bookRepository.borrowUser(bookBorrow);
//		if(userResult == 0) {
//			throw new RuntimeException("bh_book_borrow에 대출정보 등록 실패!");
//		}
//		int bookResult = bookRepository.borrowBook(bookId);
//		if(bookResult == 0) {
//			throw new RuntimeException("bh_book에 대출정보 수정 실패!");
//		}
//		result = userResult + bookResult;
		
		return result == 2;
	}
	
}
