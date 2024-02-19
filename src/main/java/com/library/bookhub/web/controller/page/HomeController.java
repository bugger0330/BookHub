package com.library.bookhub.web.controller.page;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.service.BannerAdService;
import com.library.bookhub.web.dto.BannerAdFormDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private BannerAdService bannerAdService;

    @GetMapping("/")
    public String testPage(Model model, @RequestParam(required = false) Integer id){

        List<BannerAd> list = bannerAdService.findById(id);
        model.addAttribute("banner", list);

        return "home";
    }
}
