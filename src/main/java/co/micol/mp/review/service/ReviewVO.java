package co.micol.mp.review.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class ReviewVO {
	private int reviewNo;
	private String productId;
	private String memberId;
	private String reviewSubject;
	private String memberName;

	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date reviewDate;
}
//REVIEW_NO      NOT NULL NUMBER        
//PRODUCT_ID     NOT NULL VARCHAR2(20)  
//MEMBER_ID      NOT NULL VARCHAR2(20)  
//REVIEW_SUBJECT          VARCHAR2(512) 
