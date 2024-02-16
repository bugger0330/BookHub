package com.library.bookhub.service;

import com.library.bookhub.entity.User;
import com.library.bookhub.repository.UserRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // 모든 유저 목록 조회
    public List<User> getAllUsers(int offset, int size, String name) {
        return userRepository.findAllWithPagingAndUsername(offset, size, name);
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
}
