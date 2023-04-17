package com.scent.perfume.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Terms {
	
	// 선택 약관 번호
	private int tNo;
	// 회원번호
	private int mNo;
	// 체크여부 (선택약관동의했다면 Y, 동의하지않았다면 N)
	private String tCheck;
	
}
