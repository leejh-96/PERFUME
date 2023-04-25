package com.scent.perfume.mypage.model.vo;

import java.util.List;

public class CategoryDTO {
	private long parentID;
	private long categoryID;
	private long productID;
	private String categoryName;
	private String categoryType;
//	private String MD;
	
	private List<CategoryDTO> categoryList;
}
