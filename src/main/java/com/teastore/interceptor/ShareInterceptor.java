package com.teastore.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.teastore.dao.CategoryDAO;
import com.teastore.entity.Category;

@Component
public class ShareInterceptor implements HandlerInterceptor{
	
	@Autowired
	CategoryDAO dao;
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category>  list = dao.findAll();
		request.setAttribute("cates",list);
	}
}
