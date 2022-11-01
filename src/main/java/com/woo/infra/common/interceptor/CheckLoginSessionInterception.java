package com.woo.infra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("sessSeq") != null) {
			// by pass
		} else {			
			response.sendRedirect("/signIn");
			
			System.out.println("로그인세션 없이는 접근 불가능한 페이지입니다. servlet-context 파일을 확인해주세요!");
			
            return false;
		}
		return super.preHandle(request, response, handler);
	}

}
