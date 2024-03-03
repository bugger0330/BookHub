package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.repository.UserPointRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserPointService {
	
	@Autowired
	private UserPointRepository userPointRepository;
	
    @Autowired
    private UserService userService;
    
    
    
 // 페이징된 배너 목록 조회
 	public PageRes<UserPoint> getPointWithPaging(PageReq pageReq, String userId) {
 		int page = pageReq.getPage();
 		int size = pageReq.getSize();
 		int offset = (page - 1) * size; // 오프셋 계산

 		// 총 데이터 개수 조회
 		long totalElements = userPointRepository.getTotalCount();

 		// 페이징 처리된 유저 목록 조회
 		List<UserPoint> userPoint = userPointRepository.findAllUserPointPaging(offset, size, userId);

 		// 페이징 결과 객체 생성
 		PageRes<UserPoint> pageRes = new PageRes<>(userPoint, page, totalElements, size);

 		return pageRes;
 	}
	
	 // 상세조회
    public Optional<UserPoint> findById(int id) {
    	// db 상세조회 호출
    	Optional<UserPoint> optionalUserPoint = userPointRepository.findById(id);
    	
    	return optionalUserPoint;
    }
    
    public List<UserPoint> findByUserId(String userId){
    	List<UserPoint> userPoint = userPointRepository.findByUserId(userId);
    	return userPoint;
    }
    
    
    @Transactional
    public void save(UserPoint userPoint) {
        // 유저의 현재 포인트 가져오기
        User user = userService.getUserId(userPoint.getUserId());
        int currentPoint = user.getPoint();
        
        // 새로운 포인트 계산 및 업데이트
        int updatedPoint = currentPoint + userPoint.getPoint();
        user.setPoint(updatedPoint);
        userService.save(user);
        
        // 유저 포인트 정보 저장
        userPointRepository.save(userPoint);
        log.info("User point saved successfully for user with ID: {}", userPoint.getUserId());
    }


    // 환불처리 - 유저 포인트 차감
    @Transactional
    public void refund(UserPoint userPoint) {
        // 유저의 현재 포인트 가져오기
        User user = userService.getUserId(userPoint.getUserId());
        int currentPoint = user.getPoint();

        // 새로운 포인트 계산 및 업데이트
        int updatedPoint = currentPoint - userPoint.getPoint();
        user.setPoint(updatedPoint);
        userService.save(user);

        // 유저 포인트 정보 저장
        userPointRepository.refundUpdate(userPoint);
        log.info("User point saved successfully for user with ID: {}", userPoint.getUserId());
    }
    
    // 삭제함수
    public boolean removeById(int id) {
    	try {
			if(userPointRepository.existById(id) > 0) {
				userPointRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
    	return false;
    }
    
    // 유저 환불여부 변경
    @Transactional
    public void updateUserPoint(UserPoint userPoint) {
        userPointRepository.refundUpdate(userPoint);
    }
    
    
    public List<UserPoint> refundReq(){
    	return userPointRepository.refundReq();
    }


    public UserPoint findByImpUid(String impUid) {
    	return userPointRepository.findByImpUid(impUid);
    }

}
