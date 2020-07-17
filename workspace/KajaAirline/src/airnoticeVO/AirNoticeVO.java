package airnoticeVO;

import java.util.Date;

public class AirNoticeVO {

	private int nNo;
	private String nTitle;
	private Date nDate;
	private String nContent;
	private String nFile;
	private String nFName;
	
	public AirNoticeVO() {
		
	}
	
	public AirNoticeVO(int nNo, String nTitle, Date nDate, String nContent, String nFile, String nFName) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nDate = nDate;
		this.nContent = nContent;
		this.nFile = nFile;
		this.nFName = nFName;
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
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
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
	public String getnFName() {
		return nFName;
	}
	public void setnFName(String nFName) {
		this.nFName = nFName;
	}
	
}
