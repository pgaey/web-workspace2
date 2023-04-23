package com.store.model.vo;

import java.util.Date;

public class StoreReview {
	
	private int srNo; //SQ_NO	NUMBER	NOT NULL PRIMARY KEY,
	private int storeNo; //S_NO	NUMBER	NOT NULL REFERENCES STORE(S_NO),
	private int memNo; //MEM_NO	NUMBER	NOT NULL REFERENCES MEMBER(MEM_NO),
	private String review; //QUESTION	VARCHAR2(1000)	NOT NULL,
	private Date reviewDate; //QUESTION_DATE	DATE	NOT NULL,
	private int star; //STAR NUMBER NOT NULL,
	private String answer; //ANSWER	VARCHAR2(1000)	NULL,
	private Date answerDate; //ANSWER_DATE	DATE	NULL
	
	public StoreReview() {
		super();
	}

	public StoreReview(int srNo, int storeNo, int memNo, String review, Date reviewDate, int star, String answer,
			Date answerDate) {
		super();
		this.srNo = srNo;
		this.storeNo = storeNo;
		this.memNo = memNo;
		this.review = review;
		this.reviewDate = reviewDate;
		this.star = star;
		this.answer = answer;
		this.answerDate = answerDate;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	@Override
	public String toString() {
		return "StoreReview [srNo=" + srNo + ", storeNo=" + storeNo + ", memNo=" + memNo + ", review=" + review
				+ ", reviewDate=" + reviewDate + ", star=" + star + ", answer=" + answer + ", answerDate=" + answerDate
				+ "]";
	}

}
