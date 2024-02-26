package com.library.bookhub.web.controller.api;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.service.ClubService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/club")
public class ClubRestController {

	@Autowired
	ClubService clubService;
	
	// 독서모임 신청
	// Ajax로 보낸 데이터 아래와 같이 파라미터로 받음
	@PostMapping("/apply")
	public ResponseEntity<?> Apply(Integer clubId, String userName) {
		
		//boolean result = bookService.bookBorrow(bookId, username);
		log.info("clubId : " + clubId);
		log.info("userName : " + userName);
		
		boolean result = clubService.createApplication(clubId, userName);
		
		
		// ResponseEntity는 제네릭이라 모든 타입을 받을 수 있음
		// RestController는 무조건 return 값이 있다
		return new ResponseEntity<Boolean>(result, HttpStatus.OK); 
	}
	
	// 독서모임 신청취소
	@DeleteMapping("/apply")
	public ResponseEntity<?> deleteApplication(Integer id, Integer clubId) {
		
		boolean result = clubService.deleteApplication(id, clubId);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);  // userName 파라미터 보내야하는건가??
	}
	
	
	
	
	
}
