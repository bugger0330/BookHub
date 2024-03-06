package com.library.bookhub.web.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.service.PointProductService;

/**
 * 포인트 상품 RestFul 컨트롤러
 * @Author : 이준혁
 */
@RestController
@RequestMapping("/api/point-product")
public class PointProductRestFulController {
	
	
	@Autowired
	private PointProductService pointProductService;
	
	
	 // 상품판매여부 상태값 수정
    @PutMapping("/poststatus/{id}")
    public ResponseEntity<?> updatePostStatus(@PathVariable int id, @RequestBody Map<String, String> requestBody) {
        String postYn = requestBody.get("post_yn");
        pointProductService.updatePostStatus(id, postYn);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

}
