package com.library.bookhub.web.controller.api;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.security.MyUserDetails;
import com.library.bookhub.service.ClubService;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.ClubSaveFormDto;

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
	
	// clubController에도 /save 같은 url로 설정되어있으면 프로젝트 실행 안되고 '사이트에 연결안됨' 오류뜸
	// 모임 개설
	@PostMapping("/save")
	public ResponseEntity<?> save(@AuthenticationPrincipal MyUserDetails myUserDetails, ClubSaveFormDto dto) {
		
		MultipartFile file = dto.getCustomFile();
		
		if(file.isEmpty() == false) {
			// 사용자가 이미지를 업로드했다면 기능구현
			// 파일 사이즈 체크
			// 20MB
			if(file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestFulException("파일 크기는 20MB 이상 클 수 없습니다", HttpStatus.BAD_REQUEST);
			}
			
			// 서버 컴퓨터에 파일 넣을 디렉토리가 있는지 검사
			String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
			// 폴더가 없다면 오류 발생(파일 생성시)
			File dir = new File(saveDirectory);
			if(dir.exists() == false) {
				dir.mkdir(); // 폴더가 없으면 폴더 생성 / work_spring폴더 자체가 없으면 upload폴더 생성 못함
			}
			
			// 파일 이름(중복처리 예방)
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			//System.out.println("file Name : " + fileName);
			log.info("fileName : " + fileName);
			
			// C:\\work_spring\\upload\ab.png
			String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName; // File.separator는 \ 를 나타낸다
			//System.out.println("uploadPath : " + uploadPath);
			log.info("uploadPath : " + uploadPath);
			File destination = new File(uploadPath);
			
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// 객체 상태 변경
			dto.setOriginFileName1(file.getOriginalFilename()); // ex) bag.jpeg
			dto.setUploadFileName1(fileName); // ex) 8f4b467e-3a72-41d6-ac9c-ed2a00b6b5eb_bag.jpeg
		}
		
		// MyUserDetails @ToString 어노테이션 있어서 log로 확인가능
		boolean result = clubService.createClub(myUserDetails, dto);
		
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
}
