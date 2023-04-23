package com.store.model.vo;

public class StoreCategory {
	
	private int storeNo;
	private int cateNo;
	
	public StoreCategory() {
		super();
	}

	public StoreCategory(int storeNo, int cateNo) {
		super();
		this.storeNo = storeNo;
		this.cateNo = cateNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	@Override
	public String toString() {
		return "StoreCategory [storeNo=" + storeNo + ", cateNo=" + cateNo + "]";
	}
	
	

}
