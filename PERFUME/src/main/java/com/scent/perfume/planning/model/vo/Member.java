package com.scent.perfume.planning.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private int division;
	
	private String status;
	
	private String path;
	
	private String id;
	
	private String pwd;
	
	private String name;
	
	private Date birth;
	
	private String gender;
	
	private String mail;
	
	private String phone;
	
	private String addr;
	
	private int point;
	
	private Date create;
	
	private Date update;
	
	private String mailStatus;
}
