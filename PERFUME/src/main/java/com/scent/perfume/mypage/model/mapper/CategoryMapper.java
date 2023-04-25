package com.scent.perfume.mypage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.scent.perfume.mypage.model.vo.CategoryDTO;


public interface CategoryMapper {
	public List<CategoryDTO> getCategoryParentList() throws Exception;
	
	public List<CategoryDTO> getCategoryList(long parentID) throws Exception;
	
	public String getCategoryName(long categoryID) throws Exception;
	
	public List<CategoryDTO> findCategoryByMd();
	
	public CategoryDTO findCategoryById(@Param("id") long categoryId);
	
	// 상품 번호로 부모 카테고리 번호 조회
	public long getCategoryId(long productID) throws Exception;
}