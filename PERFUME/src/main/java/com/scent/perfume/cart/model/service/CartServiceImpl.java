package com.scent.perfume.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.cart.model.mapper.CartMapper;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;
import com.scent.perfume.cart.model.vo.productOption;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public CartMember selectCartMemberInfo(int memberNo) {
		
		CartMember member = null;
		
		member = cartMapper.selectCartMemberInfo(memberNo);
		
		return member;
	}

	@Override
	public List<Cart> selectCartInfo(int memberNo) {
		
		List<Cart> clist = null;
		
		clist = cartMapper.selectCart(memberNo);
		
		/* clist.get(0).getBList() */
		
		for(int i = 0; i<clist.size(); i++) {
			clist.get(i).setCartProduct(cartMapper.selectCartProductInfo(clist.get(i).getCartNo(),clist.get(i).getProductNo()));
			clist.get(i).setBenefitList(cartMapper.selectProductBenefit(clist.get(i).getProductNo()));;
		}
		return clist;
	}

	@Override
	@Transactional
	public int couponUpdate(int memberNo, int benefitNo) {
		
		return cartMapper.couponUpdate(memberNo,benefitNo);
	}

	@Override
	@Transactional
	public int couponReset(int memberNo, int benefitNo) {
		
		return cartMapper.couponReset(memberNo,benefitNo);
	}

	@Override
	@Transactional
	public int cartDelete(int memberNo, int cartNo) {
		
		return cartMapper.cartDelete(memberNo,cartNo);
	}

	@Override
	@Transactional
	public int orderInsert(Order order) {
		
		return cartMapper.orderInsert(order);
	}

	@Override
	@Transactional
	public int orderListInsert(OrderList orderList) {
		
		return cartMapper.orderListInsert(orderList);
	}

	@Override
	public Order orderList(String orderNo) {
		
		Order order = null;
		
		order = cartMapper.orderList(orderNo);
		
		/*
		 * int result1 = this.memberPointUpdate(order.getPoint(), order.getMemberNo());
		 * log.info("result1 : {}",result1); int plusPoint =
		 * (5/100)*order.getFinalPrice();
		 * 
		 * int result2 = this.memberPlusPoint(plusPoint, order.getMemberNo());
		 * log.info("result2 : {}",result2);
		 */
		return order;
	}

	@Override
	@Transactional
	public int memberPointUpdate(int point, int memberNo) {
		
		log.info("point : {}",point);
		log.info("memberNo : {}",memberNo);
		
		return cartMapper.minusPoint(point,memberNo);
	}

	@Override
	@Transactional
	public int memberPlusPoint(int plusPoint, int memberNo) {
		
		log.info("plusPoint : {}",plusPoint);
		log.info("memberNo : {}",memberNo);
		
		return cartMapper.plusPoint(plusPoint,memberNo);
	}

	@Override
	public productOption selectNowOrder(productOption option) {
		
		productOption optionInfo = null;
		
		optionInfo = cartMapper.selectNowOrder(option.getProductNo(), option.getPoName());
		
		optionInfo.setProduct(cartMapper.selectNowProduct(option.getProductNo()));
		optionInfo.setBenefit(cartMapper.selectProductBenefit(option.getProductNo()));
		optionInfo.setFile(cartMapper.selectNowFile(option.getProductNo()));
		
		log.info("optionInfo : {}",optionInfo);
		
		
		return optionInfo;
	}
	
		
}

	


