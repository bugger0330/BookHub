package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.User;
import com.library.bookhub.security.oauth.SessionUser;
import com.library.bookhub.service.UserService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.Optional;

/**
 * 유저 컨트롤러
 * @Author : 이준혁
 */
@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String getAllUsers(PageReq pageReq, Model model, @RequestParam(required = false) String name) {
        // 기본 페이지 및 크기 설정
        if (pageReq.getPage() <= 0) {
            pageReq.setPage(1); // 페이지가 0이하인 경우 첫 페이지로 설정
        }
        if (pageReq.getSize() <= 0) {
            pageReq.setSize(10); // 페이지당 기본 개수 설정
        }

        // 페이징된 유저 목록 가져오기
        PageRes<User> pageRes = userService.getUsersWithPaging(pageReq, name);
        System.out.println(pageRes);
        List<User> userList = pageRes.getContent();
        System.out.println(userList);
        log.info("Retrieved user list: {}", userList);

        System.out.println(userList);
        // 페이징 정보를 모델에 추가
        model.addAttribute("userList", userList);
        model.addAttribute("page", pageReq.getPage());
        model.addAttribute("size", pageRes.getSize());
        model.addAttribute("totalPages", pageRes.getTotalPages());
        model.addAttribute("startPage", pageRes.getStartPage());
        model.addAttribute("endPage", pageRes.getEndPage());

        return "pages/admin/userlist";
    }

    
    // 상세조회
    @GetMapping("/detail/{id}")
    public String getUserId(@PathVariable int id, Model model) {
    	// 서비스 상세조회 호출
    	Optional<User> optionalUser = userService.findById(id);
    	model.addAttribute("user", optionalUser.get());
    	
    	return "pages/admin/userdetail";
    }
    
    // 저장함수 : db저장
    @PostMapping("/save")
    public RedirectView createUser(@ModelAttribute User user) {
    	// db 저장
    	userService.save(user);
    	// 페인페이지로 이동
    	return new RedirectView("/login");
    }
    
    // 수정함수 : 수정페이지로 이동 + 상세조회 1건
    @GetMapping("/update/{id}")
    public String editUser(@PathVariable int id, Model model) {
    	// 서비스 상세조회 함수 호출
    	Optional<User> optionalUser = userService.findById(id);
    	// jsp 전달
    	model.addAttribute("user", optionalUser.get());
    	return "pages/admin/update";
    }
    
    // 수정함수 : db 수정 저장
    @PutMapping("/edit/{id}")
    public RedirectView updateUser(@PathVariable int id, @ModelAttribute User user) {
        // db 수정 저장
        userService.save(user);
        // 전체조회 페이지로 이동
        return new RedirectView("/user/list");
    }
    
 // 삭제함수
    @DeleteMapping("/delete/{id}")
    public RedirectView deleteUser(@PathVariable int id) {
        userService.removeById(id);
        return new RedirectView("/user/list");
    }

    
    // 마이페이지
    @GetMapping("/mypage")
    public String myPage(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        // 현재 인증된 사용자 정보를 가져와서 모델에 추가합니다.
        model.addAttribute("user", userDetails);
        
        // mypage.html에 해당하는 뷰를 반환합니다.
        return "pages/myPage/myPageDetail";
    }
    
    
    @GetMapping("/principal")
    @ResponseBody
    public String getPrincipal(@AuthenticationPrincipal UserDetails userDetails,
    							@AuthenticationPrincipal OAuth2User auth2User, HttpSession httpSession) {
    	// 일반
    	if(userDetails != null) {
    		return userDetails.getUsername();
    	}
    	// 소셜
    	if(auth2User != null) {
    		SessionUser sessionUser = (SessionUser) httpSession.getAttribute("user");
    		return sessionUser.getUsername();
    	}
    	return "";
    }

}