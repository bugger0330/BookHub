package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.User;
import com.library.bookhub.service.UserService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.Optional;

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
        List<User> userList = pageRes.getContent();
        log.info("Retrieved user list: {}", userList);

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


}
