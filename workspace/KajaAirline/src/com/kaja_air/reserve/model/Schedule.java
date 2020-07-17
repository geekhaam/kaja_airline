package com.kaja_air.reserve.model;


public class Schedule {
	private int pId;
	private String pName;
	private String pDTime;
	private String pATime;
	private int pFTime;
	private String pDeparture;
	private String pArrive;
	private int pAdultPrice;
	private int pChildPrice;
	private int pBabyPrice;
	private int remainSeat;
	
	public Schedule(int pId, String pName, String pDTime, String pATime, int pFTime, String pDeparture, String pArrive, int pAdultPrice,
			int pChildPrice, int pBabyPrice, int remainSeat) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDTime = pDTime;
		this.pATime = pATime;
		this.pFTime = pFTime;
		this.pDeparture = pDeparture;
		this.pArrive = pArrive;
		this.pAdultPrice = pAdultPrice;
		this.pChildPrice = pChildPrice;
		this.pBabyPrice = pBabyPrice;
		this.remainSeat = remainSeat;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}
	
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDTime() {
		return pDTime;
	}

	public void setpDTime(String pDTime) {
		this.pDTime = pDTime;
	}

	public String getpATime() {
		return pATime;
	}

	public void setpATime(String pATime) {
		this.pATime = pATime;
	}

	public int getpFTime() {
		return pFTime;
	}

	public void setpFTime(int pFTime) {
		this.pFTime = pFTime;
	}

	public String getpDeparture() {
		return pDeparture;
	}

	public void setpDeparture(String pDeparture) {
		this.pDeparture = pDeparture;
	}

	public String getpArrive() {
		return pArrive;
	}

	public void setpArrive(String pArrive) {
		this.pArrive = pArrive;
	}

	public int getpAdultPrice() {
		return pAdultPrice;
	}

	public void setpAdultPrice(int pAdultPrice) {
		this.pAdultPrice = pAdultPrice;
	}

	public int getpChildPrice() {
		return pChildPrice;
	}

	public void setpChildPrice(int pChildPrice) {
		this.pChildPrice = pChildPrice;
	}

	public int getpBabyPrice() {
		return pBabyPrice;
	}

	public void setpBabyPrice(int pBabyPrice) {
		this.pBabyPrice = pBabyPrice;
	}

	public int getRemainSeat() {
		return remainSeat;
	}

	public void setRemainSeat(int remainSeat) {
		this.remainSeat = remainSeat;
	}

	@Override
	public String toString() {
		return "{\"pId\":\""+pId + "\", \"pName\":\""+pName + "\", \"pDTime\":\""+pDTime + ", \"pATime\":"+pATime
				+ "\", \"pFTime\":\""+pFTime + "\", \"pDeparture\":\""+pDeparture + "\", \"pArrive\":\""+pArrive
				+ "\", \"pAdultPrice\":\""+pAdultPrice + "\", \"pChildPrice\":\""+pChildPrice + "\", \"pBabyPrice\":\""+pBabyPrice
				+ "\", \"remainSeat\":\""+remainSeat + "\"}";
	}
	
	
}
