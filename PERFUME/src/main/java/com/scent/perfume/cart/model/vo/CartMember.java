package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartMember {
	
	private int memberNo;
	private int memberDevision;
	private String memberStatus;
	private String memberPath;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private Date memberBirth;
	private String gender;
	private String memberMail;
	private String memberPhone;
	private String memberAddr;
	private int memberPoint;
	private Date memberCreateDate;
	private Date memberUpdateDate;
	private String memberMailStatus;
	
	private List<Benefit> memberBenefitList;
	private List<Cart> memberCartList;
}
