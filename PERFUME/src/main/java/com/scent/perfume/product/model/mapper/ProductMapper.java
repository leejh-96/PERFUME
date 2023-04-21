package com.scent.perfume.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.ProductBoard;
import com.scent.perfume.product.model.vo.ProductBoardReply;
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
			@Param("keyword") String keyword);

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
			@Param("keyword") String keyword);
	
		

	TopCate selectScentByNo(@Param("no") int no);

	int selectProductCountByGender(String gender);

	List<Product> selectProductByGender(RowBounds rowBounds, String gender);

	List<Product> selectBrandList();

	List<Option> selectProductOptionByNo(@Param("no") int no);

	int selectProductPaperCount();

	List<Product> selectPaperAll(@Param("sort") String sort, RowBounds rowBounds);

	List<ProductBoard> selectProductBoardByNo(@Param("no") int no, RowBounds rowBounds);

	int selectProductBoardCount(int no);

	List<ProductBoard> selectGradeByNo(int no);

	int selectSaleProductCount();

	List<Product> selectSaleProductList(RowBounds rowBounds);

	int selectQnaBoardCount(@Param("no") int no);

	List<ProductBoard> selectProductQnaByNo(@Param("no") int no, RowBounds rowBounds);

	List<ProductBoardReply> selectBoardReplyBypbNo(@Param("no") int pbNo);


	int insertReviewReply(ProductBoardReply reply);

	ProductBoardReply selectBoardReplyBypbrNo(@Param("pbrNo") int pbrNo);  








	

	
	
	
}