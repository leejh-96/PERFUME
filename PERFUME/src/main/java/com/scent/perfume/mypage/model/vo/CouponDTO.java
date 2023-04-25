package com.scent.perfume.mypage.model.vo;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CouponDTO {
	private long couponId;
	private String memberNumber;
	private String benefitNumber;
	private String couponStatus;
	private String createDate;
	private String endDate;
	private String type;
}
