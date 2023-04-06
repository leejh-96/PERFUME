package com.scent.perfume.cart.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Member;

@Mapper
public interface CartMapper {

	public Benefit selectProductBenefit(int productNo);

	public Member selectCartMemberInfo(int mNo);

	public List<Cart> selectCart(int mNo);

	public CartProduct selectCartProductInfo(@Param("cartNo") int cartNo,@Param("productNo") int productNo);

	public int amountUpdate(@Param("cartNo") int cartNo,@Param("cartProductCount") int cartProductCount);
	
}
