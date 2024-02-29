package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.Computer;
import com.library.bookhub.entity.PointOrder;
import com.library.bookhub.entity.User;
import com.library.bookhub.service.PointService;
import com.library.bookhub.web.dto.point.ComputerRequestDto;
import com.library.bookhub.web.dto.point.PointOrderRequestDto;

@RestController
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointService pointService;

	@PostMapping("/get")
	public ResponseEntity<?> getMyPoint(String userName){
		User user = pointService.getMyPoint(userName);
		System.out.println("내포인트===========" + user.getPoint());
		return new ResponseEntity<Integer>(user.getPoint(), HttpStatus.OK);
	}
	
	@PostMapping("/order")
	public ResponseEntity<?> ProductOrder(@RequestBody List<PointOrderRequestDto> orderList){
		for(int i = 0; i < orderList.size(); i++) {
			System.out.println(orderList.get(i));
		}
		boolean result = pointService.ProductOrder(orderList);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/computer/used")
	public ResponseEntity<?> getComputerFlag(){
		List<Computer> list = pointService.getComputerFlag();
		return new ResponseEntity<List<Computer>>(list, HttpStatus.OK);
	}
	
	@PutMapping("/computer/use-flag")
	public ResponseEntity<?> computerUsedUpdate(@RequestBody List<ComputerRequestDto> dtos){
		boolean result = pointService.computerUsedUpdate(dtos);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/my-order-list")
	public ResponseEntity<?> myOrderList(String username){
		List<PointOrder> list = pointService.myOrderList(username);
		return new ResponseEntity<List<PointOrder>>(list, HttpStatus.OK);
	}
	
	@PostMapping("/order/refund")
	public ResponseEntity<?> orderRefund(int id){
		boolean result = pointService.orderRefund(id);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@PostMapping("/mypoint/refund")
	public ResponseEntity<?> myPointRefund(PointOrderRequestDto dto){
		boolean result = pointService.myPointRefund(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
