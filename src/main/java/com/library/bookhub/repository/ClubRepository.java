package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.Club;

@Mapper
public interface ClubRepository {
	
	public int insert(Club club);
	public List<Club> findAll();

}
