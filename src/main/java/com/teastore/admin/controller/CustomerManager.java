package com.teastore.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teastore.dao.CustomerDAO;
import com.teastore.entity.Category;
import com.teastore.entity.Customer;

@Controller
public class CustomerManager {

	@Autowired
	CustomerDAO dao;
	
	@Autowired
	ServletContext app; // dùng cái này để lưu ảnh về static

	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		Customer entity = new Customer();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}

	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(@PathVariable("id") String id, Model model) {
		Customer entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}

	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model, 
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (file.isEmpty()) {
			entity.setPhoto("user.jpg");
		}else {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/imgs/customers/"+entity.getPhoto());
			file.transferTo(new File(path));
		}
		if (checkId(entity) == false) {
			dao.create(entity);
			model.addAttribute("message", "Insert success!");
		} else {
			model.addAttribute("message", "Same Customer name!!! Error Create");
		}

		return "redirect:/admin/customer/index";
	}

	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, 
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/imgs/customers/"+entity.getPhoto());
			file.transferTo(new File(path));
		}
		if (checkId(entity) == false) {
			dao.update(entity);
			model.addAttribute("message", "Update success!");
		} else {
			model.addAttribute("message", "Same Customer name!!! Error Update");
		}

		return "redirect:/admin/customer/edit/" + entity.getId();
	}

	@RequestMapping(value = { "/admin/customer/delete", "/admin/customer/delete/{id}" })
	public String delete(RedirectAttributes model, 
			@RequestParam(value = "id", required = false) String id1,
			@PathVariable(value = "id", required = false) String id2) {

		String id = null;
		if (id1 != null) {
			id = id1;
		} else  {
			id = id2;
		}
		dao.delete(id);
		model.addAttribute("message", "Delete success!");
		return "redirect:/admin/customer/index";
	}

	public boolean checkId(@ModelAttribute("entity") Customer entity) {

		List<Customer> list = dao.findAll();
		for (Customer c : list) {
			if (!c.getId().equals(entity.getId())) {
				if (c.getId().equals(entity.getId())) {
					return true;
				}
			}
		}

		return false;
	}
	
int pageSize = 5;
	
	@ResponseBody
	@RequestMapping("/pager/customer/page-count")
	public long pageCount() {
		
		return dao.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/customer/page/{pageNo}")
	public List<Customer> getPage(@PathVariable("pageNo") int pageNo) {
		List<Customer> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}
