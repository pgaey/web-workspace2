package com.store.model.vo;

import java.util.Date;

public class StoreQuestion {
	
	private int sqNo; //SQ_NO	NUMBER	NOT NULL PRIMARY KEY,
	private int storeNo; //S_NO	NUMBER	NOT NULL REFERENCES STORE(S_NO),
	private int memNo; //MEM_NO	NUMBER	NOT NULL REFERENCES MEMBER(MEM_NO),
	private String question; //QUESTION	VARCHAR2(1000)	NOT NULL,
	private Date questionDate; //QUESTION_DATE	DATE	NOT NULL,
	private String answer; //ANSWER	VARCHAR2(1000)	NULL,
	private Date answerDate; //ANSWER_DATE	DATE	NULL
	
	public StoreQuestion() {
		super();
	}

	public StoreQuestion(int sqNo, int storeNo, int memNo, String question, Date questionDate, String answer,
			Date answerDate) {
		super();
		this.sqNo = sqNo;
		this.storeNo = storeNo;
		this.memNo = memNo;
		this.question = question;
		this.questionDate = questionDate;
		this.answer = answer;
		this.answerDate = answerDate;
	}

	public int getSqNo() {
		return sqNo;
	}

	public void setSqNo(int sqNo) {
		this.sqNo = sqNo;
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
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
		return "StoreQuestion [sqNo=" + sqNo + ", storeNo=" + storeNo + ", memNo=" + memNo + ", question=" + question
				+ ", questionDate=" + questionDate + ", answer=" + answer + ", answerDate=" + answerDate + "]";
	}

}
