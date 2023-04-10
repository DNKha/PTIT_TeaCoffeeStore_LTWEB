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

import com.teastore.dao.ProductDAO;
import com.teastore.entity.Order;
import com.teastore.entity.Product;

@Controller
public class ProductManager {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	ServletContext app; // dùng cái này để lưu ảnh về static
	
	@RequestMapping("/admin/product/index")
	public String index(Model model) {
		Product entity = new Product();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		Product entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/create")
	public String create(RedirectAttributes model,
				@ModelAttribute("entity") Product entity,
				@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if (file.isEmpty()) {
			entity.setImage("user.jpg");
		}else {
			entity.setImage(file.getOriginalFilename());
			String path = null;
			if(entity.getCategory().getId().equals(1)) {
				path = app.getRealPath("/static/imgs/products/douong/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(4)) {
				path = app.getRealPath("/static/imgs/products/dotrangmieng/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(5)) {
				path = app.getRealPath("/static/imgs/products/tragoi/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(6)) {
				path = app.getRealPath("/static/imgs/products/caphegoi/"+entity.getImage());
			}
			file.transferTo(new File(path));
		}
		if(checkName(entity) == false) {
			entity.setViewCount(0);
			dao.create(entity);
			model.addAttribute("message", "Insert success!");
		}else {
			model.addAttribute("message", "Same Product name!!! Error Create");
		}
		
		return "redirect:/admin/product/index";
	}
	
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model
			, @ModelAttribute("entity") Product entity,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path = null;
			if(entity.getCategory().getId().equals(1)) {
				path = app.getRealPath("/static/imgs/products/douong/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(4)) {
				path = app.getRealPath("/static/imgs/products/dotrangmieng/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(5)) {
				path = app.getRealPath("/static/imgs/products/tragoi/"+entity.getImage());
			}else if (entity.getCategory().getId().equals(6)) {
				path = app.getRealPath("/static/imgs/products/caphegoi/"+entity.getImage());
			}
			file.transferTo(new File(path));
		}
		if(checkName(entity) == false) {
			entity.setViewCount(0);
			dao.update(entity);
			model.addAttribute("message", "Update success!");
		}else {
			model.addAttribute("message", "Same Product name!!! Error Update");
		}
		
		return "redirect:/admin/product/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/product/delete","/admin/product/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) Integer id1,
			@PathVariable(value = "id", required = false) Integer id2) {
		
		Integer id = null;
		if(id1 !=null) {
			id = id1;
		}else { 
			id = id2;
		}
		dao.delete(id);
		model.addAttribute("message", "Delete success!");
		return "redirect:/admin/product/index";
	}
	
	public boolean checkName(@ModelAttribute("entity") Product entity) {
		List<Product> list = dao.findAll();
		for(Product c: list) {
			if(!c.getId().equals(entity.getId())) {
				if(c.getName().equals(entity.getName())) {
					return true;
				}
			}
		}
		return false;
	}
	
	int pageSize = 5;
	
	@ResponseBody
	@RequestMapping("/pager/product/page-count")
	public long pageCount() {
		
		return dao.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/product/page/{pageNo}")
	public List<Product> getPage(@PathVariable("pageNo") int pageNo) {
		List<Product> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}
