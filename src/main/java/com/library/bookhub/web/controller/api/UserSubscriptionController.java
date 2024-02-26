package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.UserSubscription;
import com.library.bookhub.service.UserSubscriptionService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 유저구독 컨트롤러
 * @Author : 이준혁
 */
@Slf4j
@Controller
@RequestMapping("/subscriptions")
public class UserSubscriptionController {
    @Autowired
    private UserSubscriptionService userSubscriptionService;

    @GetMapping("/list")
    public String getAllUserSubscriptions(PageReq pageReq, Model model, @RequestParam(required = false) String userId) {
        // 기본 페이지 및 크기 설정
        if (pageReq.getPage() <= 0) {
            pageReq.setPage(1); // 페이지가 0이하인 경우 첫 페이지로 설정
        }
        if (pageReq.getSize() <= 0) {
            pageReq.setSize(10); // 페이지당 기본 개수 설정
        }

        // 페이징된 유저구독 목록 가져오기
        PageRes<UserSubscription> pageRes = userSubscriptionService.getUserSubscriptionsWithPaging(pageReq, userId);
        List<UserSubscription> userSubscriptionList = pageRes.getContent();
        log.info("Retrieved user subscription list: {}", userSubscriptionList);

        // 페이징 정보를 모델에 추가
        model.addAttribute("userSubscriptionList", userSubscriptionList);
        model.addAttribute("page", pageReq.getPage());
        model.addAttribute("size", pageRes.getSize());
        model.addAttribute("totalPages", pageRes.getTotalPages());
        model.addAttribute("startPage", pageRes.getStartPage());
        model.addAttribute("endPage", pageRes.getEndPage());

        return "pages/admin/usersubscriptionList";
    }

}
