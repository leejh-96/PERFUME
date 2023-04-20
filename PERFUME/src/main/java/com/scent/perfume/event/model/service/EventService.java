package com.scent.perfume.event.model.service;

import java.util.List;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;

public interface EventService {

// 회원가입
	int save(Member member, Terms terms, String tCheck);

// 회원가입 아이디 중복검사
	Boolean isDuplicateId(String id);

// 게시판 목록 조회
	int getEventCount();

	List<Board> getEventList(PageInfo pageInfo);

}
