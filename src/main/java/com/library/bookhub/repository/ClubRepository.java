package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;

@Mapper
public interface ClubRepository {
	
	// 모임 개설
	public int insert(Club club);
	// 모임 목록
	public List<Club> findAll();
	// 모임 카테고리별 조회
	public List<Club> findByClubCate(Integer clubCate);
	// 검색 기능
	public List<Club> findByKeyword(String keyword);
	// 모임 상세보기
	public Club findById(Integer id);
	
	// 모임 신청
	// RequestParam이 아니라 그냥 Param!
	public boolean insertApplication(
			@Param("clubId") Integer clubId, 
			@Param("userName") String userName);
	// 모임 정보수정
	public void updateByApplication(Club club);
	// 모임 신청시 같은 아이디로 신청한 내역 있는지 조회
	public ClubApplication findApplicationByIdAndUserName(
			@Param("clubId") Integer clubId, 
			@Param("userName") String userName);
	
	// 개설 내역
	public List<Club> findByUserName(String userName);
	// 신청 내역
	public List<ClubApplication> findApplicationByUserName(String userName);
	// 신청 취소
	public boolean deleteApplication(Integer id);
	
	
	
	

}
