package com.scent.perfume.mypage.model.vo;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDTO {
	private Long orderHistoryNumber;
	private String productNumber;
	private String orderNumber;
	private String orderCount;
	private String orderSize;
	private String orderPrice;
}
