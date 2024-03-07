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

	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 사용자의 포인트를 가져오는 기능
	 */
	@PostMapping("/get")
	public ResponseEntity<?> getMyPoint(String userName){
		User user = pointService.getMyPoint(userName);
		return new ResponseEntity<Integer>(user.getPoint(), HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 리스트 형태의 주문 정보를 받아와서 결제 내역 등록 및 유저 포인트 업데이트
	 */
	@PostMapping("/order")
	public ResponseEntity<?> ProductOrder(@RequestBody List<PointOrderRequestDto> orderList){
		for(int i = 0; i < orderList.size(); i++) {
			System.out.println(orderList.get(i));
		}
		boolean result = pointService.ProductOrder(orderList);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 현재 사용중인 컴퓨터 자리를 가져오는 기능
	 */
	@GetMapping("/computer/used")
	public ResponseEntity<?> getComputerFlag(){
		List<Computer> list = pointService.getComputerFlag();
		return new ResponseEntity<List<Computer>>(list, HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 사용자가 컴퓨터 사용 신청을 할때 기능
	 */
	@PutMapping("/computer/use-flag")
	public ResponseEntity<?> computerUsedUpdate(@RequestBody List<ComputerRequestDto> dtos){
		boolean result = pointService.computerUsedUpdate(dtos);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 사용자가 그동안 주문한 주문 내역 출력
	 */
	@GetMapping("/my-order-list")
	public ResponseEntity<?> myOrderList(String username){
		List<PointOrder> list = pointService.myOrderList(username);
		return new ResponseEntity<List<PointOrder>>(list, HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 사용자가 주문 내역 페이지에서 상품 반품 요청시
	 */
	@PostMapping("/order/refund")
	public ResponseEntity<?> orderRefund(int id){
		boolean result = pointService.orderRefund(id);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	/**
	 * @fileName : PointController.java
	 * @Project : BookHub
	 * @Date : 2024. 3. 7.
	 * @작성자 : 강민
	 * @설명 : 사용자가 환불 요청시 포인트 업데이트
	 */
	@PostMapping("/mypoint/refund")
	public ResponseEntity<?> myPointRefund(PointOrderRequestDto dto){
		boolean result = pointService.myPointRefund(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
