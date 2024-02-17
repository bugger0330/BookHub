package com.library.bookhub.web.controller.api;

import com.library.bookhub.service.BannerAdService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class BannerAdRestFulController {

    @Autowired
    private BannerAdService bannerAdService;

    // 총 광고수 화면에 뿌리기
    @GetMapping("/totalad")
    public long getTotalAd() {
        return bannerAdService.getTotalAdCount();
    }
}
