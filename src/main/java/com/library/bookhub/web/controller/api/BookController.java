package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.Book;
import com.library.bookhub.service.BookService;



@RestController
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	/**
	 * @fileName : BookController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 정보를 불러옵니다. 페이징 처리도 되어있습니다.
	 */
	@GetMapping("/all/{pageNum}")
	public ResponseEntity<?> bookListAll(@PathVariable int pageNum){
		List<Book> list = bookService.bookListAll(pageNum);
		return new ResponseEntity<List<Book>>(list, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 1 개체의 정보를 불러옵니다.
	 */
	@GetMapping("/info/{id}")
	public ResponseEntity<?> bookInfo(@PathVariable int id){
		Book book = bookService.bookInfo(id);
		if(book != null) {
			if((book.getWdate() == null)) {
				book.setWdate("");
			}
		}
		return new ResponseEntity<Book>(book, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 상세 페이지에서 대출기능 요청시
	 */
	@PostMapping("/borrow") // 책 대출
	public ResponseEntity<?> bookBorrow(int bookId, String username){
		boolean result = bookService.bookBorrow(bookId, username);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	/**
	 * @fileName : BookController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 상세페이지에서 책 반납 요청시
	 */
	@DeleteMapping("/borrow")
	public ResponseEntity<?> bookBorrowEnd(int bookId, String username){
		boolean result = bookService.bookBorrowEnd(bookId, username);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 검색
	/**
	 * @fileName : BookController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 도서 통합검색 페이지에서 옵션과 검색어에 따라 해당하는 책 정보들을 가져옵니다.
	 */
	@GetMapping("/search/{option}/{inputValue}")
	public ResponseEntity<?> findByBookOption(@PathVariable String option, @PathVariable String inputValue){
		List<Book> list = bookService.findByBookOption(option, inputValue);
		return new ResponseEntity<List<Book>>(list, HttpStatus.OK);
	}


	
	
	
	
}
