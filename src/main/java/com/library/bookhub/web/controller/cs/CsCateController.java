package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.service.CsCateService;
import com.library.bookhub.web.dto.cs.CsCate1Dto;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CsCateController {

	@Autowired
	private CsCateService csCateService;
	


    @GetMapping("/category")
    public ResponseEntity<?> getCategory(){

        List<CsCate1Dto> cate1list = csCateService.selectCsCate1();

        System.out.println(cate1list.get(0));

        return new ResponseEntity<List<CsCate1Dto>>(cate1list,HttpStatus.OK) ; //동기적, 페이지로 들어가는 순간 생김


    }


}
