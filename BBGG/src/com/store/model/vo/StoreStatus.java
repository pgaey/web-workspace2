package com.store.model.vo;

public class StoreStatus {
	
	private int s_no; //S_NO NUMBER REFERENCES STORE(S_NO),
	private int manager; //MANAGER NUMBER NOT NULL,
	private int status; //STATUS NUMBER DEFAULT 1 NULL CHECK(STATUS IN(0, 1, 2, 3))
	
	public StoreStatus() {
		super();
	}

	public StoreStatus(int s_no, int manager, int status) {
		super();
		this.s_no = s_no;
		this.manager = manager;
		this.status = status;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "StoreStatus [s_no=" + s_no + ", manager=" + manager + ", status=" + status + "]";
	}
	
}
