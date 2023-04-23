package com.store.model.vo;

public class Category {
	
	private int cateNo; //CATE_NO NUMBER PRIMARY KEY,
	private String cate; //CATE VARCHAR2(100)
	
	public Category() {
		super();
	}

	public Category(int cateNo, String cate) {
		super();
		this.cateNo = cateNo;
		this.cate = cate;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	@Override
	public String toString() {
		return "Category [cateNo=" + cateNo + ", cate=" + cate + "]";
	}
}
