package com.scent.perfume.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventMember {
	// 참여 번호	(각 이벤트에 대해 어떤 회원들이 참여했는지 모으는 EVENT_MEMBER 테이블의 PK)
	private int emNo;
	// 혜택 번호	(회원들이 참여한 이벤트 번호 BENEFIT 테이블의 PK)
	private int bnNo;
	// 참여 회원 번호
	private int emMNo;
}
