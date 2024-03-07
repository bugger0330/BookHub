package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.service.CsCateService;
import com.library.bookhub.web.dto.cs.CsCate1Dto;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CsCateRestController {

	@Autowired
	private CsCateService csCateService;
	
	
	/**
	 * @fileName : CsCateRestController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 카테고리 트리를 가져오는 기능
	 */
    @GetMapping("/csCategory")
    public ResponseEntity<?> getCategory(){
        List<CsCate1Dto> cate1List = csCateService.selectCsCate1();
        return new ResponseEntity<List<CsCate1Dto>>(cate1List,HttpStatus.OK); 
    }
}