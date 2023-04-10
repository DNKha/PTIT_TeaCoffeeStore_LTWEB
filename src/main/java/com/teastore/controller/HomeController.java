package com.teastore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teastore.dao.ProductDAO;
import com.teastore.entity.Product;

@Controller
public class HomeController {
	
	
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/home/index")
    public String index(Model model){
		List<Product> listSpecial = pdao.findBySpecialIndex(4);
		model.addAttribute("listSpecial", listSpecial);
		List<Product> listBS = pdao.findBySpecialIndex(1);
		model.addAttribute("listBS", listBS);
		List<Product> listDC = pdao.findBySpecialIndex(3);
		model.addAttribute("listDC", listDC);
        return "home/index";
    }
	@RequestMapping("/home/coffee")
    public String coffee(){
        return "home/coffee";
    }
	@RequestMapping("/home/tea")
    public String tea(){
        return "home/tea";
    }
	@RequestMapping("/home/drink")
    public String drink(){
        return "home/drink";
    }
	@RequestMapping("/home/sanpham")
    public String sanpham(){
        return "home/sanpham";
    }
	@RequestMapping("/home/aboutus")
    public String aboutus(){
        return "home/aboutus";
    }
	
	@ResponseBody
	@RequestMapping("/home/language")
    public void language(){
    }
}
