package com.scent.perfume.cart.model.vo;

import java.util.Date;

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
	private Date benefitEndDate;
	private int benefitRatio;
	private int benefitHit;
	private int pBenefitNo;
	private int pNo;
	
}
