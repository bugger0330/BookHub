package com.library.bookhub.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;

@Mapper
public interface UserPointRepository {
	
    // 저장함수
    public void save(UserPoint userPoint);
    
    // 수정함수
    public int update(UserPoint userPoint);
    
    // 삭제함수
    public int deleteById(int id);
    
    // 기본키(id)가 있는지 확인하는 조회함수
    public long existById(int id);
    
    
    // 상세조회(1건조회)
    public Optional<UserPoint> findById(int id);
}
