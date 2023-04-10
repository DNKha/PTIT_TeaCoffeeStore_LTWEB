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

import com.teastore.dao.CategoryDAO;
import com.teastore.entity.Category;

@Controller
public class CategoryManager {
	
	@Autowired
	CategoryDAO dao;
	
	@RequestMapping("/admin/category/index")
	public String index(Model model) {
		Category entity = new Category();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		Category entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/create")
	public String create(RedirectAttributes model,
				@ModelAttribute("entity") Category entity) {
		if(checkName(entity) == false) {
			dao.create(entity);
			model.addAttribute("message", "Insert success!");
		}else {
			model.addAttribute("message", "Same Category name!!! Error Create");
		}
		
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model
			, @ModelAttribute("entity") Category entity) {
		if(checkName(entity) == false) {
			dao.update(entity);
			model.addAttribute("message", "Update success!");
		}else {
			model.addAttribute("message", "Same Category name!!! Error Update");
		}
		
		return "redirect:/admin/category/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/category/delete","/admin/category/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) Integer id1,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "nameVN", required = false) String nameVN,
			@PathVariable(value = "id", required = false) Integer id2) {
		
		Integer id = null;
		if(id1 !=null) {
			id = id1;
		}else if (id2!=null) { 
			id = id2;
		}else {//id1 == null && id2 == null
			List<Category> list = dao.findAll();
			for(Category c: list) {
					if(c.getName().equals(name)) {
						id = c.getId();
						break;
					}
					if (c.getNameVN().equals(nameVN)) {
						id = c.getId();
						break;
					}
				
			}
		}
		dao.delete(id);
		model.addAttribute("message", "Delete success!");
		return "redirect:/admin/category/index";
	}
	
	public boolean checkName(@ModelAttribute("entity") Category entity) {
		List<Category> list = dao.findAll();
		for(Category c: list) {
			if(!c.getId().equals(entity.getId())) {
				if(c.getNameVN().equals(entity.getNameVN()) || c.getName().equals(entity.getName())) {
					return true;
				}
			}
		}
		return false;
	}
	
	
	int pageSize = 2;
	
	@ResponseBody
	@RequestMapping("/pager/category/page-count")
	public long pageCount() {
		
		return dao.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/category/page/{pageNo}")
	public List<Category> getPage(@PathVariable("pageNo") int pageNo) {
		List<Category> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}
