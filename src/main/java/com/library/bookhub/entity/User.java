package com.library.bookhub.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class User {
    private Long id;
    private String userName;
    private String password;
    private String name;
    private int gender;
    private String phone;
    private String email;
    private int type;
    private int point;
    private String zip;
    private String addr1;
    private String addr2;
    private int status;
    private LocalDateTime wdate;
    private LocalDateTime rdate;
}
