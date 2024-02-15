package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.User;
import com.library.bookhub.service.UserService;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String getAllUsers(Model model) {
        List<User> userList = userService.getAllUsers();
        
        log.info("Retrieved user list: {}", userList);
        
        model.addAttribute("userList", userList);
        
        return "userlist";
    }
}
