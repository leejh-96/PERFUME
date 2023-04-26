package com.scent.perfume.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.ProductBoard;
import com.scent.perfume.product.model.vo.ProductBoardCategory;
import com.scent.perfume.product.model.vo.ProductBoardReply;
import com.scent.perfume.product.model.vo.ProductLike;
import com.scent.perfume.product.model.vo.TopCate;

@Mapper
public interface ProductMapper {

	int selectProductCount(@Param("gender") String gender,
			@Param("sort") String sort, 
			@Param("brand") String bn,
			@Param("keyword") String keyword);

	List<Product> selectAll(RowBounds rowBounds, 
			@Param("gender") String gender, 
			@Param("sort") String sort, 
			@Param("brand") String bn,
			@Param("keyword") String keyword,
			@Param("MNo") String MNo
			);

	List<Product> selectProductByNo(@Param("no") int no);

	int selelctTopCateCount();

	List<TopCate> selectAllTopCate();

	List<Product> selectProductByPtNo(@Param("no") int no);

	int selectScentProductCountByNo(@Param("no") int no, @Param("gender") String gender, 
			@Param("brand") String bn,
			@Param("keyword") String keyword);

	List<Product> selectScentProductByNo(RowBounds rowBounds, @Param("no") int no,
			@Param("gender") String gender, 
			@Param("brand") String bn,
			@Param("sort") String sort, 
			@Param("keyword") String keyword, 
			@Param("MNo") String MNo);
	
		

	TopCate selectScentByNo(@Param("no") int no);

	int selectProductCountByGender(String gender);

	List<Product> selectProductByGender(RowBounds rowBounds, String gender);

	List<Product> selectBrandList();

	List<Option> selectProductOptionByNo(@Param("no") int no);

	int selectProductPaperCount();

	List<Product> selectPaperAll(@Param("sort") String sort, RowBounds rowBounds, @Param("MNo") String mNo);

	List<ProductBoard> selectProductBoardByNo(@Param("no") int no, RowBounds rowBounds);

	int selectProductBoardCount(int no);

	List<ProductBoard> selectGradeByNo(int no);

	int selectSaleProductCount();

	List<Product> selectSaleProductList(RowBounds rowBounds, @Param("MNo") String MNo);

	int selectQnaBoardCount(@Param("no") int no);

	List<ProductBoard> selectProductQnaByNo(@Param("no") int no, RowBounds rowBounds);

	List<ProductBoardReply> selectBoardReplyBypbNo(@Param("no") int pbNo);


	int insertReviewReply(ProductBoardReply reply);

	ProductBoardReply selectBoardReplyBypbrNo(@Param("pbrNo") int pbrNo);

	int insertReviewBoard(ProductBoard review);

	List<ProductBoardCategory> selectBoardCategoryList();

	ProductBoard selectBoardQnaBypbNo(@Param("pbNo") int pbNo);

	int insertQnaReply(ProductBoardReply qnaReply);

	int updateBoardReplyCount(int pbNo);

	int selectProductLikeByNo(ProductLike favorite);

	Product selectRelatedProductByNo(@Param("no") int no);

	List<Product> selectRelatedProductListByKeyword(@Param("brand") String brand , @Param("no") int no);

	int insertLike(ProductLike favorite);

	int delelteLike(@Param("MNo")int MNo, @Param("PNo")int PNo);

	int updateProductLikeCount(@Param("PNo")int PNo);

	int insertQnaBoard(ProductBoard qna);

	Product selectProductLikeCountByNo(@Param("PNo") int pNo);

	List<ProductLike> selectLikeListByNo(@Param("MNo") int no);

	ProductBoard selectReviewByPbNo(@Param("pbNo") int pbNo);

	List<Product> selectBestProductList();



	








	

	
	
	
}