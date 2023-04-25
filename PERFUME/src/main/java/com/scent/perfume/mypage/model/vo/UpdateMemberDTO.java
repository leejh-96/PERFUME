package com.scent.perfume.mypage.model.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class UpdateMemberDTO {
	private String gender;
	private String email;
	private String address;
	private String password;
}
