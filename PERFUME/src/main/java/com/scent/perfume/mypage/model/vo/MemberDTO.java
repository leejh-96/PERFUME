package com.scent.perfume.mypage.model.vo;

import java.util.Date;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class MemberDTO {
	private String number;
	private String division;
	private String status;
	private String path;
	private Long memberId;
	private String password; 	
	private String name;
	private String birthDate;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String point;
	private Date createDate;
	private Date updateDate;
	private String mailStatus;
	private String userId;

}

