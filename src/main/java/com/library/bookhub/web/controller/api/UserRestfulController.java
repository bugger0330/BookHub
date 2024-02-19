package com.library.bookhub.web.controller.api;

import com.library.bookhub.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class UserRestfulController {

    @Autowired
    private UserService userService;

    // 총 회원수 화면에 뿌리기
    @GetMapping("/totaluser")
    public long getTotalUserCount() {
        return userService.getTotalUserCount();
    }
}
