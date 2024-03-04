package com.library.bookhub.web.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsCateController {

	
    @GetMapping("/layout/asideCsCate")
    public String asideCsCate(){

        return "pages/cs/layout/asideCsCate";

    }


}
