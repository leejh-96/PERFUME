package com.scent.perfume.planning.model.service;

import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.planning.model.vo.Member;

public interface MemberService {
	Member findMemberById(String id);

	Member login(String id, String pwd);

	String findMemberByEmail(String userEmail);

	String getMailStatus(String id);
	
	String getPassword(String userName, String userId, String userEmail);

	String generateTempPassword(String userId);

	void updatePassword(String userId, String tempPassword);

	static MemberDTO getMember(String name) {
		// TODO Auto-generated method stub
		return null;
	}
}