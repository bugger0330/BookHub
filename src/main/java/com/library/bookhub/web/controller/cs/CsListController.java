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
import com.library.bookhub.web.dto.cs.PageReq;
import com.library.bookhub.web.dto.cs.PageRes;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsListController {

	@Autowired
	CsService csService;

	// 공지사항 리스트
	@GetMapping("/notice/list")
	public String noticePage(PageReq pageReq, Model model) {

		// 페이징
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지 당 보여줄 개수
		}

		PageRes<CsNoticeEntity> pageRes = csService.getNoticeUsingPage(pageReq); // 페이징 처리함
		List<CsNoticeEntity> noticeList = pageRes.getContent(); // 내용을 보여줄거다
		System.out.println("noticeList" + noticeList.size());

		// 페이징 정보를 모델에 추가
		model.addAttribute("noticeList", noticeList); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		System.out.println("CsNoticeEntity" + "여기까지오나");

		return "pages/cs/notice/list";
	}

	// 문의하기 리스트
	@GetMapping("/qna/list")
	public String qnaPage(PageReq pageReq, Model model) {

		// 페이징
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지 당 보여줄 개수
		}

		PageRes<CsQnaEntity> pageRes = csService.getQnaUsingPage(pageReq); // 페이징 처리함
		List<CsQnaEntity> qnaList = pageRes.getContent(); // 내용을 보여줄거다
		System.out.println("qnaList" + qnaList.size());

		// 페이징 정보를 모델에 추가
		model.addAttribute("qnaList", qnaList); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		System.out.println("CsQnaEntity" + "여기까지오나");

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

}
