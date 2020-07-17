package reservationVO;

import java.util.Date;

public class ReservationVO {
	private int rPId;
	private String rId;
	private String rDTime;
	private String rDeparture;
	private String rATime;
	private String rArrive;
	private String rSeat;
	
	public ReservationVO() {}
	
	
	
	public ReservationVO(int rPId, String rId, String rDTime, String rDeparture, String rATime, String rArrive,
			String rSeat) {
		super();
		this.rPId = rPId;
		this.rId = rId;
		this.rDTime = rDTime;
		this.rDeparture = rDeparture;
		this.rATime = rATime;
		this.rArrive = rArrive;
		this.rSeat = rSeat;
	}



	public int getrPId() {
		return rPId;
	}

	public void setrPId(int rPId) {
		this.rPId = rPId;
	}

	public String getrId() {
		return rId;
	}

	public void setrId(String rId) {
		this.rId = rId;
	}

	public String getrDTime() {
		return rDTime;
	}

	public void setrDTime(String rDTime) {
		this.rDTime = rDTime;
	}

	public String getrDeparture() {
		return rDeparture;
	}

	public void setrDeparture(String rDeparture) {
		this.rDeparture = rDeparture;
	}

	public String getrATime() {
		return rATime;
	}

	public void setrATime(String rATime) {
		this.rATime = rATime;
	}

	public String getrArrive() {
		return rArrive;
	}

	public void setrArrive(String rArrive) {
		this.rArrive = rArrive;
	}

	public String getrSeat() {
		return rSeat;
	}

	public void setrSeat(String rSeat) {
		this.rSeat = rSeat;
	}

	

}
