package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private int mNo;
	private int mDevision;
	private String mStatus;
	private String mPath;
	private String mId;
	private String mPwd;
	private String mName;
	private Date mBirth;
	private String gender;
	private String mMail;
	private String mPhone;
	private String mAddr;
	private int mPoint;
	private Date mCreateDate;
	private Date mUpdateDate;
	
	private List<Benefit> memberBenefitList;

}
