package com.library.bookhub.repository;

import com.library.bookhub.entity.User;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface UserRepository {
  
	public List<User> findAll();
}
