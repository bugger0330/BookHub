package com.library.bookhub.security.oauth;

import java.io.Serializable;

import com.library.bookhub.entity.User;

import lombok.Getter;

@Getter
public class SessionUser implements Serializable {
	private String name;
    private String email;
    private String userName;
    private String password;
    
    public SessionUser(User user) {
        this.name = user.getName();
        this.email = user.getEmail();
        this.userName = user.getUserName();
        this.password = user.getPassword();
    }
}
