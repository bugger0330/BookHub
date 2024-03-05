package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.service.CsNoticeService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsNoticeController {

	@Autowired
	CsNoticeService csNoticeService;

	// 공지사항 리스트 화면
	@GetMapping("/notice/list")
	public String noticePage() {
	
		return "pages/cs/notice/list";
	}
	
	// 공지사항 검색 리스트 
	@GetMapping("/api/notice/search-list")
	@ResponseBody
	public List<CsNoticeEntity> noticeSearchPage(String searchType, String searchInput) {
		System.out.println(searchType);
		System.out.println(searchInput);
		return csNoticeService.noticeSearchPage(searchType, searchInput);
	}
	
	// 공지사항 리스트
	@GetMapping("/api/notice/list")
	@ResponseBody
	public List<CsNoticeEntity> noticeList(){
		return csNoticeService.noticeList();
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

		CsNoticeEntity csNoticeEntity = csNoticeService.noticeView(id);

		return csNoticeEntity;
	}

}