package com.scent.perfume.mypage.model.vo;

import java.util.Date;

import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class ProductDTO {
	private String productId;
	private String categoryId;
	private String brandId;
	private String productTitle;
	private String productName;
	private String productEngName;
	private String productDetail;
	private String productStatus;
	private String productGender;
	private String productDate;
	private String productUpdate;
}
