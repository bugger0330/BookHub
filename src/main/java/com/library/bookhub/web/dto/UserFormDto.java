package com.library.bookhub.web.dto;


import lombok.Data;

/**
 * 유저 등록 폼 DTO
 * @Author : 이준혁
 */
@Data
public class UserFormDto {

    private Integer id;
    private String username;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String zip;
    private String addr1;
    private String gender;
}
