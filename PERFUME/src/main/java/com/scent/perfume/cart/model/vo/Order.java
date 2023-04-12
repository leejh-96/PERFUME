package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

	private String orderNo;
	private int memberNo;
	private String orderMethod;
	private Date orderDate;
	private int finalPrice;
	private int discount;
	private int point;
	private int coupon;
	private int delivery;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String recipientName;
	private String recipientAddr;
	private String recipientPhone;
	private String memo;
	private String status;
	
	private List<OrderList> orderList;
}
