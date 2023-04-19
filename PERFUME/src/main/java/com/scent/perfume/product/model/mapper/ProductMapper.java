package com.scent.perfume.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.TopCate;

@Mapper
public interface ProductMapper {

	int selectProductCount(@Param("gender") String gender);

	List<Product> selectAll(RowBounds rowBounds, 
			@Param("gender") String gender, 
			@Param("sort") String sort, 
			@Param("brand") String bn,
			@Param("keyword") String keyword);

	List<Product> selectProductByNo(@Param("no") int no);

	int selelctTopCateCount();

	List<TopCate> selectAllTopCate();

	List<Product> selectProductByPtNo(@Param("no") int no);

	int selectScentProductCountByNo(@Param("no") int no);

	List<Product> selectScentProductByNo(RowBounds rowBounds, @Param("no") int no);

	TopCate selectScentByNo(@Param("no") int no);

	int selectProductCountByGender(String gender);

	List<Product> selectProductByGender(RowBounds rowBounds, String gender);

	List<Product> selectBrandList();
	

	
	
	
}