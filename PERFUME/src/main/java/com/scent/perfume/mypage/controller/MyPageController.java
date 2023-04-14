package com.scent.perfume.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
//	@Value("${contentPerPage}")
	private int contentPerPage=10; // 한 페이지에 보여지는 게시물의 개수
	
//	@Value("${productPerPage}")
	private int productPerPage=8; // 한 페이지에 보여지는 최근 본 상품의 개수
	
//	@Value("${receiptPerPage}")
	private int receiptPerPage=5; // 한 페이지에 보여지는 주문내역의 개수
	
//	@Value("${blockPerPage}")
	private int blockPerPage=5; // 한 페이지에 보여지는 페이지 블록의 개수
	
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "mypage/mypage";
	}
}


