package com.scent.perfume.planning.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;			//회원번호(CREATE SEQUENCE SEQ_M_NO;시퀀스로 생성)
	
	private int division;	//회원구분(기본값은 2로 일반유저, 관리자는 상태값1)
	
	private String status;	//상태값(현재 멤버들의 상태값을 나타내기 위한 속성임 멤버의 활성상태 Y 비활성상태N)
	
	private String path;	//회원가입경로(회원가입을 진행한 경로 기본값은 우리 홈페이지값으로 설정, 만약 카카오나 네이버를 통해서 했다면 KAKAO, NAVER로 값 입력?)
	
	private String id;		//회원아이디
	
	private String pwd;		//비밀번호
	
	private String name;	//이름
	
	private Date birth;		//생년월일
	
	private String gender;	//성별
	
	private String mail;	//이메일
	
	private String phone;	//전화번호
	
	private String addr;	//주소
	
	private int point;		//적립금(회원은 결제를 통해 5%의 적립금이 쌓이고 주문을 통해 자유롭게 적립금을 사용할 수 있다)
	
	private Date create;	//회원생성일(기본값은 SYSDATE)
	
	private Date update;	//회원수정일(기본값은 SYSDATE)
	
	private String mailStatus;	//메일상태값(메일이 인증이 완료가 된상태이면 'Y' 아니라면 'N')
}
