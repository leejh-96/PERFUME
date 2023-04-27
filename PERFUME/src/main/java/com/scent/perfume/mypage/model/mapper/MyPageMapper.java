package com.scent.perfume.mypage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.scent.perfume.mypage.model.vo.CouponDTO;
import com.scent.perfume.mypage.model.vo.DeliveryAddressDTO;
import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.mypage.model.vo.OrderDTO;
import com.scent.perfume.mypage.model.vo.OrderDetailDTO;
import com.scent.perfume.mypage.model.vo.OrderPerformanceDTO;
import com.scent.perfume.mypage.model.vo.PointDTO;

@Mapper
public interface MyPageMapper {

    List<OrderDetailDTO> getOrderDetailList(@Param("memberId") long memberId, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

    List<OrderDTO> getOrderList(long orderNumber) throws Exception;

    OrderDetailDTO getOrderDetailListDetail(long orderNumber) throws Exception;

    void updateOrderStatus(@Param("orderHistoryNumber") long orderHistoryNumber, @Param("status") String status) throws Exception;

    void updateAllOrderStatus(@Param("orderNumber")long orderNumber, @Param("status")String status)throws Exception;
    
    void makeInquirable(long orderHistoryNumber) throws Exception;
    
    void makeAllInquirable(long orderNumber)throws Exception;
    
    void refundAllPoint(long orderNumber)throws Exception;
    
    int getMemberPoint(long memberId) throws Exception;
	
	int getEarnedPoint(long memberId) throws Exception;

    int getPurchaseAmount(long memberId) throws Exception;

    int getDiscountAmount(long memberId) throws Exception;
    
    int getEstimatedPoint(long orderNumber) throws Exception;

    long getReceiptCount(long memberId) throws Exception;

    long getAvailableCouponCount(long memberId) throws Exception;

    long getUnavailableCouponCount(long memberId) throws Exception;

    long getPointHistoryCount(long memberId) throws Exception;
    
    List<PointDTO> getPointHistory(@Param("memberId") long memberId, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

	List<PointDTO> getSpecificPointHistory(@Param("memberId") long memberId, @Param("type") String type, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

	List<PointDTO> getPointHistoryByPeriod(@Param("memberId") long memberId, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

	List<PointDTO> getSpecificPointHistoryByPeriod(@Param("memberId") long memberId, @Param("type") String type, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

    long getSpecificPointHistoryCount(@Param("memberId") long memberId, @Param("type") String type) throws Exception;
	
	long getPointHistoryCountByPeriod(@Param("memberId") long memberId, @Param("startDate") String startDate, @Param("endDate") String endDate) throws Exception;
	
	long getSpecificPointHistoryCountByPeriod(@Param("memberId") long memberId, @Param("type") String type, @Param("startDate") String startDate, @Param("endDate") String endDate) throws Exception;
    
    List<CouponDTO> getAvailableCoupon(@Param("memberId") long memberId, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

    List<CouponDTO> getUnavailableCoupon(@Param("memberId") long memberId, @Param("startNum") long startNum, @Param("endNum") long endNum) throws Exception;

    List<DeliveryAddressDTO> getAddressList(long memberId) throws Exception;

    DeliveryAddressDTO getDefaultAddress(long memberId) throws Exception;

    void addAddress(DeliveryAddressDTO dto) throws Exception;

    void updateAddress(DeliveryAddressDTO dto) throws Exception;

    void deleteAddress(@Param("memberId") long memberId, @Param("addressId") long addressId) throws Exception;

    void setDefault(@Param("memberId") long memberId, @Param("addressId") long addressId) throws Exception;

    void cancelDefault(long memberId) throws Exception;

    String confirmPassword(long memberId) throws Exception;

    void changePassword(@Param("memberId") long memberId, @Param("newPassword") String newPassword) throws Exception;

    void changeInfo(@Param("memberId") long memberId, @Param("birthDate") String birthDate, @Param("gender") String gender) throws Exception;

    void insertResignMember(@Param("dto") MemberDTO dto, @Param("resignDetail") String resignDetail) throws Exception;

    void disableMember(long memberId) throws Exception;

    List<OrderDetailDTO> getReceiptHistoryPages(@Param("memberId") long memberId, @Param("startPages") int startPages) throws Exception;

    OrderPerformanceDTO getOrderPerformance(long memberId) throws Exception;

    List<OrderPerformanceDTO> getOrderPerformanceAll() throws Exception;

	MemberDTO getMemberInfo(@Param("no")int no);

}
