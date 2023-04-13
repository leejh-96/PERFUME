package com.scent.perfume.planning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.scent.perfume.planning.model.service.MemberService;
import com.scent.perfume.planning.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
// Model 객체에 loginMember라는 키값으로 Attribute가 추가되면 해당 Attribute를 세션 스코프에 추가하는 어노테이션이다.
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;
	// 로그인 처리

	@PostMapping("/login")
	public ModelAndView login(ModelAndView modelAndView,
				@RequestParam String id, @RequestParam String pwd) {
		
		log.info("{}, {}", id, pwd);
		
		Member loginMember = service.login(id, pwd);
		
		if(loginMember != null) {
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
		} else {
			modelAndView.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	/*
	 * 로그아웃 처리
	 * 2. SessionStatus 객체 사용
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("status : {}", status.isComplete());
		
		// 세션 스코프로 확장된 Attribute를 지워준다.
		status.setComplete();
		
		log.info("status : {}", status.isComplete());
		
		return "redirect:/";
	}
	
	@GetMapping("/member/enroll")
	public String enroll() {
		log.info("회원 가입 페이지 요청");
		
		return "member/enroll";
	}
	
	@GetMapping("/member/myPage")
	public String myPage() {
		log.info("회원 정보 수정 페이지 요청");
		
		return "member/myPage";
	}
	
	@GetMapping("/planning/findId")
	public String findId() {
		log.info("아이디 찾기 페이지 요청");
		
		return "planning/findId";
	}
	
	@GetMapping("/planning/findPwd")
	public String findPwd() {
		log.info("비밀번호 찾기 페이지 요청");
		
		return "planning/findPwd";
	}
	
	@GetMapping("/planning/special")
	public String special() {
		log.info("기획전 페이지 요청");
		
		return "planning/special";
	}
}