package com.scent.perfume.event.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
   // 게시물 번호
   private int bNo;
   // 회원 번호
   private int mNo;
   // 게시판 종류               (공지사항) (QNA) (이벤트) (기획전)
   private String bcType;   
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
   // 게시물 상태               활성글 Y, 삭제글 N
   private String bStatus;
   // 게시물 구분               (상품문의) (배송문의) (교환/반품문의) (기타문의)       
   private String bSort;
   // 게시글 비밀번호             게시판 종류가 2(qna)일때 비밀번호 컬럼을 사용한다.
   private String bPwd;
   // 공지사항 상단 고정용         공지사항 글쓰기 Y, 일반 글쓰기 N
   private String noticeYn;
   
   // 이벤트 시작 날짜
   private Date bnCreateDate;
   // 이벤트 등록 날짜
   private Date bnEndDate;
   // 이전글 제목
   private String preTitle;
   // 다음글 제목
   private String nextTitle;
   // 이전글 글번호
   private int preNo;
   // 다음글 글번호
   private int nextNo;
}