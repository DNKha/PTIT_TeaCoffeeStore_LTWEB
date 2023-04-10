package com.teastore;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.teastore.interceptor.AdminAuthorizeInterceptor;
import com.teastore.interceptor.ShareInterceptor;

@Configuration
public class AdminInterceptorConfig  implements WebMvcConfigurer{
	
	@Autowired
	ShareInterceptor share;
	
	@Autowired
	AdminAuthorizeInterceptor auth;
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(share).addPathPatterns("/admin/account/login");
		registry.addInterceptor(auth)
			.addPathPatterns("/admin/home/index", "/admin/category/**", "/admin/product/**","/admin/customer/**", "/admin/order/**");
	}
}
