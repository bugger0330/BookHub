package com.library.bookhub.security.oauth;

import java.io.Serializable;

import com.library.bookhub.entity.User;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SessionUser implements Serializable {
	private Long id;
	private String name;
    private String email;
    private String username;
    private String password;
    
    public SessionUser(User user) {
    	this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.username = user.getUserName();
        this.password = "";
    }
}
