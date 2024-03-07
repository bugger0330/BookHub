package com.library.bookhub.handler.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.FOUND)
public class RedirectException extends RuntimeException {
    private String redirectUrl;

    public RedirectException(String redirectUrl) {
        super("Redirecting to " + redirectUrl);
        this.redirectUrl = redirectUrl;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }
}
