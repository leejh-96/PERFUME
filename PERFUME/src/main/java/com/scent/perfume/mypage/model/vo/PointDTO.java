package com.scent.perfume.mypage.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PointDTO {
			private long pointEventId;
			private String type;
			private long pointValue;
			private long inquirable;
			private Date pointCreatedDate;
			private long orderNumber;
			private long orderHistoryNumber;
			private long memberId;
			
}
