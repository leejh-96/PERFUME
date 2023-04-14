package com.scent.perfume.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.product.model.service.ProductService;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.TopCate;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	// 전체 상품 페이지
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page
			, @RequestParam(required = false) String gender, @RequestParam(required = false) String bn
			, @RequestParam(required = false) String sort , @RequestParam(required = false) String keyword) {
		System.out.println(keyword);
		
		// PRODUCT 리스트
		int listCount = service.getProductCount(gender);
		
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		List<Product> list = service.getProductList(pageInfo,gender,sort,bn,keyword);		
		
		// BRAND 리스트
		List<Product> brand = service.getBrandList();
		
		// SCENT 리스트
				int listCount2 = service.getTopCateCount();
				List<TopCate> topcate = service.getTopCateList();
				
		System.out.println(list);
		
		// TOPCATEGORY modelAndView
		modelAndView.addObject("listCount2",listCount2);
		modelAndView.addObject("topcate",topcate);

		// BRAND modelAndView
		modelAndView.addObject("brand",brand);
		
		// PRODUCT modelAndView
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list",list);
		modelAndView.addObject("gender", gender);
		modelAndView.addObject("bn", bn);
		modelAndView.addObject("sort",sort);
		
		modelAndView.setViewName("product/list");
		
		
		return modelAndView;
		
	}
	


	
	// 상품 상세페이지 이동
	@GetMapping("/detail")
	public ModelAndView view(ModelAndView modelAndView, @RequestParam int no) {
	    System.out.println(no);
			
		List<Product> list= service.findProductByNo(no);
		
		System.out.println("값" + list);
			
		modelAndView.addObject("list", list);
		modelAndView.setViewName("product/detail");
			
		return modelAndView;
			
		}	
		
	
	

	
	@GetMapping("/scent")
	public ModelAndView scent(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, @RequestParam int no) {
		int listCount = service.getScentProductCountByNo(no);
		
		TopCate scent =  service.findScentByNo(no);
		
		System.out.println(scent);
		
		int listCount2 = service.getTopCateCount();
		List<TopCate> topcate = service.getTopCateList();
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Product> product = service.getScentPrductList(pageInfo, no);
		
		System.out.println(product);
		modelAndView.addObject("scent", scent);
		modelAndView.addObject("product", product);
		modelAndView.addObject("listCount2",listCount2);
		modelAndView.addObject("topcate",topcate);
		modelAndView.setViewName("/scent");
		
		return modelAndView;
		
	}
	
	

		
	}
	
	
	
	
		
	
	
	
	
	
	
	
	

