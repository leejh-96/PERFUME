package com.scent.perfume.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.mypage.model.mapper.MyPageMapper;
import com.scent.perfume.mypage.model.vo.CouponDTO;
import com.scent.perfume.mypage.model.vo.DeliveryAddressDTO;
import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.mypage.model.vo.OrderDTO;
import com.scent.perfume.mypage.model.vo.OrderDetailDTO;
import com.scent.perfume.mypage.model.vo.OrderPerformanceDTO;
import com.scent.perfume.mypage.model.vo.PointDTO;
import com.scent.perfume.mypage.model.vo.UpdateMemberDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService {
	private int contentPerPage = 10;
	
	private int receiptPerPage = 5;
	
	@Autowired
	private final MyPageMapper mapper;
	
	@Autowired
	private final BCryptPasswordEncoder passwordEncoder;

	@Override
//	@Transactional
	public List<OrderDetailDTO> getReceiptHistory(long memberId, long page) throws Exception {
		long startNum = (page-1) * receiptPerPage + 1;
		long endNum = page * receiptPerPage;
		List<OrderDetailDTO> receiptList = getReceiptList(memberId, startNum, endNum);
		for(OrderDetailDTO receipt : receiptList) {
			try {
				List<OrderDTO> orderList = getOrderList(receipt.getOrderNumber());
				receipt.setOrderList(orderList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return receiptList;
	}
	
	@Override
	public List<OrderDetailDTO> getReceiptList(long memberId, long startNum, long endNum) throws Exception {
		return mapper.getOrderDetailList(memberId, startNum, endNum);
	}

	@Override
	public List<OrderDTO> getOrderList(long orderNumber) throws Exception {
		return mapper.getOrderList(orderNumber);
	}
	
	@Override
	@Transactional
	public OrderDetailDTO getOrderDetailDetail(long orderNumber) throws Exception {
		OrderDetailDTO dto = mapper.getOrderDetailListDetail(orderNumber);
		dto.setOrderList(mapper.getOrderList(orderNumber));
		return dto;
	}

	@Override
	@Transactional
	public void updateOrderStatus(long orderHistoryNumber, String status) throws Exception {
		mapper.updateOrderStatus(orderHistoryNumber, status);
		if(status.equals("F")) mapper.makeInquirable(orderHistoryNumber);
	}

	@Override
	public int getMemberPoint(long memberId) throws Exception {
		return mapper.getMemberPoint(memberId);
	}

	@Override
	public int getEarnedPoint(long memberId) throws Exception {
		return mapper.getEarnedPoint(memberId);
	}

	@Override
	public int getPurchaseAmount(long memberId) throws Exception {
		return mapper.getPurchaseAmount(memberId);
	}

	@Override
	public int getDiscountAmount(long memberId) throws Exception {
		return mapper.getDiscountAmount(memberId);
	}
	
	@Override
	public int getEstimatedPoint(long orderNumber) throws Exception {
		return mapper.getEstimatedPoint(orderNumber);
	}
	
	@Override
	public long getReceiptCount(long membeId) throws Exception {
		return mapper.getReceiptCount(membeId);
	}
	
	@Override
	public long getCouponCount(long memberId, String type) throws Exception {
		if(type.equals("available")) return mapper.getAvailableCouponCount(memberId);
		return mapper.getUnavailableCouponCount(memberId);
	}

	@Override
	public long getPointHistoryCount(long memberId, String type, String startDate, String endDate) throws Exception {
		if(startDate==null || endDate==null) {
			if(type.equals("all")) return mapper.getPointHistoryCount(memberId);
			return mapper.getSpecificPointHistoryCount(memberId, type);
		}
		else {
			if(type.equals("all")) return mapper.getPointHistoryCountByPeriod(memberId, startDate, endDate);
			return mapper.getSpecificPointHistoryCountByPeriod(memberId, type, startDate, endDate);
		}
	}
	
	@Override
	public List<PointDTO> getPointHistory(long memberId, String type, long page, String startDate, String endDate) throws Exception {
		long startNum = (page-1) * contentPerPage + 1;
		long endNum = page * contentPerPage;
		if(startDate==null || endDate==null) {
			if(type.equals("all")) return mapper.getPointHistory(memberId, startNum, endNum);
			return mapper.getSpecificPointHistory(memberId, type, startNum, endNum);
		}
		else {
			if(type.equals("all")) return mapper.getPointHistoryByPeriod(memberId, startDate, endDate, startNum, endNum);
			return mapper.getSpecificPointHistoryByPeriod(memberId, type, startDate, endDate, startNum, endNum);
		}
	}

	@Override
	public List<CouponDTO> getCouponHistory(long memberId, String type, long page) throws Exception {
		long startNum = (page-1) * contentPerPage + 1;
		long endNum = page * contentPerPage;
		if(type.equals("available")) return mapper.getAvailableCoupon(memberId, startNum, endNum);
		return mapper.getUnavailableCoupon(memberId, startNum, endNum);
	}
	
	@Override
	public List<DeliveryAddressDTO> getAddressList(long memberId) throws Exception {
		return mapper.getAddressList(memberId);
	}
	
	@Override
	public DeliveryAddressDTO getDefaultAddress(long memberId) throws Exception {
		return mapper.getDefaultAddress(memberId);
	}
	
	
//	이곳은 사고인가 아닌가
	
//	@Override
//	@Transactional
//	public void addAddress(DeliveryAddressDTO dto) throws Exception {
//		if(dto.getIsDefault()==1) mapper.cancelDefault(dto.getMemberId()); // 기본 배송지가 설정돼있으면 제거
//		mapper.addAddress(dto);
//	}
//
//	@Override
//	@Transactional
//	public void updateAddress(DeliveryAddressDTO dto) throws Exception {
//		if(dto.getIsDefault()==1) mapper.cancelDefault(dto.getMemberId()); // 기본 배송지가 설정돼있으면 제거
//		mapper.updateAddress(dto);
//	}
	
	@Override
	@Transactional
	public void updateAllOrderStatus(long orderNumber, String status) throws Exception {
		mapper.updateAllOrderStatus(orderNumber, status);
		if(status.equals("F")) mapper.makeAllInquirable(orderNumber);
		
		//구매 취소한경우 사용 포인트 돌력주기
		//이건 왜 넣은것일까
		if(status.equals("C")) mapper.refundAllPoint(orderNumber);
	}
	
	@Override
	public void deleteAddress(long memberId, long addressId) throws Exception {
		mapper.deleteAddress(memberId, addressId);
	}
	
	@Override
	@Transactional
	public void setDefault(long memberId, long addressId) throws Exception {
		mapper.cancelDefault(memberId);
		mapper.setDefault(memberId, addressId);
	}

	@Override
	public void cancelDefault(long memberId) throws Exception {
		mapper.cancelDefault(memberId);
	}


	@Override
	public boolean confirmPassword(String userPassword, String comparePassword) throws Exception {
		return passwordEncoder.matches(userPassword, comparePassword);
	}

	@Override
	public boolean changePassword(String curPassword, String newPassword, MemberDTO dto) throws Exception {
		if(!confirmPassword(curPassword, dto.getPassword())) return false;
		mapper.changePassword(dto.getMemberId(), passwordEncoder.encode(newPassword));
		return true;
	}

	@Override
	@Transactional
	public boolean resignMember(String resignDetail, String userPassword, MemberDTO dto) throws Exception {
		if(!confirmPassword(userPassword, dto.getPassword())) return false;
		mapper.insertResignMember(dto, resignDetail);
		mapper.disableMember(dto.getMemberId());
		return true;
	}

	//고객 센터에서 불러올 주문내역
	@Override
	public List<OrderDetailDTO> getReceiptHistoryPages(long memberId, int pages) throws Exception {
		int startPages = 0;
		if(pages == 1) {
			startPages = 0;
		}else {
			startPages = ((pages-1) * 10) + 1;
		}
		
		List<OrderDetailDTO> receiptList = mapper.getReceiptHistoryPages(memberId, startPages);
		for(OrderDetailDTO receipt : receiptList) {
			try {
				List<OrderDTO> orderList = getOrderList(receipt.getOrderNumber());
				receipt.setOrderList(orderList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return receiptList;
	}

	@Override
	public OrderPerformanceDTO getOrderPerformance(long memberId) throws Exception {
		return mapper.getOrderPerformance(memberId);
	}

	@Override
	public void addAddress(DeliveryAddressDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAddress(DeliveryAddressDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean changeInfo(UpdateMemberDTO updateDTO, MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO getMember(int no) {
		
		return mapper.getMemberInfo(no);
	}

	@Override
	public MemberDTO getMember(String name) {
		return null;
	}
}