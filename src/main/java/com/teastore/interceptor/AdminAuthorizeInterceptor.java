package com.teastore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.teastore.entity.Customer;

@Component
public class AdminAuthorizeInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if(user == null) {
			//session.setAttribute("back-url", request.getRequestURI()); 
			response.sendRedirect("/admin/account/login");
			return false;
		}else {
			if(user.getAdmin()==false) {
				//session.setAttribute("back-url", request.getRequestURI()); 
				response.sendRedirect("/admin/account/login");
				return false;
			}
		}
		return true;
	}
}
