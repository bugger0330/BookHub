package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.service.CsNoticeService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CsNoticeRestFulController {

	@Autowired
	private CsNoticeService csNoticeService;

	// 메인화면에 띄울 전체공지사항리스트
	@GetMapping("/api/notice")
	public List<CsNoticeEntity> getCsNoticeList() {
		return csNoticeService.selectCsNoticeList();
	}

	// 공지사항 상세조회
	@GetMapping("/api/notice/{id}")
	public CsNoticeEntity getNoticeView(@PathVariable int id) {
		return csNoticeService.noticeView(id);
	}

}
