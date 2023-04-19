package com.scent.perfume.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberBenefitInfo {
	
	// 회원혜택정보번호
	private int mbiNo;
	// 회원번호
	private int mNo;
	// 혜택번호(benefit vo의 혜택번호)
	private int bnNo;
	// 사용상태(회원이 쿠폰을 사용했는지 안 했는지 여부 확인. 미사용(Y) 사용(N))
	private String mbiStatus;
	
}
