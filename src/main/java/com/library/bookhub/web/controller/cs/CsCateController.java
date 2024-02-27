package com.library.bookhub.web.controller.cs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.service.CsCateService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CsCateController {

	@Autowired
	private CsCateService csCateService;
	
	
	@GetMapping("/getCsCates")
    public Map<String, Object> getCsCates(){
		
        return csCateService.getCsCates();

    }
	
	

    @GetMapping("/layout/aside")
    public String list(Model model,@RequestParam("cate2") int cate1){

        List<CsCate1Entity> cate1list = csCateService.selectCsCate1();
        List<CsCate2Entity> cate2list = csCateService.selectCsCate2(cate1list.get(cate1));
        
        model.addAttribute("cate1list",cate1list);
        model.addAttribute("cate2list",cate2list);
        
        
        return "/pages/cs/layout/aside";

    }

    @ResponseBody
    @PostMapping("/layout/aside")
    public List<CsCate2Entity> cate2list(@RequestParam("cate2") int cate1) {
        log.info("cate2cate2cate2???" + cate1);
        List<CsCate2Entity> cate2list = csCateService.selectCsCate2(cate1);

        System.out.println(cate2list.toString());
        
        return cate2list;
    }
	
	

}
