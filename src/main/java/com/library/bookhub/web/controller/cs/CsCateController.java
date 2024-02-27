package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.service.CsCateService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsCateController {

	@Autowired
	private CsCateService csCateService;
	


    @GetMapping("/layout/aside")
    public String list(Model model){

        List<CsCate1Entity> cate1list = csCateService.selectCsCate1();
        
        model.addAttribute("cate1list", cate1list);

        
        
        return "/pages/cs/layout/aside";

    }

    
    @GetMapping("/board/subcategories/{cate1}")
    @ResponseBody
    public List<CsCate2Entity> loadCategory2(@PathVariable("cate1") int cate1, Model model) {
    	
    	System.out.println("컨트롤러11: " + cate1);
    	
    	
    	
    	List<CsCate2Entity> cate2 = csCateService.selectCsCate2(cate1);
    	
    	System.out.println("컨트롤러2222: " + cate2);
    	
    	model.addAttribute("cate2",cate2);
    	
    		
    	
        return cate2;
    } 


	

}
