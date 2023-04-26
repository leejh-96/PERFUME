package com.scent.perfume.mypage.model.service;

import java.util.List;

import com.scent.perfume.mypage.model.vo.CouponDTO;
import com.scent.perfume.mypage.model.vo.DeliveryAddressDTO;
import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.mypage.model.vo.OrderDTO;
import com.scent.perfume.mypage.model.vo.OrderDetailDTO;
import com.scent.perfume.mypage.model.vo.OrderPerformanceDTO;
import com.scent.perfume.mypage.model.vo.PointDTO;
import com.scent.perfume.mypage.model.vo.UpdateMemberDTO;


public interface MyPageService {
	List<OrderDetailDTO> getReceiptHistory(long memberId, long page) throws Exception;
	
	List<OrderDetailDTO> getReceiptList(long memberId, long startNum, long endNum) throws Exception;
	
	List<OrderDTO> getOrderList(long orderNumber) throws Exception;
	
	OrderDetailDTO getOrderDetailDetail(long orderNumber) throws Exception;
	//
	void updateOrderStatus(long orderHistoryNumber, String orderStatus) throws Exception;
	
	void updateAllOrderStatus(long orderNumber, String orderStatus)throws Exception;
	
	int getMemberPoint(long memberId) throws Exception;

	int getEarnedPoint(long memberId) throws Exception;

	int getPurchaseAmount(long memberId) throws Exception;
	
	int getDiscountAmount(long memberId) throws Exception;
	
	int getEstimatedPoint(long orderNumber) throws Exception;
	
	long getReceiptCount(long membeId) throws Exception;
	
	long getCouponCount(long memberId, String type) throws Exception;
	
	long getPointHistoryCount(long memberId, String type, String startDate, String endDate) throws Exception;
	
	List<PointDTO> getPointHistory(long memberId, String type, long page, String startDate, String endDate) throws Exception;

	List<CouponDTO> getCouponHistory(long memberId, String type, long page) throws Exception;
	
	List<DeliveryAddressDTO> getAddressList(long memberId) throws Exception;

	DeliveryAddressDTO getDefaultAddress(long memberId) throws Exception;

	void addAddress(DeliveryAddressDTO dto) throws Exception;
	
	void updateAddress(DeliveryAddressDTO dto) throws Exception;
	
	void deleteAddress(long memberId, long addressId) throws Exception;
	
	void setDefault(long memberId, long addressId) throws Exception;

	void cancelDefault(long memberId) throws Exception;

	boolean confirmPassword(String userPassword, String comparePassword) throws Exception;

	boolean changePassword(String curPassword, String newPassword, MemberDTO dto) throws Exception;
	
	boolean changeInfo(UpdateMemberDTO updateDTO, MemberDTO memberDTO) throws Exception;

	boolean resignMember(String resignDetail, String userPassword, MemberDTO dto) throws Exception;

	//고객센터에서 불러올 주문내역
	List<OrderDetailDTO> getReceiptHistoryPages(long memberId, int pages) throws Exception;
	
	OrderPerformanceDTO getOrderPerformance(long memberId) throws Exception;

	MemberDTO getMember(int no);

	MemberDTO getMember(String name);

	static boolean confirmPassword(Long memberId, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	static MemberDTO getMemberId(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}