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
		
		//회원의 쿠폰,포인트 정보를 가져옴
		member = cartMapper.selectCartMemberInfo(memberNo);
		
		return member;
	}

	@Override
	public List<Cart> selectCartInfo(int memberNo) {
		
		List<Cart> clist = null;
		
		//회원을 식별하는 회원생성번호로 장바구니 목록을 가져옴
		clist = cartMapper.selectCart(memberNo);
		
		//List에 담긴 상품들의 갯수만큼 반복하는 반복문
		for(int i = 0; i<clist.size(); i++) {
			// n번째 상품의 상품정보,옵션정보를 가져옴
			clist.get(i).setCartProduct(cartMapper.selectCartProductInfo(clist.get(i).getCartNo(),clist.get(i).getProductNo()));
			// n번째 상품에 적용된 할인정보 목록을 가져옴(기획전할인,이벤트적용,쿠폰적용)
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
		
		cartMapper.orderListInsert(orderList);
		
		return cartMapper.updateCart(orderList.getCartNo());
	}

	@Override
	public Order orderList(String orderNo) {
		
		Order order = null;
		
		order = cartMapper.orderList(orderNo);
		
		return order;
	}

	@Override
	@Transactional
	public int memberPointUpdate(int point, int memberNo) {
		
		return cartMapper.minusPoint(point,memberNo);
	}

	@Override
	@Transactional
	public int memberPlusPoint(int plusPoint, int memberNo) {
		
		return cartMapper.plusPoint(plusPoint,memberNo);
	}

	@Override
	public productOption selectNowOrder(productOption option) {
		
		productOption optionInfo = null;
		
		optionInfo = cartMapper.selectNowOrder(option.getProductNo(), option.getPoName());
		
		optionInfo.setProduct(cartMapper.selectNowProduct(option.getProductNo()));
		optionInfo.setBenefit(cartMapper.selectProductBenefit(option.getProductNo()));
		optionInfo.setFile(cartMapper.selectNowFile(option.getProductNo()));
		
		return optionInfo;
	}

	@Override
	@Transactional
	public int insert(int no, Cart cart) {
		
		cart.setMemberNo(no);
		
		return cartMapper.insert(cart);
	}
	
		
}

	


