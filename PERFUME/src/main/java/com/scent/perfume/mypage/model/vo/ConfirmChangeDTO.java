package com.scent.perfume.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConfirmChangeDTO {
	private String password;
	private Long memberId;
	private String name;
	private String birthDate;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String point;

}
