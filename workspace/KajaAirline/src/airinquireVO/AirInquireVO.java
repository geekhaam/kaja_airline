package airinquireVO;

import java.util.Date;

public class AirInquireVO {
	
	private int iNo;
	private String iId;
	private String iName;
	private String iTitle;
	private Date iDate;
	private String iContent;
	private String iFile;
	private String iFilePath;
	
	public AirInquireVO() {
		
	}
	
	public AirInquireVO(int iNo, String iId, String iName, String iTitle, Date iDate, String iContent, String iFile, String iFilePath) {
		super();
		this.iNo = iNo;
		this.iId = iId;
		this.iName = iName;
		this.iTitle = iTitle;
		this.iDate = iDate;
		this.iContent = iContent;
		this.iFile = iFile;
		this.iFilePath = iFilePath;
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
	public Date getiDate() {
		return iDate;
	}
	public void setiDate(Date iDate) {
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
	public String getiFilePath() {
		return iFile;
	}
	public void setiFilePath(String iFilePath) {
		this.iFilePath = iFilePath;
	}
	

}
