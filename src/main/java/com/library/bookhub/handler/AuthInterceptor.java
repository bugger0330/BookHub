package com.library.bookhub.handler;

import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.UnAuthorizedException;
import com.library.bookhub.utils.Define;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    // preHandle
    // 컨트롤러 들어오기 전에 동작
    // true -> 컨트롤러 안으로 들어감
    // false -> 안들어 감
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        // 인증 검사
        HttpSession session = request.getSession();
        User principal = (User) session.getAttribute(Define.PRINCIPAL); // 다운 캐스팅
        if(principal == null) {

            // response.sendRedirect("/user/sign-in");	// 로그인 페이지로 보내기
            // 예외처리
            throw new UnAuthorizedException("로그인 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }

        return true;
    }


    // postHandle
    // 컨트롤러 들어갔다가 뷰가 렌더링 되기 전에 호출 되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    // afterCompletion
    // 요청 처리가 완료된 후, 뷰가 렌더링이 완료된 후 호출 되는 메서드
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

}
