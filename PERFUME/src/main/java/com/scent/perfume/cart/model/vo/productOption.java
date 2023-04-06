package com.scent.perfume.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class productOption {

	private int poNo;
	private int productNo;
	private String poName;
	private int poPrice;
	private int poAmount;

}
