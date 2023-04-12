package com.scent.perfume.planning.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.scent.perfume.planning.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("id") String id);
}
