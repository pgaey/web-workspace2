package com.store.model.vo;

public class Store {
	
	private int storeNo;	//NUMBER	NOT NULL,
    private String name; //NAME	VARCHAR2(40)	NOT NULL,
    private String local; //LOCAL	VARCHAR2(10)	NOT NULL,
	private String address; //ADDRESS	VARCHAR2(200)	NOT NULL,
	private String open; //OPEN	VARCHAR2(100)	NULL,
	private String close; //CLOSE	VARCHAR2(100)	NULL,
	private String breaktime; //BREAK	VARCHAR2(100)	NULL,
	private String dayoff; // DAYOFF	VARCHAR2(100)	NULL,
	private int tel; //TEL	NUMBER	NULL,
	private String parking; //PARKING	VARCHAR2(8)	NULL,
	private String insta; //INSTA	VARCHAR2(200)	NULL,
	private String youtube; //YOUTUBE	VARCHAR2(100)	NULL,
	private String logo; //LOGO	VARCHAR2(100)	NULL,
	
	public Store() {
		super();
	}

	public Store(int storeNo, String name, String local, String address, String open, String close, String breaktime,
			String dayoff, int tel, String parking, String insta, String youtube, String logo) {
		super();
		this.storeNo = storeNo;
		this.name = name;
		this.local = local;
		this.address = address;
		this.open = open;
		this.close = close;
		this.breaktime = breaktime;
		this.dayoff = dayoff;
		this.tel = tel;
		this.parking = parking;
		this.insta = insta;
		this.youtube = youtube;
		this.logo = logo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getBreaktime() {
		return breaktime;
	}

	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}

	public String getDayoff() {
		return dayoff;
	}

	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getInsta() {
		return insta;
	}

	public void setInsta(String insta) {
		this.insta = insta;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", name=" + name + ", local=" + local + ", address=" + address + ", open="
				+ open + ", close=" + close + ", breaktime=" + breaktime + ", dayoff=" + dayoff + ", tel=" + tel
				+ ", parking=" + parking + ", insta=" + insta + ", youtube=" + youtube + ", logo=" + logo + "]";
	}
	
}
