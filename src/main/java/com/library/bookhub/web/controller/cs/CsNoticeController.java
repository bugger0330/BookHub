package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.service.CsNoticeService;
import com.library.bookhub.service.CsQnaService;
import com.library.bookhub.web.dto.cs.PageReq;
import com.library.bookhub.web.dto.cs.PageRes;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsNoticeController {

	@Autowired
	CsNoticeService csNoticeService;

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

		PageRes<CsNoticeEntity> pageRes = csNoticeService.getNoticeUsingPage(pageReq); // 페이징 처리함
		List<CsNoticeEntity> noticeList = pageRes.getContent(); // 내용을 보여줄거다
		System.out.println("noticeList" + noticeList.size());
		System.out.println("noticeList" + noticeList.toString());

		// 페이징 정보를 모델에 추가
		model.addAttribute("noticeList" , noticeList); // 프로젝트 마다 다른 코드
		// 공통 코드
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		
		System.out.println("CsNoticeEntity" + "여기까지오나");

		return "pages/cs/notice/list";
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
