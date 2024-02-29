package com.library.bookhub.web.controller.page;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;
import com.library.bookhub.handler.exception.UnAuthorizedException;
import com.library.bookhub.security.MyUserDetails;
import com.library.bookhub.service.ClubService;
import com.library.bookhub.web.dto.ClubSearchFormDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/club")
public class ClubPageController {

	@Autowired
	ClubService clubService;
	
	@Autowired
	private HttpSession session;
	
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
	public String viewPage(@PathVariable Integer id, Principal principal, Model model) {
		
		Club club = clubService.readByClubId(id);
		model.addAttribute("club", club);
		
		// security 방식이라 UserController에서 session 속성으로 저장하는 코드 없음
		//User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// 로그인 안되어있으면 principal 객체 null이므로 실행오류 난다
		if(principal == null) {
			model.addAttribute("userName", null);
		}else {
			// 사용자 아이디 나타내기
			model.addAttribute("userName", principal.getName());
		}
		
		return "pages/club/view";
	}
	
	// 로그인이 필요한 페이지는 로그인 페이지로 이동하게 한 후 로그인하면 클릭했던 페이지 보여주기 
	// -> 어떻게하지??
	
	// 개설
	@GetMapping("/save")
	public String savePage(Principal principal) {
		
		// security 방식이라 UserController에서 session 속성으로 저장하는 코드 없음
		//User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// 로그인 안되어있으면 principal 객체 null이므로 실행오류 난다
		// -> null인 경우 작성해줘야함
		if(principal == null) {
			throw new UnAuthorizedException("로그인 정보가 없습니다", HttpStatus.UNAUTHORIZED);
		}
		
		return "pages/club/save";
	}
	
	// 개설내역
	@GetMapping("/saveList")
	public String saveListPage(Principal principal, Model model) {
		
		// security 방식이라 UserController에서 session 속성으로 저장하는 코드 없음
		//User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// 로그인 안되어있으면 principal 객체 null이므로 실행오류 난다
		// -> null인 경우 작성해줘야함
		if(principal == null) {
			throw new UnAuthorizedException("로그인 정보가 없습니다", HttpStatus.UNAUTHORIZED);
		}
		
		// 로그인 안된 상태에서 개설내역으로 들어와서 로그인 하게되면 개설내역으로 바로 가는 기능 뭘까!!!
		
		// 로그인한 사용자 아이디값 가져오기
		log.info("principal.getName() : " + principal.getName());
		
		List<Club> clubList = clubService.readClubListByUserName(principal.getName());
		
		if(clubList.isEmpty()) {
			model.addAttribute("clubList", null);
		}else {
			model.addAttribute("clubList", clubList);
		}
		
		return "pages/club/saveList";
	}
	
	// 신청내역
	@GetMapping("/applicationList")
	public String applicationListPage(@AuthenticationPrincipal MyUserDetails user, Model model) {
		
		if(user == null) {
			throw new UnAuthorizedException("로그인 정보가 없습니다", HttpStatus.UNAUTHORIZED);
		}
		
		
		// 로그인한 사용자 아이디값 가져오기
		// 1. MyUserDetails의 메서드로 바로 가져오기
		log.info(user.getUsername());
		// 2. MyUserDetails에 생성자 주입한 User를 가져와서 User의 속성 이용하기
		log.info(user.getUser().getUserName());
		
		List<ClubApplication> applicationList = clubService.readApplicationListByUserName(user.getUsername());
		
		if(applicationList.isEmpty()) {
			model.addAttribute("applicationList", null);
		}else {
			model.addAttribute("applicationList", applicationList);
		}
		
		return "pages/club/applicationList";
	}
	
	// 검색
	@GetMapping("/searchList")
	public String searchListPage(ClubSearchFormDto dto, Model model) {
		
	
		List<Club> clubList = clubService.readByKeyword(dto.getKeyword());
		
		
		if(clubList.isEmpty()) {
			model.addAttribute("clubList", null);
		} else {
			model.addAttribute("clubList", clubList);
		}
		
		// 검색어 입력했던 값 그대로 검색창에 띄우기
		model.addAttribute("keyword", dto.getKeyword());
		
		return "/pages/club/searchList";
	}
	
	
	
	
	
}



