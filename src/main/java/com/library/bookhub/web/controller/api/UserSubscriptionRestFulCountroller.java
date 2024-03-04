package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.UserSubscription;
import com.library.bookhub.service.UserSubscriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 유저구독 RestFul 컨트롤러
 * @Author : 이준혁
 */
@RestController
@RequestMapping("/subscriptions")
public class UserSubscriptionRestFulCountroller {

    @Autowired
    private UserSubscriptionService userSubscriptionService;

    @PostMapping("/save")
    public void saveSubscription(@RequestBody UserSubscription userSubscription) {


        // 구독 정보 저장
        userSubscriptionService.save(userSubscription);
    }


}
