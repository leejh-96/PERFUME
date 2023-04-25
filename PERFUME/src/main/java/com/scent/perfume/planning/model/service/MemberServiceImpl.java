package com.scent.perfume.planning.model.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.scent.perfume.planning.model.mapper.MemberMapper;
import com.scent.perfume.planning.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	@Override
	public Member login(String id, String pwd) {
		Member member = null;
		
		member = this.findMemberById(id);
		
		if (member != null && passwordEncoder.matches(pwd, member.getPwd())) {			
			return member;
		} else {
			return null;
		}
	}

	@Override
	public String findMemberByEmail(String userEmail) {
		return mapper.getMemberByEmail(userEmail);
	}

	@Override
	public String getMailStatus(String id) {
		return mapper.selectMailStatusById(id);
	}
	
	@Override
	public String getPassword(String userName, String userId, String userEmail) {
	    // 암호화된 비밀번호 반환
	    return passwordEncoder.encode(mapper.getPassword(userName, userId, userEmail));
	}
	
	@Override
	public String generateTempPassword(String userId) {
	    String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    for (int i = 0; i < 10; i++) {
	        sb.append(letters.charAt(random.nextInt(letters.length())));
	    }
	    String tempPassword = sb.toString();
	    // 임시 비밀번호를 암호화
	    String encodedPassword = passwordEncoder.encode(tempPassword);
	    // DB에 암호화된 비밀번호 저장
	    mapper.updatePassword(userId, encodedPassword); // userId는 임시 비밀번호를 발급받을 사용자의 ID입니다.
	    return tempPassword;
	}
	
	@Override
	public void updatePassword(String userId, String tempPassword) {
	    String encodedPassword = passwordEncoder.encode(tempPassword);
	    mapper.updatePassword(userId, encodedPassword);
	}

}
