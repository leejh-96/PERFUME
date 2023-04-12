package com.scent.perfume.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

		

	// 회원가입창 연결
	@RequestMapping("/join")
	public String joinView() {	
		System.out.println("회원가입창 연결 테스트");
		return "/event/join";
	}
	
	// 게시글 작성 연결
	@RequestMapping("/eventWrite")
	public String eventView() {
		System.out.println("이벤트 작성 창 연결 테스트");	
		return "event/eventWrite";
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
