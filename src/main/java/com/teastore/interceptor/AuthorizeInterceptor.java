package com.teastore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.teastore.entity.Customer;

@Component
public class AuthorizeInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if(user == null) {
			session.setAttribute("back-url", request.getRequestURI()); 
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
