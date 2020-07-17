package airfaqVO;

public class AirFAQVO {

	private String qId;
	private String qQuestion;
	private String qAnswer;
	private String qKategorie;
	
	public AirFAQVO() {}
	
	public AirFAQVO(String qId, String qQuestion, String qAnswer, String qKategorie) {
		super();
		this.qId = qId;
		this.qQuestion = qQuestion;
		this.qAnswer = qAnswer;
		this.qKategorie = qKategorie;
	}
	
	public String getqId() {
		return qId;
	}
	public void setqId(String qId) {
		this.qId = qId;
	}
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public String getqAnswer() {
		return qAnswer;
	}
	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}
	public String getqKategorie() {
		return qKategorie;
	}
	public void setqKategorie(String qKategorie) {
		this.qKategorie = qKategorie;
	}
	
	

}
