package com.scent.perfume.mypage.model.vo;

import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class OrderDetailDTO {
		private Long orderNumber;
		private String orderMemberNumber;
		private String orderMethod;
		private String orderDate;
		private String orderPrice;
		private String orderDiscount;
		private String orderPoint;
		private String orderCoupon;
		private String orderDeliveryCash;
		private String orderName;
		private String orderPhone;
		private String orderEmail;
		private String orderGetName;
		private String orderAddress;
		private String orderGetPhone;
		private String orderMemo;
		private String status;
		private Long memberId;
		List<OrderDTO> orderList;

}
