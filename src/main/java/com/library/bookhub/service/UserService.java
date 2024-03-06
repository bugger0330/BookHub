package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.UserRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

/**
 * 유저 서비스
 * @Author : 이준혁
 */
@Slf4j
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;


    // 총 회원 수 조회 메서드
    public long getTotalUserCount() {
        return userRepository.getTotalCount();
    }
    
    // 유저 아이디로 회원찾기
    public User getUserId(String userId) {
    	return userRepository.findByUserId(userId);
    }
    
    
    @Transactional
    public void updateUserPoint(String userId, int newPoint) {
        // 유저 정보 조회
        User user = userRepository.findByUserId(userId);
        if (user != null) {
            // 유저의 포인트를 업데이트
            user.setPoint(newPoint);
            userRepository.update(user);
            log.info("User point updated successfully for user with ID: {}", userId);
        } else {
            log.error("User with ID {} not found", userId);
            // 유저를 찾을 수 없는 경우 예외 처리 또는 적절한 방법으로 처리
            
        }
    }

    // 페이징된 유저 목록 조회
    public PageRes<User> getUsersWithPaging(PageReq pageReq, String name) {
        int page = pageReq.getPage();
        int size = pageReq.getSize();
        int offset = (page - 1) * size; // 오프셋 계산
        
        // 총 데이터 개수 조회
        long totalElements = userRepository.getTotalCount();
        
        // 페이징 처리된 유저 목록 조회
        List<User> users = userRepository.findAllWithPagingAndUsername(offset, size, name);
        System.out.println("서비스 1: " + users);
        // 페이징 결과 객체 생성
        PageRes<User> pageRes = new PageRes<>(users, page, totalElements, size);
        System.out.println("서비스 : 2" + pageRes);

        return pageRes;
    }
    
    
    // 상세조회
    public Optional<User> findById(int id) {
    	// db 상세조회 호출
    	Optional<User> optionalUser = userRepository.findById(id);
    	
    	return optionalUser;
    }
    
    
    // 저장함수
    public int save(User user) {
    	int queryResult = -1;
    	try {
			if(user.getId() == null) {
				queryResult = userRepository.insert(user);
			} else {
				// 기본키가 없으면
				queryResult = userRepository.update(user);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
    	
    	return queryResult;
    }

    
    // 삭제함수
    public boolean removeById(int id) {
    	try {
			if(userRepository.existById(id) > 0) {
				userRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
    	return false;
    }
}
