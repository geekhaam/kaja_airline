package airuserVO;

public class AirUserVO {

	private String cId;
	private String cPw;
	private String cName;
	private String cTel;
	private String cEmail;
	private String cNation;
	private String cResiAddr;
	
	public AirUserVO(){
		
	}
	
	public AirUserVO(String cId, String cPw, String cName, String cTel, String cEmail, String cNation,
			String cResiAddr) {
		super();
		this.cId = cId;
		this.cPw = cPw;
		this.cName = cName;
		this.cTel = cTel;
		this.cEmail = cEmail;
		this.cNation = cNation;
		this.cResiAddr = cResiAddr;
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
	
	
}
