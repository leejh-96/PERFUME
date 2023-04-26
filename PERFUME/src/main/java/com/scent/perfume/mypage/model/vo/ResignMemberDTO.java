package com.scent.perfume.mypage.model.vo;

import java.util.Date;

import org.springframework.context.annotation.Role;
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
public class ResignMemberDTO {
	
	private long memberId;
	private String number;
	private Role role;
	private String password;
	private String name;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String point;
	private Date joinDate;
	private Date resignDate;
}
