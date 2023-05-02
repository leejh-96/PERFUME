package com.scent.perfume.event.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.event.model.mapper.EventMapper;
import com.scent.perfume.event.model.vo.MemberBenefitInfo;

// 메일 보내는 서비스
@Service
public class UserMailSendService {

	@Autowired
	private EventMapper mapper;

	// 이메일 난수 만드는 메소드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);

		if (lowerCheck) {
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

	// 메일 인증 확인 메소드(M_MAILSTATUS Y로 바꾸는 메소드)
	// 회원가입 쿠폰 증정 메소드
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int alter_userKey_service(String id, String key, Benefit benefit, MemberBenefitInfo memBenefitInfo) {

		int result = 0;
		int mNo = 0;
		int bnNo = 0;

		mapper.updateMMailStatus(id, key);

		// 회원가입 쿠폰 발급
		// BENEFIT table에 insert
		mapper.insertBenefit(benefit);

		// id로 회원 번호 가져오기
		mNo = mapper.selectMnoById(id);

		bnNo = benefit.getBenefitNo();
		// benefit.getBenefitNo > eventmapper.xml의 insertBenefit()의
		// useGeneratedKeys="true" keyColumn="BN_NO" keyProperty="benefitNo" 속성으로 값을
		// 넣어줘서 가져올 수 있음

		// BENEFIT BN_NO와 mNo를 갖고 MEMBER_BENEFIT_INFO 테이블 insert
		result = mapper.insertMemberBenefitInfo(bnNo, mNo, memBenefitInfo);
		return result;
	}

}
