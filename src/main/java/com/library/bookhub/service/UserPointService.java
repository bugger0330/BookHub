package com.library.bookhub.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.repository.UserPointRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserPointService {
	
	@Autowired
	private UserPointRepository userPointRepository;
	
    @Autowired
    private UserService userService;
	
	 // 상세조회
    public Optional<UserPoint> findById(int id) {
    	// db 상세조회 호출
    	Optional<UserPoint> optionalUserPoint = userPointRepository.findById(id);
    	
    	return optionalUserPoint;
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

}
