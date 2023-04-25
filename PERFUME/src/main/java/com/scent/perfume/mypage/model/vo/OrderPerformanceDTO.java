package com.scent.perfume.mypage.model.vo;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderPerformanceDTO {
	private long memberId;
	private String orderCount;
	private String orderAmount;
}
