package com.teastore.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teastore.bean.MailInfo;
import com.teastore.dao.CustomerDAO;
import com.teastore.entity.Customer;
import com.teastore.service.CookieService;
import com.teastore.service.MailService;

@Controller
public class AccountController {

	@Autowired
	CustomerDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	CookieService cookie;

	@Autowired
	ServletContext app;

	@Autowired
	MailService mailer;

	@Autowired
	HttpServletRequest request;

	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}

		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không hợp lệ!");
			return "account/login";
		} else if (/* !pw.equals(user.getPassword()) */ !BCrypt.checkpw(pw, user.getPassword())) {
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không hợp lệ!");
			return "account/login";
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Tài khoản chưa được kích hoạt!");
			return "account/login";
		} else {
			model.addAttribute("message", "Đăng nhập thành công!");
			session.setAttribute("user", user);

			if (rm == true) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				cookie.delete("pass");
			}
			// quay lại trang trước đó đc bảo vệ
			String backUrl = (String) session.getAttribute("back-url");
			if (backUrl != null) {
				return "redirect:" + backUrl;
			}
		}
		return "redirect:/home/index";
	}

	@RequestMapping("/account/logoff")
	public String logoff(Model model) {
		session.removeAttribute("user");
		return "redirect:/home/index";
	}

	@GetMapping("/account/register")
	public String register(Model model) {
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/register";
	}

	@PostMapping("/account/register")
	public String register(Model model, @Validated @ModelAttribute("form") Customer user, BindingResult erros,
			@RequestParam("photo_file") MultipartFile file)
			throws IllegalStateException, IOException, MessagingException {
		if (erros.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa lỗi dưới đây");
			return "account/register";
		} else {
			Customer user2 = dao.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "Username đã được sử dụng, chọn username khác");
				return "account/register";
			}
		}
		if (file.isEmpty()) { // k upload file
			user.setPhoto("user.jpg");
		} else {
			String dir = app.getRealPath("/static/imgs/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}

		user.setActivated(false);
		user.setAdmin(false);
		dao.create(user);
		model.addAttribute("message", "Đăng ký thành công");

		String from = "khanhat48@gmail.com";
		String to = user.getEmail();
		String subject = "KÍCH HOẠT TÀI KHOẢN Tea & Coffee Store";
		String url = request.getRequestURL().toString().replace("register", "activate/" + user.getId());
		String body = "<h4>Xin chào " + user.getFullname() + "</h4>Nhấn vào link dưới đây để kích hoạt tài khoản [<b> "
				+ user.getId() + "</b> ] <h2><a href='" + url + "'>Activate</a></h2>";
		MailInfo mail = new MailInfo(from, to, subject, body);
		mailer.send(mail);
		return "account/register";
	}

	@GetMapping("/account/activate/{id}")
	public String activate(Model model, @PathVariable("id") String id) {
		Customer user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);
		return "account/activated";
	}

	@GetMapping("/account/forgot")
	public String forgot(Model model) {
		return "account/forgot";
	}

	@PostMapping("/account/forgot")
	public String forgot(Model model, @RequestParam("id") String id, @RequestParam("email") String email)
			throws MessagingException {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Không tìm thấy username");
		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("message", "Email không hợp lệ!");
		} else {
			String from = "khanhat48@gmail.com";
			String to = user.getEmail();
			String subject = "QUÊN MẬT KHẨU";
			String url = request.getRequestURL().toString().replace("forgot", "cforgot/" + user.getId());
			// String body = "<h4>Xin chào "+user.getFullname()+"</h4>Nhấn vào link dưới đây
			// để đặt lại mật khẩu cho tài khoản [<b> "+user.getId()+"</b> ] của bạn. <h2><a
			// href='"+url+"'>Forgot Password</a></h2>";
			String body = "<h4>Xin chào " + user.getFullname() + "</h4>Nhấn vào đây để đổi mật khẩu cho tài khoản [<b> " + user.getId()
					+ "</b> ] của bạn: " + "<h2><a href='" + url + "'>Change Password</a></h2>";
			MailInfo mail = new MailInfo(from, to, subject, body);
			mailer.send(mail);
			model.addAttribute("message", "Kiểm tra thông tin ở email đăng ký");
		}

		return "account/forgot";
	}

	@GetMapping("/account/cforgot/{id}")
	public String cForgot(Model model) {
		return "account/cforgot";
	}

	@PostMapping("/account/cforgot/{id}")
	public String cForgot(Model model, 
			@PathVariable("id") String id, 
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) {
		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "Nhập lại mật khẩu không đúng");
		} else {
			Customer user = dao.findById(id);
			if (user == null) {
				model.addAttribute("message", "Không tìm thấy username");
			} else {
				user.setPassword(pw1);
				dao.updatePassword(user);
				model.addAttribute("message", "Đổi mật khẩu thành công");
			}
		}
		return "account/cforgot";
	}

	@GetMapping("/account/change")
	public String change(Model model) {

		return "account/change";
	}

	@PostMapping("/account/change")
	public String change(Model model, @RequestParam("pw") String pw, @RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) {
		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "Nhập lại mật khẩu không đúng");
		} else {
			Customer user1 = (Customer) session.getAttribute("user");
			Customer user = dao.findById(user1.getId());
			if (user == null) {
				model.addAttribute("message", "Không tìm thấy username");
			} else if (!BCrypt.checkpw(pw, user.getPassword())) {
				model.addAttribute("message", "Mật khẩu cũ không hợp lệ!");
			} else {
				user.setPassword(pw1);
				dao.updatePassword(user);
				model.addAttribute("message", "Đổi mật khẩu thành công");
			}
		}
		return "account/change";
	}

	@GetMapping("/account/edit")
	public String edit(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		model.addAttribute("form", user);
		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(Model model, @ModelAttribute("form") Customer user,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			String dir = app.getRealPath("/static/imgs/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		dao.update(user);
		session.setAttribute("user", user);
		model.addAttribute("message", "Cập nhật thành công");

		return "account/edit";
	}
}
