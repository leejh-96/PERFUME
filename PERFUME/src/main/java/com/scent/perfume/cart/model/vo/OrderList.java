package com.scent.perfume.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {
	
	private int orderListNo;
	private int cartNo;
	private String orderNo;
	private String orderFileName;
	private int productNo;
	private String productName;
	private String productEng;
	private String productBrand;
	private int orderSize;
	private int orderPrice;
	private int orderCount;
}
