package com.onul.intercepter;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		if (userId != null && uri.startsWith("/user/sign")) {
			response.sendRedirect("/community/main");
			return false;
		} else if (userId == null && uri.startsWith("/post/create")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		log.warn("######## preHandle 호출, uri : {}", uri);
		return true;
	}
}
