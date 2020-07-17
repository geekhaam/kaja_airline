package com.kaja_air.admin.VO;

import java.util.Date;//切郊税 Date

public class AdmimVO {
	//table clients
	private String cId;
	private String cPw;
	private String cName;
	private String cTel;
	private String cEmail;
	private String cNation;
	private String cResiAddr;
	
	//table notice
	private int nNo;
	private String nTitle;
	private String nDate;
	private String nContent;
	private String nFile;
	private String nFname;
	

	//table inquire
	private int iNo;
	private String iId;
	private String iName;
	private String iTitle;
	private String iDate;
	private String iContent;
	private String iFile;
	
	//table schedule	
	private int pId;
	private String pDTime;
	private String pATime;
	private String pDeparture;
	private String pArrive;
	private int pAdultPrice;
	private int pChildPrice;
	private int pBabyPrice;
	
	
	public AdmimVO() {
		
	}
	
	//clients 持失切
	public AdmimVO(String cId, String cPw, String cName, String cTel, String cEmail, String cNation, String cResiAddr ) {
		this.cId = cId;
		this.cPw = cPw;
		this.cName = cName;
		this.cTel = cTel;
		this.cEmail = cEmail;
		this.cNation = cNation;
		this.cResiAddr = cResiAddr;
	}
	
	//notice 持失切
	public AdmimVO(int nNo, String nTitle, String nDate, String nContent, String nFile, String nFname ) {
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nDate = nDate;
		this.nContent = nContent;
		this.nFile = nFile;
		this.nFname = nFname;
		
	}
	//inquire 持失切
	public AdmimVO(int iNo, String iId, String iName, String iTitle, String iDate, String iContent, String iFile) {
		this.iNo = iNo;
		this.iId = iId;
		this.iName = iName;
		this.iTitle = iTitle;
		this.iDate = iDate;
		this.iContent = iContent;
		this.iFile = iFile;
		
	}
	//schedule 持失切
	public AdmimVO(int pId, String pDTime, String pATime, String pDeparture, String pArrive, int pAdultPrice, int pChildPrice, int pBabyPrice ) {
		this.pId = pId;
		this. pDTime = pDTime;
		this.pATime = pATime;
		this.pDeparture = pDeparture;
		this.pArrive = pArrive;
		this.pAdultPrice = pAdultPrice;
		this.pChildPrice = pChildPrice;
		this.pBabyPrice = pBabyPrice;
		
	}
	

	
	


	
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcPw() {
		return cPw;
	}
	public void setcPw(String cPw) {
		this.cPw = cPw;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcNation() {
		return cNation;
	}
	public void setcNation(String cNation) {
		this.cNation = cNation;
	}
	public String getcResiAddr() {
		return cResiAddr;
	}
	public void setcResiAddr(String cResiAddr) {
		this.cResiAddr = cResiAddr;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnFile() {
		return nFile;
	}
	public void setnFile(String nFile) {
		this.nFile = nFile;
	}
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiId() {
		return iId;
	}
	public void setiId(String iId) {
		this.iId = iId;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public String getiDate() {
		return iDate;
	}
	public void setiDate(String iDate) {
		this.iDate = iDate;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public String getiFile() {
		return iFile;
	}
	public void setiFile(String iFile) {
		this.iFile = iFile;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
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
	public String getnFname() {
		return nFname;
	}

	public void setnFname(String nFname) {
		this.nFname = nFname;
	}
	
	
}
