package com.scent.perfume.event.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.scent.perfume.event.model.mapper.EventMapper;

// 메일 보내는 서비스
@Service
public class UserMailSendService {

	@Autowired
	private JavaMailSender mailSender;	
	@Autowired
	private EventMapper mapper;
	
	// 이메일 난수 만드는 메소드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <=57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while(sb.length() < size);
		
		if (lowerCheck){
			return sb.toString().toLowerCase();
		}
		
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 이메일 발송(인증링크 발송)
	public void mailSendWithUserKey(String mail, String id, HttpServletRequest request) {	// 경로 설정을 위한 HttpServletRequest

		String key = getKey(false, 20);
		
		// id와 위에서 만든 key 가지고 getKey 매퍼 생성
		mapper.getKey(id, key);
		
		MimeMessage sendMail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 나를 찾는 여행 향수 쇼핑몰입니다.</h2><br><br>"
				+ "<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 회원가입이 완료됩니다.<br><br>"
				+ "<a href='http://localhost:8088/" + request.getContextPath() + "/join/key_update?m_id=" + id + "&m_mailstatus=" + key + "'>인증하기</a></p>";
				/* 
				 * 메일을 보낼 때 param 값으로 id, key 값을 보냄
				 * a태그 안의 인증하기 버튼을 눌렀을 때 get 방식을 통해 key_alterConfirm 컨트롤러를 탈 url 작성.
				 * 만약 id와 key 값이 DB에 저장된 값과 동일하다면
				 * key_alterConfirm 컨트롤러에서 (위의 .getKey() mapper를 통해)현재 난수가 저장되어있는 M_MAILSTATUS 컬럼을 Y로 바꿔 이메일 인증 상태로 변경
				 * 로그인할 때 MAIL_STATUS가 Y라는 조건을 걸어주기
				 */	
		try {
			sendMail.setSubject("[본인인증] 향수 쇼핑몰 회원가입 인증 메일입니다.", "utf-8");
			sendMail.setText(htmlStr, "utf-8", "html");
			sendMail.addRecipient(RecipientType.TO, new InternetAddress(mail));
			mailSender.send(sendMail);
		} catch(MessagingException e) {
			e.printStackTrace();
		}

	}

	// 인증 확인 메소드(M_MAILSTATUS Y로 바꾸는 메소드)
	public int alter_userKey_service(String id, String key) {

		int result = 0;
		
		mapper.updateMMailStatus(id, key);
		
		return result;
	}

}
