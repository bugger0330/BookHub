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

import lombok.Delegate;

@RestController
@RequestMapping("/share")
public class BookShareApiController {
	
	@Autowired
	private BookShareService service;

	@PostMapping("/book/write")
	public ResponseEntity<?> shareBookWrite(@RequestPart(value="shareInfo") ShareWriteReqDto dto, 
			@RequestPart(value = "file", required = false) MultipartFile file1){
		dto.setFile(file1);
		boolean result = service.shareBookWrite(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@PostMapping("/mypoint")
	public ResponseEntity<?> orderMyPoint(String userName, int price){
		boolean result = service.orderMyPoint(userName, price);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/product/all")
	public ResponseEntity<?> getShareBookALL(){
		List<BookShare> list = service.getShareBookALL();
		return new ResponseEntity<List<BookShare>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/info/{id}")
	public ResponseEntity<?> getShareBook(@PathVariable int id){
		BookShare bookShare = service.getShareBook(id);
		return new ResponseEntity<BookShare>(bookShare, HttpStatus.OK);
	}
	
	@PostMapping("/borrow")
	public ResponseEntity<?> shareBookBorrow(ShareBookBorrowDto dto){
		System.out.println(dto);
		boolean result = service.shareBookBorrow(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@PutMapping("/payment")
	public ResponseEntity<?> pointPayment(int point, String masterUsername, String userName){
		boolean result = service.pointPayment(point, masterUsername, userName);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@DeleteMapping("/borrow-return")
	public ResponseEntity<?> shareBookBorrowEnd(ShareBookBorrowDto dto){
		boolean result = service.shareBookBorrowEnd(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	
	

}