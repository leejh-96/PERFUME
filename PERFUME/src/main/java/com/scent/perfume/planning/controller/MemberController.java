package com.scent.perfume.planning.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
				@RequestParam String id, @RequestParam String password) {
		
		log.info("{}, {}", id, password);
		
		Member loginMember = service.login(id, password);
		
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
	
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView modelAndView, @ModelAttribute Member member) {
		
		log.info(member.toString());
		
		int result = 0;
		
		result = service.save(member);
		
		if(result > 0) {
			modelAndView.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			modelAndView.addObject("location", "/");
		} else {
			modelAndView.addObject("msg", "회원가입을 실패하였습니다.");
			modelAndView.addObject("location", "/member/enroll");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@PostMapping("/member/idCheck")	
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("userId") String id) {
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicateId(id));
		
		return ResponseEntity.ok()
							 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
							 .body(map);
//		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
//		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
	
	@GetMapping("/member/myPage")
	public String myPage() {
		log.info("회원 정보 수정 페이지 요청");
		
		return "member/myPage";
	}
	
	@PostMapping("/member/update")
	public ModelAndView update(
				ModelAndView modelAndView,
				@SessionAttribute("loginMember") Member loginMember,
				@ModelAttribute Member member) {
		
		int result = 0;
		
		member.setNo(loginMember.getNo());
		
		log.info(member.toString());
		
		result = service.save(member);
		
		if(result > 0) {
			modelAndView.addObject("loginMember", service.findMemberById(loginMember.getId()));
			modelAndView.addObject("msg", "회원 정보 수정을 완료했습니다.");
		} else {
			modelAndView.addObject("msg", "회원 정보 수정을 실패했습니다.");			
		}
		
		modelAndView.addObject("location", "/member/myPage");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("/member/delete")
	public ModelAndView delete(
				ModelAndView modelAndView, 
				@SessionAttribute("loginMember") Member loginMember) {
	
		int result = 0;
		
		result = service.delete(loginMember.getNo());
		
		if(result > 0) {
			modelAndView.addObject("msg", "정상적으로 탈퇴되었습니다.");
			modelAndView.addObject("location", "/logout");
		} else {
			modelAndView.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			modelAndView.addObject("location", "/member/myPage");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}