package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;

@Mapper
public interface ClubRepository {
	
	public int insert(Club club);
	public List<Club> findAll();
	public Club findById(Integer id);
	// RequestParam이 아니라 그냥 Param!
	public boolean insertApplication(
			@Param("clubId") Integer clubId, 
			@Param("userName") String userName);
	public void updateByApplication(Club club);
	public ClubApplication findByIdAndUserName(
			@Param("clubId") Integer clubId, 
			@Param("userName") String userName);

}
