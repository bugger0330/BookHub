package com.library.bookhub.web.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	// 문의글 상세보기 화면 띄우기
	@GetMapping("/qna/view")
	public String detail() {
		return "qna/view";
	}

	// 문의글 상세보기
	@GetMapping("/qna/view/{id}")
	@ResponseBody
	public CsQnaEntity qnaView(@PathVariable("id") int id) {

		System.out.println(id);
		
		CsQnaEntity csQnaEntity = csService.qnaView(id);

		return csQnaEntity;
	}

	// 문의글 수정하기
	@PostMapping("/qna/update/{id}")
	@ResponseBody
	private boolean qnaUpdate(@PathVariable int id, CsQnaDto dto) {
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
