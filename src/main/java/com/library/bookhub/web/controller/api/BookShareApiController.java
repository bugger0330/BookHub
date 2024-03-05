package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.BookShare;
import com.library.bookhub.service.BookShareService;
import com.library.bookhub.web.dto.share.ShareBookBorrowDto;
import com.library.bookhub.web.dto.share.ShareWriteReqDto;

@RestController
@RequestMapping("/share")
public class BookShareApiController {
	
	@Autowired
	private BookShareService service;

	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 공유 페이지에 책을 등록하는 요청 처리
	 */
	@PostMapping("/book/write")
	public ResponseEntity<?> shareBookWrite(@RequestPart(value="shareInfo") ShareWriteReqDto dto, 
			@RequestPart(value = "file", required = false) MultipartFile file1){
		dto.setFile(file1);
		boolean result = service.shareBookWrite(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 공유 페이지에 로그인 한 유저의 포인트를 가져오는 기능
	 */
	@PostMapping("/mypoint")
	public ResponseEntity<?> orderMyPoint(String userName, int price){
		boolean result = service.orderMyPoint(userName, price);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 공유 페이지에 등록된 도서들을 모두 가져오는 기능
	 */
	@GetMapping("/product/all")
	public ResponseEntity<?> getShareBookALL(){
		List<BookShare> list = service.getShareBookALL();
		return new ResponseEntity<List<BookShare>>(list, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 책 공유 페이지의 특정 도서의 상세 정보를 가져옵니다.
	 */
	@GetMapping("/info/{id}")
	public ResponseEntity<?> getShareBook(@PathVariable int id){
		BookShare bookShare = service.getShareBook(id);
		if((bookShare.getWdate() == null)) {
			bookShare.setWdate("");
		}
		return new ResponseEntity<BookShare>(bookShare, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 공유 도서 대출 기능
	 */
	@PostMapping("/borrow")
	public ResponseEntity<?> shareBookBorrow(ShareBookBorrowDto dto){
		boolean result = service.shareBookBorrow(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 공유 도서를 대출시 100포인트/1일 기준으로 포인트를 결제해야 합니다. 해당 포인트는 도서를 등록한 유저에게 보내집니다.
	 */
	@PutMapping("/payment")
	public ResponseEntity<?> pointPayment(int point, String masterUsername, String userName){
		boolean result = service.pointPayment(point, masterUsername, userName);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : BookShareApiController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 5.
	 * @작성자 : 강민
	 * @설명 : 반납 기능 수행
	 */
	@DeleteMapping("/borrow-return")
	public ResponseEntity<?> shareBookBorrowEnd(ShareBookBorrowDto dto){
		boolean result = service.shareBookBorrowEnd(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	
	

}
