//package com.scent.perfume.mypage.model.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//
//import lombok.extern.log4j.Log4j;
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Service
//public class ReviewServiceImpl implements ReviewService {
//	
//	@Autowired
//	private ReviewMapper reviewMapper;
//
//	@Autowired
//	private ImageAttachMapper attachMapper;
//	
//	@Override
//	public List<ReviewDTO> getReviewList(long productID) throws Exception {
//		return reviewMapper.getReviewList(productID);
//	}
//
//	@Override
//	public void insertReview(ReviewDTO reviewDTO) throws Exception {
//		reviewMapper.insertReview(reviewDTO);
//		
//		if (reviewDTO.getAttachList() == null || reviewDTO.getAttachList().size() <= 0) {
//			return;
//		}
//		
//		reviewDTO.getAttachList().forEach(attach -> {
//			attach.setReviewID(reviewDTO.getReviewID());
//			attachMapper.attachInsert(attach);
//		});
//	}
//
//	@Transactional
//	@Override
//	public void deleteReview(long reviewID) throws Exception {
//		int deleteResult = reviewMapper.deleteReview(reviewID);
//		
//		if (deleteResult == 1) {
//			attachMapper.attachDelete(reviewID);
//		}
//	}
//
//	@Override
//	public List<ReviewDTO> getMyReviewList(long memberID) throws Exception {
//		return reviewMapper.getMyReviewList(memberID);
//	}
//
//	@Override
//	public List<ProductDTO> getWriteableReview(long memberID) throws Exception {
//		return reviewMapper.getWriteableReview(memberID);
//	}
//
//	@Override
//	public void updateReview(ReviewDTO reviewDTO) throws Exception {
//		// 상품평 이미지 전체 삭제 후 새로 삽입
//		attachMapper.attachDelete(reviewDTO.getReviewID());
//		
//		if (reviewDTO.getAttachList() == null || reviewDTO.getAttachList().size() <= 0) {
//			return;
//		}
//		
//		reviewDTO.getAttachList().forEach(attach -> {
//			attach.setReviewID(reviewDTO.getReviewID());
//			attachMapper.attachInsert(attach);
//		});
//		
//		// 상품평 수정
//		reviewMapper.updateReview(reviewDTO);
//	}
//
//}