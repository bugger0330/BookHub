package com.library.bookhub.web.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

		boolean result = csService.qnaInsert(dto);

		if (result == true) {
			return "pages/cs/qna/list";
		}

		return "pages/cs/qna/insert";
	}

	// 문의글 상세보기
	@PostMapping("/qna/view")
	@ResponseBody
	public CsQnaEntity qnaView(int id) {

		CsQnaEntity csQnaEntity = csService.qnaView(id);

		return csQnaEntity;
	}

}
