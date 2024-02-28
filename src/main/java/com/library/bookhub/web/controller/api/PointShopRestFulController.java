package com.library.bookhub.web.controller.api;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.service.PointShopService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/point-shop")
public class PointShopRestFulController {
	
	@Autowired
	private PointShopService pointShopService;
	
	// 전체조회
	@GetMapping("/list")
	public ResponseEntity<?> findAll(){
		List<PointShop> list = pointShopService.findAllPointShop();
		
		if(list.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 상세조회 컨트롤러
	@GetMapping("/detail")
	public ResponseEntity<?> findById(@RequestParam(required = false) Integer id){
		Optional<PointShop> pointShop = pointShopService.findById(id);
		
		if(pointShop == null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(pointShop, HttpStatus.OK);
	}
	
	

}
