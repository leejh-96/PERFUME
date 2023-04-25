package com.scent.perfume.mypage.model.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;
@Repository
@Data
public class DeliveryAddressDTO {
	private String addressId;
	private long memberId;
	// 기본배송지
	private String isDefault;
	
}
