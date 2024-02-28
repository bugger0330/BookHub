package com.library.bookhub.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.service.UserPointService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user-point")
public class UserPointRestFulController {
	
	@Autowired
	private UserPointService userPointService;
	
	
	 @PostMapping("/save")
	    public void save(@RequestBody UserPoint userPoint) {

		 userPointService.save(userPoint);
	    }
	
	
	

}
