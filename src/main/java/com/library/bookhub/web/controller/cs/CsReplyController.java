package com.library.bookhub.web.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public ResponseEntity<String> qnaReplyInsert(@PathVariable("qnaId") int qnaId, @RequestBody CsQnaReplyDto dto) {

		System.out.println(qnaId);
		
		boolean result = csQnaReplyService.qnaReplyInsert(dto, qnaId);

		System.out.println(result);
		
		if (result == true) {
			return ResponseEntity.ok("Success");
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
	}


}
