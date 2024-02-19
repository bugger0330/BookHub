package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.User;
import com.library.bookhub.repository.UserRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;


    // 총 회원 수 조회 메서드
    public long getTotalUserCount() {
        return userRepository.getTotalCount();
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

        // 페이징 결과 객체 생성
        PageRes<User> pageRes = new PageRes<>(users, page, totalElements, size);

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
