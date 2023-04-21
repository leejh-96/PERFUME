package com.scent.perfume.planning.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.scent.perfume.planning.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("id") String id);

	String getMemberByEmail(@Param("userEmail") String email);
	
	String selectMailStatusById(String id);

	String getPassword(@Param("userName") String userName, @Param("userId") String userId, @Param("userEmail") String userEmail);

	void updatePassword(@Param("userId") String userId, @Param("tempPassword") String tempPassword);
}
