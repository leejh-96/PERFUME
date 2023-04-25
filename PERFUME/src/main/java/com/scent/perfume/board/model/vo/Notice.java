package com.scent.perfume.board.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int BNo;			// 게시물 번호
	
	private int BMno;			//회원번호(외래키)
	
	private String writerId;// 작성자 아이디
	
	private String BTitle;		//게시물 제목
	
	private String BContent;	//게시물 내용
	
	private Date BCreateDate;	//등록날짜
	
	private Date BUpdateDate;	//수정날짜
	
	private int BCount;			//조회수
	
	private String BStatus;		//게시물 상태
	
	private String BSort;		//게시물 구분

	private String BPwd;		//게시글 비밀번호(Q&A게시판일때 한정)
	
	private String BType;		//게시판종류('공지사항' | 'Q&A' | '이벤트' | '기획전')
	
	private String Notice_yn;	//공지사항, 일반게시글 택1
}