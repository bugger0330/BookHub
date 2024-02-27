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
	
	 // 상세조회
    public Optional<UserPoint> findById(int id) {
    	// db 상세조회 호출
    	Optional<UserPoint> optionalUserPoint = userPointRepository.findById(id);
    	
    	return optionalUserPoint;
    }
    
    
    // 구매 정보 저장
    @Transactional
    public void save(UserPoint userPoint) {
        userPointRepository.save(userPoint);
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
