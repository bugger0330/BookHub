package com.library.bookhub.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.User;

@Mapper
public interface UserRepository {


    // 전체조회, 페이징처리
	List<User> findAllWithPagingAndUsername(@Param("offset") int offset, @Param("limit") int limit, @Param("name") String name);


    // 총 데이터의 개수 조회
    int getTotalCount();
    
    
    // 상세조회(1건조회)
    Optional<User> findById(int id);
    
    // 저장함수
    int insert(User user);
    
    // 수정함수
    int update(User user);
    
    // 삭제함수
    int deleteById(int id);
    
    // 기본키(id)가 있는지 확인하는 조회함수
    long existById(int id);
    
    
}

