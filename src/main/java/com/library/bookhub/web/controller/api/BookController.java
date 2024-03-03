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

import jakarta.annotation.PostConstruct;

@RestController
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
//	@GetMapping("/select-all/{num}")
//	public ResponseEntity<?> list4(@PathVariable String num){
//		URI uri = UriComponentsBuilder
//				.fromUriString("https://dapi.kakao.com") // 다른 서버 주소
//				.path("/v3/search/book")
//				.queryParam("query", num)
//				.queryParam("page", 1)
//				.queryParam("size", 50)
//				.queryParam("target", "title")
//				.encode()
//				.build()
//				.toUri();
//
//		RestTemplate template = new RestTemplate();
//		
//		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
//		headers.add("Content-type", "application/json; charset=UTF-8");
//		headers.add("Authorization", "KakaoAK cf87bbe0afb806547eaea08383ae8bae");
//		// 헤더와 바디 결합하기
//		HttpEntity<MultiValueMap<String, String>> resp  = new HttpEntity<>(null, headers);
//
//		// HTTP 요청 처리
//		ResponseEntity<KakaoDoc> response
//		=  template.exchange(uri, HttpMethod.GET, resp, KakaoDoc.class); // 여기서 페이크 사이트에 요청을 한다.
//		
//		return new ResponseEntity<>(response.getBody(), HttpStatus.OK);
//	}
	
	@GetMapping("/all/{pageNum}")
	public ResponseEntity<?> bookListAll(@PathVariable int pageNum){
		System.out.println("=================페이지 " + pageNum);
		List<Book> list = bookService.bookListAll(pageNum);
		return new ResponseEntity<List<Book>>(list, HttpStatus.OK);
	}
	
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
	
	@PostMapping("/borrow") // 책 대출
	public ResponseEntity<?> bookBorrow(int bookId, String username){
		// bh_book에 책정보 update - id
		// bh_book_borrow에 대출정보 insert - userId
		// 트랜젝션 걸어야함
		boolean result = bookService.bookBorrow(bookId, username);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@DeleteMapping("/borrow")
	public ResponseEntity<?> bookBorrowEnd(int bookId, String username){
		// bh_book에 반납 정보 update - bookId
		// bh_book_borrow에 대출정보 삭제해야함!
		
		boolean result = bookService.bookBorrowEnd(bookId, username);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 검색
	@GetMapping("/search/{option}/{inputValue}")
	public ResponseEntity<?> findByBookOption(@PathVariable String option, @PathVariable String inputValue){
		List<Book> list = bookService.findByBookOption(option, inputValue);
		return new ResponseEntity<List<Book>>(list, HttpStatus.OK);
	}

	
	
	
	
	
}
