package com.library.bookhub;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class BookhubApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookhubApplication.class, args);
	}

}
