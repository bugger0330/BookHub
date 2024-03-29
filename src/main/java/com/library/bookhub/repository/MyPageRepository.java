package com.library.bookhub.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.User;

@Mapper
public interface MyPageRepository {

    User findById(Long id);

    int myPageUpdate(User user);

    int myPageDeleteById(User user);

}