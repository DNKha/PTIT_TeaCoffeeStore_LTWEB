package com.teastore.admin.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teastore.dao.OrderDAO;
import com.teastore.dao.OrderDetailDAO;
import com.teastore.entity.Customer;
import com.teastore.entity.Order;

@Controller
public class OrderManager {

	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddDao;

	@RequestMapping("/admin/order/index")
	public String index(Model model) {
		Order entity = new Order();
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddDao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}
	
	

	@RequestMapping("/admin/order/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		Order entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddDao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}


	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		if (checkName(entity) == false) {
			dao.update(entity);
			model.addAttribute("message", "Update success!");
		} else {
			model.addAttribute("message", "Same Order name!!! Error Update");
		}

		return "redirect:/admin/order/edit/" + entity.getId();
	}

	public boolean checkName(@ModelAttribute("entity") Order entity) {

		return false;
	}

	
	
	int pageSize = 5;
	
	@ResponseBody
	@RequestMapping("/pager/order/page-count")
	public long pageCount() {
		
		return dao.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/order/page/{pageNo}")
	public List<Order> getPage(@PathVariable("pageNo") int pageNo) {
		List<Order> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}
