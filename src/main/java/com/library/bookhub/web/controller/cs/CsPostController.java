package com.library.bookhub.web.controller.cs;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.service.CsService;
import com.library.bookhub.web.dto.cs.CsQnaDto;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsPostController {

	@Autowired
	CsService csService;

	// 문의글 작성하기 화면
	@GetMapping("/qna/insert")
	public String qnaInsertPage() {

		return "pages/cs/qna/insert";
	}

	// 문의글 작성하기
	@PostMapping("/qna/insert")
	@ResponseBody
	public String qnaInsert(CsQnaDto dto) {

		System.out.println(dto.toString());

		/*
		 * // 파일 업로드 List<MultipartFile> file = dto.getOfile1(); if (file.isEmpty() ==
		 * false) { // 사용자가 이미지를 업로드 했다면 기능 구현 // 1.파일 사이즈 체크 if (file.getSize() >
		 * Define.MAX_FILE_SIZE) { throw new
		 * CustomRestfulException("파일 크기는 20MB 이상 클 수 없습니다.", HttpStatus.BAD_REQUEST); }
		 * // 서버 컴퓨터에 파일을 넣을 디렉토리가 있는지 검사, 없다면 생성 String saveDirectory =
		 * Define.UPLOAD_FILE_DERECTORY; // 폴더 없다면 오류 발생(파일 업로드 시) File dir = new
		 * File(saveDirectory); if (dir.exists() == false) { dir.mkdir(); // 폴더 없으면 폴더
		 * 생성 } // 파일 이름(중복 처리 예방) UUID uuid = UUID.randomUUID(); String fileName = uuid
		 * + "_" + file.getOriginalFilename(); System.out.println("fileName : " +
		 * fileName);
		 * 
		 * // 파일 업로드 // C:\\work_spring\\upload/ab.png String uploadPath =
		 * Define.UPLOAD_FILE_DERECTORY + File.separator + fileName; File destination =
		 * new File(uploadPath);
		 * 
		 * try { file.transferTo(destination); } catch (IllegalStateException |
		 * IOException e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 * 
		 * // 객체 상태 변경 dto.setOriginFileName(file.getOriginalFilename());
		 * dto.setUploadFileName(fileName); }
		 * 
		 * // 유효성 검사 이후 service로 넘겨주기(회원가입만 파일업로드X)
		 * 
		 * userService.createUser(dto); // (바인딩된 dto를 가지고 서비스의 create메서드로 감)
		 * 
		 * // todo 로그인 페이지로 변경 예정 return "redirect:/user/sign-in"; }
		 * 
		 * boolean result = csService.qnaInsert(dto);
		 * 
		 * if(result==true) { return "pages/cs/qna/list"; }
		 */

	return"pages/cs/qna/insert";
	}

	// 문의글 상세보기 화면 띄우기
	@GetMapping("/qna/view/{id}")
	public String detailQna() {
		return "pages/cs/qna/view";
	}

	// 문의글 상세보기
	@PostMapping("/qna/view")
	@ResponseBody
	public CsQnaEntity qnaView(int id) {

		System.out.println(id);

		CsQnaEntity csQnaEntity = csService.qnaView(id);

		return csQnaEntity;
	}

	// 공지사항 상세보기 화면 띄우기
	@GetMapping("/notice/view/{id}")
	public String detailNotice() {
		return "pages/cs/notice/view";
	}

	// 공지사항 상세보기
	@PostMapping("/notice/view")
	@ResponseBody
	public CsNoticeEntity noticeView(int id) {
		
		System.out.println(id);
		
		CsNoticeEntity csNoticeEntity = csService.noticeView(id);
		
		return csNoticeEntity;
	}

	// 문의글 수정하기 화면 띄우기
	@GetMapping("/qna/update/{id}")
	public String update() {
		return "pages/cs/qna/update";
	}

	// 문의글 수정하기
	@PostMapping("/qna/update/{id}")
	@ResponseBody
	public boolean qnaUpdate(@PathVariable int id, CsQnaDto dto) {
		
		System.out.println("아이디 번호"+id);
		System.out.println("데이터"+dto.toString());
		
		boolean result = csService.qnaUpdate(id, dto);

		return result;

	}

	// 문의글 삭제하기
	@PostMapping("/qna/delete/{id}")
	@ResponseBody
	public boolean qnaDelete(@PathVariable int id) {
		boolean result = csService.qnaDelete(id);

		return result;
	}

}