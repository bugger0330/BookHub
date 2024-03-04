package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;
import com.library.bookhub.entity.ClubWishList;
import com.library.bookhub.entity.User;

@Mapper
public interface ClubRepository {
	
	// 모임 개설
	public boolean insert(Club club);
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
	public boolean insertApplication(ClubApplication clubApplication);
	// 모임 정보수정
	public void updateByApplication(Club club);
	// 모임 신청시 같은 아이디로 신청한 내역 있는지 조회
	public ClubApplication findApplicationByIdAndUserName(
			@Param("clubId") Integer clubId, 
			@Param("userName") String userName);
	// 보류
	// 모임 신청시 자신이 개설한 모임인지 확인
	public void findByUserNameAndId();
	
	// 개설내역
	public List<Club> findByUserName(String userName);
	// 신청내역
	public List<ClubApplication> findApplicationByUserName(String userName);
	
	// 신청취소
	public boolean deleteApplication(Integer id);
	
	// 회원정보 조회(포인트 수정하기 위함)
	public User findUserByUserName(String userName);
	// 포인트 수정후 회원정보 수정
	public void updatePoint(User user);
	
	// 개설취소(신청 내역없으면 취소 가능, 신청 내역 있으면 관리자 승인)
	public boolean delete(Integer id);
	// 개설취소할 때 해당 독서모임 신청내역 있는지 조회
	public List<ClubApplication> findApplicationByClubId(Integer clubId);
	
	// 찜하기
	public boolean insertWishList(ClubWishList clubWishList);
	// 찜하기 취소
	public boolean deleteWishList(Integer clubId, String userName);
	// 찜하기 목록
	public List<ClubWishList> findWishListByUserName(String userName);
	// 찜하기 목록에 있는지 조회
	public ClubWishList findWishListByClubIdAndUserName(Integer clubId, String userName);
}
