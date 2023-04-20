package com.scent.perfume.event.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	// 게시물 번호
	private int bNo;
	// 카테고리 번호
	private int bcNo;
	// 회원 번호
	private int mNo;
	// 게시물 제목
	private String bTitle;
	// 게시물 내용
	private String bContent;
	// 등록 날짜
	private Date bCreateDate;
	// 수정 날짜
	private Date bUpdateDate;
	// 조회수
	private int bCount;
	// 게시물 상태
	private String bStatus;
	// 게시물 구분					활성글 Y, 삭제글 N
	private String bSort;
	// 게시글 비밀번호 				게시판 종류가 2(qna)일때 비밀번호 컬럼을 사용한다.
	private String bPwd;
	// 게시판 종류 					1.공지사항게시판, 2.qna게시판, 3.이벤트게시판, 4.기획전게시판
	private int bType;
}
