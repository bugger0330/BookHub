package com.library.bookhub.handler;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

/**
 * @fileName : CustomErrorPageController.java
 * @Project : BookHub
 * @Date : 2024. 3. 7.
 * @작성자 : 강민
 * @설명 : 
 */
@Controller
public class CustomErrorPageController implements ErrorController {
	
	@GetMapping("/error")
	public String errorPage(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if(status != null){
            int statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()) {
            	return "error";
            } 
        }
		return null;
	}
}