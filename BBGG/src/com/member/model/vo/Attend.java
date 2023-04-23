package com.member.model.vo;

import java.util.Date;

public class Attend {
	
	private int attend;
	private Date attendDate;
	public Attend() {
		super();
	}
	public Attend(int attend, Date attendDate) {
		super();
		this.attend = attend;
		this.attendDate = attendDate;
	}
	public int getAttend() {
		return attend;
	}
	public void setAttend(int attend) {
		this.attend = attend;
	}
	public Date getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}
	@Override
	public String toString() {
		return "Attend [attend=" + attend + ", attendDate=" + attendDate + "]";
	}
	
	
	
}
