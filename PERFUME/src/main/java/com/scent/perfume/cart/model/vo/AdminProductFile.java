package com.scent.perfume.cart.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminProductFile {

	private int fileNo;
	private int productNo;
	private String originalFileName;
	private String renameFileName;
	private int fileSize;
	private String fileType;
	private Date createDate;
	private Date updateDate;
	private String fileStatus;
	private	int fileSort;
	
}
