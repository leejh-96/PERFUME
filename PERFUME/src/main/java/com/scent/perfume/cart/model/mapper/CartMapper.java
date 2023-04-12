package com.scent.perfume.cart.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;

@Mapper
public interface CartMapper {

	public Benefit selectProductBenefit(int productNo);

	public CartMember selectCartMemberInfo(int memberNo);

	public List<Cart> selectCart(int memberNo);

	public CartProduct selectCartProductInfo(@Param("cartNo") int cartNo,@Param("productNo") int productNo);

	/*
	 * public int amountUpdate(@Param("cartNo") int
	 * cartNo,@Param("cartProductCount") int cartProductCount);
	 */

	public int couponUpdate(@Param("memberNo") int memberNo,@Param("benefitNo") int benefitNo);

	public int couponReset(@Param("memberNo") int memberNo,@Param("benefitNo") int benefitNo);

	public int cartDelete(@Param("memberNo")int memberNo,@Param("cartNo") int cartNo);

	public int orderInsert(@Param("order") Order order);

	public int orderListInsert(@Param("orderList")OrderList orderList);

	public String selectOrderPrimaryKey(@Param("orderNo") String orderNo);

	public int minusPoint(@Param("point") int point, @Param("memberNo")int memberNo);

	public int plusPoint(@Param("plusPoint") int plusPoint, @Param("memberNo")int memberNo);

	public Order orderList(@Param("orderNo") String orderNo);
	
}
