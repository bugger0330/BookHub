package com.library.bookhub.repository;

import com.library.bookhub.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface UserRepository {

	List<User> findAllWithPagingAndUsername(@Param("offset") int offset, @Param("limit") int limit, @Param("name") String name);


    // 총 데이터의 개수 조회
    int getTotalCount();
}

