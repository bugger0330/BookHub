package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.service.CsFileService;
import com.library.bookhub.service.CsQnaService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import com.library.bookhub.web.dto.cs.CsQnaDto;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsQnaController {

	@Autowired
	CsQnaService csQnaService;

	@Autowired
	CsFileService csFileService;

	// Qna 리스트
	@GetMapping("/qna/list")
	public String qnaPage(PageReq pageReq, Model model) {

		System.out.println("a");
		// 페이징
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0 이하일 경우 첫 페이지로 설정한다
		}

		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지 당 보여줄 개수
		}

		PageRes<CsQnaEntity> pageRes = csQnaService.getQnaUsingPage(pageReq); // 페이징 처리함
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

	// Qna 작성하기 화면
	@GetMapping("/qna/insert")
	public String qnaInsertPage() {
		System.out.println("b");
		return "pages/cs/qna/insert";
	}

	// Qna 작성하기
	@PostMapping("/qna/insert")
	public String qnaInsert(CsQnaDto dto) {
		System.out.println("c");
		System.out.println(dto.toString());

		// 파일 저장
		String filepath = csFileService.saveFiles(dto.getFilepath());

		System.out.println("filepath 확인" + filepath.toString());

		boolean result = csQnaService.qnaInsert(dto, filepath);

		System.out.println(result);
		
		if (result == true) {
			return "pages/cs/qna/list";
		}

		return "pages/cs/qna/list";
	}

	// Qna 상세보기 화면 띄우기
	@GetMapping("/qna/view/{id}")
	public String detailQna() {
		System.out.println("d");
		return "pages/cs/qna/view";
	}

	// Qna 상세보기
	@PostMapping("/qna/view")
	@ResponseBody
	public CsQnaEntity qnaView(int id) {
		System.out.println("e");
		System.out.println(id);

		CsQnaEntity csQnaEntity = csQnaService.qnaView(id);

		return csQnaEntity;
	}


	// Qna 수정하기 화면 띄우기
	@GetMapping("/qna/update/{id}")
	public String update() {
		System.out.println("f");
		return "pages/cs/qna/update";
	}

	// Qna 수정하기
	@PostMapping("/qna/update/{id}")
	@ResponseBody
	public boolean qnaUpdate(@PathVariable int id, CsQnaDto dto) {
		System.out.println("g");
		System.out.println("아이디 번호" + id);
		System.out.println("데이터" + dto.toString());

		boolean result = csQnaService.qnaUpdate(id, dto);

		return result;

	}

	// Qna 삭제하기
	@PostMapping("/qna/delete/{id}")
	@ResponseBody
	public boolean qnaDelete(@PathVariable int id) {
		System.out.println("h");
		boolean result = csQnaService.qnaDelete(id);

		return result;
	}

}
