package com.library.bookhub.web.controller.page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.Club;
import com.library.bookhub.service.ClubService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/club")
public class ClubPageController {

	@Autowired
	ClubService clubService;
	
	// 목록
	@GetMapping(value={"/", "/index"})
	public String indexPage(Model model) {
		
		List<Club> clubList = clubService.readClubList();
		log.info("clubList : " + clubList);
		
		if(clubList.isEmpty()) {
			model.addAttribute("clubList", null);
		} else {
			model.addAttribute("clubList", clubList);
		}
		
		return "pages/club/index";
	}
	
	// 상세보기
	@GetMapping("/view/{id}")
	public String viewPage(@PathVariable Integer id, Model model) {
		
		Club club = clubService.readByClubId(id);
		model.addAttribute("club", club);
		
		return "pages/club/view";
	}
	
	// 등록
	@GetMapping("/save")
	public String savePage() {
		return "pages/club/save";
	}
	
	// 결제
	@GetMapping("/checkout")
	public String checkoutPage() {
		return "pages/club/checkout";
	}
	
	// 결제완료
	@GetMapping("/checkoutSuccess")
	public String checkoutSuccessPage() {
		return "pages/club/checkoutSuccess";
	}
	
	// 결제완료
	@GetMapping("/test")
	public String testPage() {
		return "pages/club/test";
	}
}



