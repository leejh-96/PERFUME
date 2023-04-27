package com.scent.perfume.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.product.model.mapper.ProductMapper;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.ProductBoard;
import com.scent.perfume.product.model.vo.ProductBoardCategory;
import com.scent.perfume.product.model.vo.ProductBoardReply;
import com.scent.perfume.product.model.vo.ProductLike;
import com.scent.perfume.product.model.vo.TopCate;

@Service

public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;
		
	@Override
	public int getProductCount(String gender, String sort, String bn, String keyword) {
		
		return mapper.selectProductCount(gender, sort, bn, keyword);
	}

	@Override
	public List<Product> findProductByNo(int no) {
		
		return mapper.selectProductByNo(no);
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo, String gender, String sort, String bn, String keyword, String MNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAll(rowBounds, gender, sort, bn, keyword, MNo);
	}

	@Override
	public int getTopCateCount() {
		
		return mapper.selelctTopCateCount();
	}

	@Override
	public List<TopCate> getTopCateList() {
		
		return mapper.selectAllTopCate();
	}

	@Override
	public List<Product> findByPtNo(int no) {
		
		return mapper.selectProductByPtNo(no);
	}

	
	@Override
	public TopCate findScentByNo(int no) {
		return mapper.selectScentByNo(no);
	}

	@Override
	public int getProductCountByGender(String gender) {
		
		return mapper.selectProductCountByGender(gender);
	}

	@Override
	public List<Product> getProductListByGender(PageInfo pageInfo, String gender) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
	
		return mapper.selectProductByGender(rowBounds, gender);
	}

	@Override
	public List<Product> getBrandList() {
		
		return mapper.selectBrandList();
	}

	@Override
	public int getScentProductCountByNo(int no, String gender, String bn, String keyword) {
		
		return mapper.selectScentProductCountByNo(no, gender, bn, keyword);
	}

	@Override
	public List<Product> getScentProductList(PageInfo pageInfo, int no, String gender, String bn, String sort,
			String keyword, String MNo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectScentProductByNo(rowBounds, no, gender, bn, sort, keyword, MNo);
	}

	@Override
	public List<Option> findProductOptionByNo(int no) {
		
		return mapper.selectProductOptionByNo(no);
	}

	@Override
	public int getProductPaperCount() {
		
		return mapper.selectProductPaperCount();
	}

	@Override
	public List<Product> getProductPaperList(PageInfo pageInfo, String sort, String MNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectPaperAll(sort, rowBounds, MNo);
	}

	@Override
	public List<ProductBoard> findProductBoardByNo(PageInfo pageInfo, int no) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectProductBoardByNo(no, rowBounds);
	}

	@Override
	public int getProductBoardCount(int no) {

		
		return mapper.selectProductBoardCount(no);
	}

	@Override
	public List<ProductBoard> findGradebyNo(int no) {
		
		return mapper.selectGradeByNo(no);
	}

	@Override
	public int getSaleProductCount() {
		
		return mapper.selectSaleProductCount();
	}

	@Override
	public List<Product> getSaleProductList(PageInfo pageInfo, String MNo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectSaleProductList(rowBounds, MNo);
	}

	@Override
	public int getProductQnaCount(int no) {
		
		return mapper.selectQnaBoardCount(no);
	}

	@Override
	public List<ProductBoard> findProductQnaByNo(PageInfo qnapageInfo, int no) {
		int limit = qnapageInfo.getListLimit();
		int offset = (qnapageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		
		return mapper.selectProductQnaByNo(no, rowBounds);
	}

	@Override
	public List<ProductBoardReply> findBypbNo(int pbNo) {
	
		return mapper.selectBoardReplyBypbNo(pbNo);
	}




	@Override
	public int save(ProductBoardReply reply) {
		int result = 0;
		

		if(reply.getPbrNo() > 0) {
			// update
//			result = mapper.updateBoard(board);
		} else {
			// insert
			result = mapper.insertReviewReply(reply);
			result = mapper.updateBoardReplyCount(reply.getPbNo());
		}
		
		return result; 
	}

	@Override
	public ProductBoardReply findBypbrNo(int pbrNo) {
		
		
		
		return mapper.selectBoardReplyBypbrNo(pbrNo);
	}

	@Override
	@Transactional
	public int save(ProductBoard review) {
        int result = 0;
		

		if(review.getPbNo() > 0) {
			// update
//			result = mapper.updateBoard(board);
		} else {
			// insert
			result = mapper.insertReviewBoard(review);
			
		}
		
		return result; 
	}

	@Override
	public List<ProductBoardCategory> getBoardCategoryList() {
		
		return mapper.selectBoardCategoryList();
	}

	@Override
	public ProductBoard findBoardQnaBypbNo(int pbNo) {
	
		return mapper.selectBoardQnaBypbNo(pbNo);
	}

	@Override
	@Transactional
	public int saveQnaReply(ProductBoardReply qnaReply) {
        int result = 0;
		
        
		if(qnaReply.getPbrNo() > 0) {
			// update
//			result = mapper.updateBoard(board);
			
		} else {
			// insert
			result = mapper.insertQnaReply(qnaReply);
			result = mapper.updateBoardReplyCount(qnaReply.getPbNo());
		
		}
		
		return result; 
	}

	@Override
	@Transactional
	public int findIsLike(ProductLike favorite) {
		int like = 0;
		int result = 0;
		like = mapper.selectProductLikeByNo(favorite);
	
//		if(like == 0) {
//			result = mapper.insertLike(favorite);
//			System.out.println("result1 : " + result);
//		} 
//		else if(like == 1)	{
//			result = mapper.delelteLike(favorite.getMNo(), favorite.getPNo());
//			System.out.println("result2 : " + result);
//		}
		
		

		return like;
		
	}

	@Override
	public Product findByRelatedProductByNo(int no) {
		
		return mapper.selectRelatedProductByNo(no);
	}

	@Override
	public List<Product> findRelatedProductByKeyword(String brand, int no) {
		
		return mapper.selectRelatedProductListByKeyword(brand, no);
	}

	@Override
	@Transactional
	public int saveLike(ProductLike favorite) {
        int result = 0;
        	
			result = mapper.insertLike(favorite);
	
			

		return result; 
		
	}

	@Override
	@Transactional
	public int deleteLike(ProductLike favorite) {
		int result = 0;
		
		    result = mapper.delelteLike(favorite.getMNo(), favorite.getPNo());
		    	
		  
		    
		return result;
	}

	@Override
	@Transactional
	public int updateProductLikeCount(int PNo) {
		
		return mapper.updateProductLikeCount(PNo);
	}

	@Override
	@Transactional
	public int saveQna(ProductBoard qna) {
        int result = 0;
		

		if(qna.getPbNo() > 0) {
			// update
//			result = mapper.updateBoard(board);
		} else {
			// insert
			result = mapper.insertQnaBoard(qna);
			
		}
		
		return result; 
	}

	@Override
	public Product findlikeCountByNo(int PNo) {
		
		
		
		return mapper.selectProductLikeCountByNo(PNo);
	}

	@Override
	public List<ProductLike> findLikeListByNo(int no) {
		
		return mapper.selectLikeListByNo(no);
	}

	@Override
	public Product getLikeCountByNo(int no) {
	
		return mapper.selectProductLikeCountByNo(no);
	}

	@Override
	public ProductBoard findReviewByPbNo(int pbNo) {
		
		return mapper.selectReviewByPbNo(pbNo);
	}

	@Override
	public List<Product> getBestProductList() {
		
		return mapper.selectBestProductList();
	}

	


	
	

}
