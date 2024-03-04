package com.library.bookhub.web.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
		
		return "pages/cs/qna/view";
	}

	// QnaReply 작성하기
	@PostMapping("/qna/reply/{qnaId}")
	public String qnaReplyInsert(@PathVariable("qnaId") int qnaId, @ModelAttribute CsQnaReplyDto dto) {

		boolean result = csQnaReplyService.qnaReplyInsert(dto, qnaId);

		System.out.println(result);
		
		if (result == true) {
			return "redirect:/qna/list";
		}

		return "redirect:/qna/view";
	}


}
