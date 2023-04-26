package com.scent.perfume.mypage.model.service;

import com.scent.perfume.mypage.exception.CreateMemberFailException;
import com.scent.perfume.mypage.exception.NotFoundMemberException;
import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.mypage.model.vo.ResignMemberDTO;

public interface MyPageMemberService {
	
	MemberDTO getMemberId(String name, String phone) throws NotFoundMemberException;
	
	static MemberDTO getMemberId(String email) throws NotFoundMemberException {
		// TODO Auto-generated method stub
		return null;
	}
	
	void updateMemberPassword(MemberDTO memberId);

	ResignMemberDTO getResignMember(MemberDTO memberId) throws Exception;

}