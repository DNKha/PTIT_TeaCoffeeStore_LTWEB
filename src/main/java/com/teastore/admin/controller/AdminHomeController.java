package com.teastore.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teastore.dao.CustomerDAO;
import com.teastore.dao.OrderDAO;
import com.teastore.dao.OrderDetailDAO;
import com.teastore.dao.ReportDAO;
import com.teastore.entity.Customer;
import com.teastore.entity.Order;
import com.teastore.service.CookieService;

@Controller
public class AdminHomeController {

	@Autowired
	CustomerDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	CookieService cookie;
	
	@Autowired
	OrderDAO dDao;
	
	@Autowired
	ReportDAO rDao;
	
	@RequestMapping("/admin/home/index")
	public String index(Model model) {
		model.addAttribute("list", dDao.findAll());
		model.addAttribute("data", rDao.revenueNewMonth());
		return "admin/home/index";
	}
	
	@GetMapping("/admin/account/login")
	public String login(Model model) {

		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}

		return "admin/account/login";
	}

	@PostMapping("/admin/account/login")
	public String login(Model model,

			@RequestParam("id") String id,

			@RequestParam("pw") String pw,

			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");
			return "admin/account/login";
		} else if (!BCrypt.checkpw(pw, user.getPassword())) {
			model.addAttribute("message", "Invalid Password!");
			return "admin/account/login";
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Your account is not actived!");
			return "admin/account/login";
		} else if (!user.getAdmin()) {
			model.addAttribute("message", "Your account is not admin!");
			return "admin/account/login";
		} else {
			model.addAttribute("message", "Login success!");
			session.setAttribute("user", user);

			if (rm == true) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				cookie.delete("pass");
			} // quay lại trang trước đó đc bảo vệ

			
			/*
			 * String backUrl = (String) session.getAttribute("back-url"); if (backUrl !=
			 * null) { return "redirect:" + backUrl; }
			 */
			 
		}
		return "redirect:/admin/home/index";
	}

	@RequestMapping("/admin/home/logoff")
	public String logoff(Model model) {
		session.removeAttribute("user");
		return "redirect:/admin/home/index";
	}

}
