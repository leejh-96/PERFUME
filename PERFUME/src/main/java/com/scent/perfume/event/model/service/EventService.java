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

// 게시물 검색 기능
	int getEventCountByKeyword(String type, String keyword);
	List<Board> getEventListByKeyword(PageInfo pageInfo, String type, String keyword);

// 상세 게시글 보기
	Board findBoardByNo(int no);

// 게시글 작성 수정
	int saveEventWrite(Board board);

	
}
