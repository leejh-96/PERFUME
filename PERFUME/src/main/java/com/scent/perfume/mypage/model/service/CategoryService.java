package com.scent.perfume.mypage.model.service;

import java.util.List;

import com.scent.perfume.mypage.model.vo.CategoryDTO;


public interface CategoryService {
	public List<CategoryDTO> getCategoryParentList() throws Exception;
	
	public List<CategoryDTO> getCategoryList(long parentID) throws Exception;
	
	public String getCategoryName(long categoryID) throws Exception;
	
	public List<CategoryDTO> getMdsCategoryParentList();
	
	public List<CategoryDTO> showCategoryMenu() throws Exception;

	public long getCategoryId(long productID) throws Exception;
}