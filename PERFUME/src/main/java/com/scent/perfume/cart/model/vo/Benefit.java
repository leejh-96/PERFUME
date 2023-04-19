package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Benefit {

	private int memberNo;
	private int benefitNo;
	private int mbiNo;
	private String mbiStatus;
	private String benefitName;
	private String benefitTitle;
	private String benefitContent;
	private Date benefitCreateDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date benefitEndDate;
	private int benefitRatio;
	private int benefitHit;
	private String benefitStatus;
	private int pBenefitNo;
	private int pNo;
	
	
	/*
	 * private List<CartMember> memberList; private List<CartProduct> productList;
	 */
	private List<CartProduct> productList;
	private List<AdminProductFile> benefitFileList;
	
}
