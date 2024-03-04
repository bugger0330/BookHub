package com.library.bookhub.web.controller.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.service.UserPointService;

import lombok.extern.slf4j.Slf4j;


/**
 * 유저 포인트 RestFul 컨트롤러(관리자)
 * @Author : 이준혁
 */
@Slf4j
@RestController
@RequestMapping("/user-point")
public class UserPointRestFulController {

	@Autowired
	private UserPointService userPointService;

	// 저장
	@PostMapping("/save")
	public void save(@RequestBody UserPoint userPoint) {

		userPointService.save(userPoint);
	}

	// 환불 - 포인트 차감

	@PostMapping("/refund-point")
	public void refund(@RequestBody UserPoint userPoint) {
		userPointService.refund(userPoint);
	}

	// 상세조회 컨트롤러
	@GetMapping("/detail")
	public ResponseEntity<?> findByUserId(@RequestParam(required = false) String userId) {
		List<UserPoint> userPoint = userPointService.findByUserId(userId);

		if (userPoint == null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(userPoint, HttpStatus.OK);
	}

	// 유저 환불 여부 상태변경
	@PutMapping("/refund")
	public ResponseEntity<?> updateUserPoint(@RequestBody UserPoint userPoint) {
		userPointService.updateUserPoint(userPoint);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	// 총 거래엑 가져오기
	@GetMapping("/getprice")
	 public long getTotalPrice() {
        return userPointService.findByPrice();
    }

}
