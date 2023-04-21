package com.scent.perfume.planning.controller;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.scent.perfume.planning.model.service.MemberService;
import com.scent.perfume.planning.model.service.MemberServiceImpl;
import com.scent.perfume.planning.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
// Model 객체에 loginMember라는 키값으로 Attribute가 추가되면 해당 Attribute를 세션 스코프에 추가하는 어노테이션이다.
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 처리
	@PostMapping("/login")
	public ModelAndView login(ModelAndView modelAndView, @RequestParam String id, @RequestParam String pwd) {
		log.info("{}, {}", id, pwd);
		
		Member loginMember = service.login(id, pwd);
		
		if (loginMember != null && loginMember.getMailStatus().equals("Y")) {
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
			} else if (loginMember != null && loginMember.getMailStatus() != "Y") {
				modelAndView.addObject("msg", "이메일 인증 후 로그인해주세요.");
				modelAndView.addObject("location", "/");
				modelAndView.setViewName("common/msg");
			} else {
			modelAndView.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		return modelAndView;
	}

	@GetMapping("/login")
	public String login() {
		log.info("로그인 페이지 요청");
		
		return "planning/login";
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
	
	@RequestMapping(value = "/planning/findIdResult", method = RequestMethod.POST)
	public String findIdResult(@RequestParam String userEmail,
			Model model) {
	    String id = service.findMemberByEmail(userEmail);
	    
	    model.addAttribute("id", id);
	    return "planning/findIdResult";
	}
	
	@GetMapping("/planning/findPwd")
	public String findPwd() {
		log.info("비밀번호 찾기 페이지 요청");
		
		return "/planning/findPwd";
	}
	
	@RequestMapping(value = "/planning/findPwdResult", method = RequestMethod.POST)
	public String findPassword(Model model, String userName, String userId, String userEmail) {
		String password = service.getPassword(userName, userId, userEmail);

		if (password == null) {
		    model.addAttribute("msg", "비밀번호 찾기에 실패했습니다. 회원 정보를 다시 확인해주세요.");
		    return "planning/findPwdResult";
		} else {
		    // 임시 비밀번호 생성 및 업데이트
		    String tempPassword = service.generateTempPassword(userId);
		    service.updatePassword(userId, tempPassword);

		    // 이메일 전송
		    try {
		        sendEmail(userId, userEmail, tempPassword);
		        model.addAttribute("msg", "임시 비밀번호가 이메일로 전송되었습니다.");
		    } catch (Exception e) {
		        model.addAttribute("msg", "이메일 전송에 실패했습니다. 관리자에게 문의해주세요.");
		    }
		    return "planning/findPwdResult";
		}
	};
	
	// 이메일 전송 메소드
	private void sendEmail(String userId, String userEmail, String password) throws Exception {
		String host = "smtp.gmail.com";
		int port = 587;
		String username = "perfume.find.pwd@gmail.com";
		String password2 = "zvipezqfbaaztjii";

		Properties properties = new Properties();
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);

		Authenticator auth = new Authenticator() {
		    public PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password2);
		    }
		};

		Session session = Session.getInstance(properties, auth);

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("perfume.find.pwd@gmail.com"));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
		message.setSubject("임시 비밀번호 발급");
		message.setText(userId + "님의 임시 비밀번호는 " + password + "입니다.");

		Transport.send(message);
	}
	
	@GetMapping("/planning/special")
	public String special() {
		log.info("기획전 페이지 요청");
		
		return "planning/special";
	}
	
	@GetMapping("/planning/special01")
	public String special01() {
		log.info("기획전 1번 페이지 요청");
		
		return "planning/special01";
	}
	
	@GetMapping("/planning/special02")
	public String special02() {
		log.info("기획전 2번 페이지 요청");
		
		return "planning/special02";
	}
	
	@GetMapping("/planning/special03")
	public String special03() {
		log.info("기획전 3번 페이지 요청");
		
		return "planning/special03";
	}
	
	@GetMapping("/planning/special04")
	public String special04() {
		log.info("기획전 4번 페이지 요청");
		
		return "planning/special04";
	}
	
	@GetMapping("/planning/special05")
	public String special05() {
		log.info("기획전 5번 페이지 요청");
		
		return "planning/special05";
	}
	
}