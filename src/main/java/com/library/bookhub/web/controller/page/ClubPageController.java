package com.library.bookhub.web.controller.page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;
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
	
	// 카테고리별 목록
	@GetMapping("/list/{clubCate}")
	public String ListPage(@PathVariable Integer clubCate, Model model) {
		
		List<Club> clubList = clubService.readByClubCate(clubCate);
		model.addAttribute("clubList", clubList);
		// 카테고리번호 이용해서 카테고리 타이틀 제목, 이미지 다르게 표시하기 위함
		model.addAttribute("clubCate", clubCate);
		
		return "/pages/club/list";
	}
	
	// 상세보기
	@GetMapping("/view/{id}")
	public String viewPage(@PathVariable Integer id, Model model) {
		
		Club club = clubService.readByClubId(id);
		model.addAttribute("club", club);
		
		return "pages/club/view";
	}
	
	// 로그인이 필요한 페이지는 로그인 페이지로 이동하게 한 후 로그인하면 클릭했던 페이지 보여주기 
	// -> 어떻게하지??
	
	// 등록
	@GetMapping("/save")
	public String savePage() {
		return "pages/club/save";
	}
	
	// 개설내역
	@GetMapping("/saveList/{userName}")
	public String saveListPage(@PathVariable String userName, Model model) {
		
		List<Club> clubList = clubService.readClubListByUserName(userName);
		model.addAttribute("clubList", clubList);
		
		return "pages/club/saveList";
	}
	
	// 신청내역
	@GetMapping("/applicationList/{userName}")
	public String applicationListPage(@PathVariable String userName, Model model) {
		
		List<ClubApplication> applicationList = clubService.readApplicationListByUserName(userName);
		// 신청내역 없으면(null), 그냥 없는 채로 화면 뜨더라
		model.addAttribute("applicationList", applicationList);
		
		
		
		// userName 파라미터 값 없을 때는 페이지에 신청내역이 없습니다? 아니면 로그인 화면으로?
		
		return "pages/club/applicationList";
	}
	
	
	
	
	
	
	
	
	
	
	// 결제완료
	@GetMapping("/test")
	public String testPage() {
		return "pages/club/test";
	}
}



