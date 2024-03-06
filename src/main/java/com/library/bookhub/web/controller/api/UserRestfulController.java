package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.User;
import com.library.bookhub.service.UserService;
import lombok.extern.slf4j.Slf4j;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * 유저 RestFul 컨트롤러
 * @Author : 이준혁
 */
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
    
    
    // 회원아이디로 회원조회
    @GetMapping("/getid/{userId}")
    public User getUserInfo(@PathVariable String userId) {
    	return userService.getUserId(userId);
    }
    
    // 유저 상세조회

    @GetMapping("/findbyuser/{id}")
    public ResponseEntity<User> getUserId(@PathVariable int id) {
        // 서비스 상세조회 호출
        Optional<User> optionalUser = userService.findById(id);
        
        if (optionalUser.isPresent()) {
            return ResponseEntity.ok().body(optionalUser.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    
 
    
}
