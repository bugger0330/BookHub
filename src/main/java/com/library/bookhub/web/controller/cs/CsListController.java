package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.service.CsService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class CsListController {

	@Autowired
	CsService csService;

	// 공지사항 리스트
	@GetMapping("/notice/list")
	public String noticePage(Model model) {

		List<CsNoticeEntity> noticeList = csService.selectCsNoticeList();
		model.addAttribute("noticeList", noticeList);

		System.out.println("noticeList" + noticeList);

		log.info(noticeList.toString());

		return "pages/cs/notice/list";
	}

	// 문의하기 리스트
	@GetMapping("/qna/list")
	public String qnaPage(Model model) {

		List<CsQnaEntity> qnaList = csService.selectCsQnaList();
		model.addAttribute("qnaList", qnaList);

		System.out.println("qnaList" + qnaList);

		log.info(qnaList.toString());

		return "pages/cs/qna/list";
	}

	// 자주 묻는 질문 리스트
	@GetMapping("/faq/list")
	public String faqPage(Model model) {

		List<CsFaqEntity> faqList = csService.selectCsFaqList();
		model.addAttribute("faqList", faqList);

		System.out.println("faqList" + faqList);

		log.info(faqList.toString());

		return "pages/cs/faq/list";
	}

	// 챗봇




}
