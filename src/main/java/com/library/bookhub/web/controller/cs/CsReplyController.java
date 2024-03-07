package com.library.bookhub.web.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.entity.cs.CsQnaReplyEntity;
import com.library.bookhub.service.CsQnaReplyService;
import com.library.bookhub.web.dto.cs.CsQnaReplyDto;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsReplyController {

	@Autowired
	CsQnaReplyService csQnaReplyService;

	// QnaReply 작성하기 화면
	@GetMapping("/qna/reply/{qnaId}")
	public String qnaReplyInsertPage(@PathVariable("qnaId") int qnaId, Model model) {

		model.addAttribute("qnaId", qnaId);

		System.out.println(qnaId);

		return "pages/cs/qna/view";
	}

	// QnaReply 작성하기
	@PostMapping("/qna/reply/{qnaId}")
	@ResponseBody
	public boolean qnaReplyInsert(@PathVariable("qnaId") int qnaId, @RequestBody CsQnaReplyDto dto,
			@AuthenticationPrincipal UserDetails userDetails) {

		String userId = userDetails.getUsername();

		dto.setQnaId(qnaId);

		boolean result = csQnaReplyService.qnaReplyInsertAndUpdateQna(dto, qnaId, userId);

		return result;
	}

	/*
	 * // QnaReply 상세보기 화면 띄우기
	 * 
	 * @GetMapping("/qna/reply/{qnaId}") public String detailQnaReply() {
	 * 
	 * return "pages/cs/qna/view"; }
	 */

	// QnaReply 상세보기
	@PostMapping("/qna/reply")
	@ResponseBody
	public CsQnaReplyEntity qnaReplyView(int qnaId) {

		CsQnaReplyEntity csQnaReplyEntity = csQnaReplyService.qnaReplyView(qnaId);
		System.out.println("여기는 컨트롤러 " + csQnaReplyEntity);
		
		return csQnaReplyEntity;
	}

}
