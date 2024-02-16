package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.User;
import com.library.bookhub.service.UserService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

}
