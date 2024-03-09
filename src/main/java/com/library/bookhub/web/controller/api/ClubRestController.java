package com.library.bookhub.web.controller.api;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.Club;
import com.library.bookhub.security.MyUserDetails;
import com.library.bookhub.security.UserDetailsServiceImpl;
import com.library.bookhub.service.ClubService;
import com.library.bookhub.web.dto.ClubSaveFormDto;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/club")
public class ClubRestController {

	@Autowired
	ClubService clubService;
	
	@Autowired
	private UserDetailsServiceImpl serviceImpl;
	
	// 독서모임 신청
	// Ajax로 보낸 데이터 아래와 같이 파라미터로 받음
	@PostMapping("/apply")
	public ResponseEntity<?> apply(Principal principal, Integer clubId) {
		
		// 인증검사
		// alert를 띄우고 신청하시겠습니까? 확인 클릭했을 때, Ajax 전송이 되서 여기 컨트롤러로 들어오는데
		// 로그인 안되었을 때는 신청 버튼 클릭하자마자 로그인 화면으로 이동해야하므로 스크립트 처리로 하는 게 맞다!!!
		
		log.info("clubId : " + clubId);
		log.info("userName : " + principal.getName());
		
		boolean result = clubService.createApplication(principal, clubId);
		
		
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
	
	// 모임 개설
	// 파일업로드 로직도 서비스에서 구현한다!
	@PostMapping("/save")
	public ResponseEntity<?> save(ClubSaveFormDto dto) {
		String username = serviceImpl.getUserId();
		
		boolean result = clubService.createClub(username, dto);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	// 모임 개설취소
	@DeleteMapping("/save")
	public ResponseEntity<?> deleteClub(Principal principal, Integer id) {
		
		boolean result = clubService.deleteClub(principal, id);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 찜하기
	@PostMapping("/wish")
	public ResponseEntity<?> wish(Principal principal, Integer clubId) {
		
		// 인증검사
		// alert를 띄우고 신청하시겠습니까? 확인 클릭했을 때, Ajax 전송이 되서 여기 컨트롤러로 들어오는데
		// 로그인 안되었을 때는 신청 버튼 클릭하자마자 로그인 화면으로 이동해야하므로 스크립트 처리로 하는 게 맞다!!!
		
		boolean result = clubService.createWishList(principal, clubId);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 찜하기 취소
	@DeleteMapping("/wish")
	public ResponseEntity<?> deleteWishList(Principal principal, Integer clubId) {
	
		boolean result = clubService.deleteWishList(principal, clubId);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 찜하기 여부에 따라 다르게 표시 / PostMapping 쓰자
	@PostMapping("/checkWish")
	public ResponseEntity<?> checkWish(Principal principal, Integer clubId) {
		
		boolean result = clubService.readClubWishListByClubIdAndUserName(principal, clubId);
		
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	// 모임 인기순 목록
	@GetMapping("/popular")
	public ResponseEntity<?> readClubListOrderByHcApply() {
		
		List<Club> clubList = clubService.readClubListOrderByHcApply();
		
		return new ResponseEntity<List<Club>>(clubList, HttpStatus.OK);
	}
}
