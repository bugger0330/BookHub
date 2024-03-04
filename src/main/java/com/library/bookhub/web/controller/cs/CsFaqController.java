package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.service.CsFaqService;
import com.library.bookhub.service.CsQnaService;
import com.library.bookhub.web.dto.cs.PageReq;
import com.library.bookhub.web.dto.cs.PageRes;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsFaqController {

	@Autowired
	CsFaqService csFaqService;


	// 자주 묻는 질문 리스트
	@GetMapping("/faq/list")
	public String faqPage(Model model) {

		List<CsFaqEntity> faqList = csFaqService.selectCsFaqList();
		model.addAttribute("faqList", faqList);

		System.out.println("faqList" + faqList);

		log.info(faqList.toString());

		return "pages/cs/faq/list";
	}

}
