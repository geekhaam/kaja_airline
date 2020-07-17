package com.kaja_air.reserve.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kaja_air.reserve.model.Schedule;


import kajaDBConn.KajaDBConn;

public class ReserveDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static ReserveDAO instance;
	private ReserveDAO() throws ClassNotFoundException, SQLException {
		conn= new KajaDBConn().getConnection();
	}
	public static ReserveDAO getInstance() throws ClassNotFoundException, SQLException {
		if(instance == null) {
			instance = new ReserveDAO();
		}
		return instance;
	}
	
	/*
	 * ���� �ð��� �� ������ �ٲ��ִ� �޼ҵ�
	 */
	public int getFlightMin(String depTime, String arrTime) {
		String[] depSplit = depTime.split(":");
		String[] arrSplit = arrTime.split(":");
		
		int depHour = Integer.parseInt(depSplit[0]);
		int arrHour = Integer.parseInt(arrSplit[0]);
		
		int depMin = Integer.parseInt(depSplit[1]);
		int arrMin = Integer.parseInt(arrSplit[1]);
		
		int hour = arrHour-depHour;
		int min = arrMin-depMin;
		if(depMin > arrMin) {
			hour -= 1;
			min += 60;
		}
		int flightMin = hour*60 + min;
		return flightMin;
	}
	
	/*
	 * ���� �̸� ����Ʈ�� �޾� jsonArray Ÿ������ �����ϴ� �޼ҵ�
	 */
	@SuppressWarnings("unchecked")
	public JSONArray getAirportJson() {
		JSONArray airJsonArr = new JSONArray();
		String sql = "SELECT * FROM airport ORDER BY code";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("code", rs.getString("code"));
				obj.put("location", rs.getString("location"));
				
				airJsonArr.add(obj);
			}
			return airJsonArr;
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("JSON SELECTION ERROR");
			return null;
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}				
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("DB CONN CLOSING ERROR");
			}
		}
	}
	
	/*
	 * Ư�� ���ǿ� �´� ������ ����Ʈ�� �޾� jsonMap Ÿ������ �����ϴ� �޼ҵ�
	 */
	@SuppressWarnings("unchecked")
	public JSONArray getScheduleJson(String departure, String arrive, String depTime) {
		
		String sql = "SELECT * FROM schedule WHERE pDeparture = ? AND "
				+ "pArrive = ? AND "
				+ "pDTime BETWEEN to_date(?, 'YYYYMMDDHH24MISS') AND to_date(?, 'YYYYMMDDHH24MISS') "
				+ "ORDER BY pDTime";
		
		//������� ������ ��쿣 ���� �ð��� �������� 24�ñ��� �˻�
			Date today = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
			String strToday = sf.format(today);
			if(depTime.equals(strToday)) {
				System.out.println("���� ��¥�� �˻� ��¥ ����");
				sql = "SELECT * FROM schedule WHERE pDeparture = ? AND "
						+ "pArrive = ? AND "
						+ "pDTime BETWEEN sysdate AND to_date(?, 'YYYYMMDDHH24MISS') "
						+ "ORDER BY pDTime";
			}
			
			JSONArray scheduelJsonArr = new JSONArray();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, departure);
				pstmt.setString(2, arrive);
				if(depTime.equals(strToday)) {
					pstmt.setString(3, depTime+"235959");
				} else {
					pstmt.setString(3, depTime+"000000");
					pstmt.setString(4, depTime+"235959"); 				
				}
				rs = pstmt.executeQuery();
				if(rs != null) {
					while(rs.next()) {
						JSONObject scheduleJson = new JSONObject();
						int pId = rs.getInt("pId");
						SimpleDateFormat df = new SimpleDateFormat("kk:mm");
						String strDepTime = df.format(rs.getTimestamp("pDTime"));
						String strArrTime = df.format(rs.getTimestamp("pATime"));
						int flightMin = getFlightMin(strDepTime, strArrTime);
						
						String pDeparture = rs.getString("pDeparture");
						String pArrive = rs.getString("pArrive");
						int pAdultPrice = rs.getInt("pAdultPrice");
						int pChildPrice = rs.getInt("pChildPrice");
						int pBabyPrice = rs.getInt("pBabyPrice");
						
						String depSub = departure.substring(departure.length()-3, departure.length());
						String arrSub = arrive.substring(arrive.length()-3, arrive.length());
						String pName = depSub + arrSub + pId;
						int remainSeat = getRemainSeat(depSub, arrSub, pId);
						
						scheduleJson.put("pId", pId);
						scheduleJson.put("pName", pName);
						scheduleJson.put("pDTime", strDepTime);
						scheduleJson.put("pATime", strArrTime);
						scheduleJson.put("pFTime", flightMin);
						scheduleJson.put("pDeparture", pDeparture);
						scheduleJson.put("pArrive", pArrive);
						scheduleJson.put("pAdultPrice", pAdultPrice);
						scheduleJson.put("pChildPrice", pChildPrice);
						scheduleJson.put("pBabyPrice", pBabyPrice);
						scheduleJson.put("remainSeat", remainSeat);
						
						scheduelJsonArr.add(scheduleJson);
					}
				}
				return scheduelJsonArr;
			} catch(SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
					if(pstmt != null) {
						pstmt.close();
					}				
				} catch(SQLException se) {
					se.printStackTrace();
					System.out.println("DB CONN CLOSING ERROR");
				}
			}
		
	}
	
	/*
	 * �¼� ���̺��� ����Ʈ �˻��Ͽ� �¼��� ���¸� JSONObject�� ��ȯ
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getSeatJson(String pName) {
		JSONObject seatJsonObj = new JSONObject();
		String sql = "SELECT * FROM "+pName;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs != null) {
				if(rs.next()) {
					seatJsonObj.put("A1", rs.getInt("A1"));
					seatJsonObj.put("A2", rs.getInt("A2"));
					seatJsonObj.put("A3", rs.getInt("A3"));
					seatJsonObj.put("A4", rs.getInt("A4"));
					seatJsonObj.put("B1", rs.getInt("B1"));
					seatJsonObj.put("B2", rs.getInt("B2"));
					seatJsonObj.put("B3", rs.getInt("B3"));
					seatJsonObj.put("B4", rs.getInt("B4"));
					seatJsonObj.put("C1", rs.getInt("C1"));
					seatJsonObj.put("C2", rs.getInt("C2"));
					seatJsonObj.put("C3", rs.getInt("C3"));
					seatJsonObj.put("C4", rs.getInt("C4"));
					seatJsonObj.put("D1", rs.getInt("D1"));
					seatJsonObj.put("D2", rs.getInt("D2"));
					seatJsonObj.put("D3", rs.getInt("D3"));
					seatJsonObj.put("D4", rs.getInt("D4"));
					seatJsonObj.put("E1", rs.getInt("E1"));
					seatJsonObj.put("E2", rs.getInt("E2"));
					seatJsonObj.put("E3", rs.getInt("E3"));
					seatJsonObj.put("E4", rs.getInt("E4"));
					seatJsonObj.put("remainSeat", rs.getInt("remainSeat"));
					
				}				
			}
			return seatJsonObj;
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("JSON SELECTION ERROR");
			return null;
		}  finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}				
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("DB CONN CLOSING ERROR");
			}
		}
	}
	
	/*
	 * ������� �˻��� ������ ����Ʈ �������� �޼ҵ�
	 */
	public ArrayList<Schedule> getScheduleList(String departure, String arrive, String depTime) {
		ArrayList<Schedule> scheduleList = new ArrayList<Schedule>();
		
		String sql = "SELECT * FROM schedule WHERE pDeparture = ? AND "
				+ "pArrive = ? AND "
				+ "pDTime BETWEEN to_date(?, 'YYYYMMDDHH24MISS') AND to_date(?, 'YYYYMMDDHH24MISS') "
				+ "ORDER BY pDTime";
		
		//������� ������ ��쿣 ���� �ð��� �������� 24�ñ��� �˻�
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String strToday = sf.format(today);
		if(depTime.equals(strToday)) {
			System.out.println("���� ��¥�� �˻� ��¥ ����");
			sql = "SELECT * FROM schedule WHERE pDeparture = ? AND "
					+ "pArrive = ? AND "
					+ "pDTime BETWEEN sysdate AND to_date(?, 'YYYYMMDDHH24MISS') "
					+ "ORDER BY pDTime";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			if(depTime.equals(strToday)) {
				pstmt.setString(3, depTime+"235959");
			} else {
				pstmt.setString(3, depTime+"000000");
				pstmt.setString(4, depTime+"235959"); 				
			}
			rs = pstmt.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					int pId = rs.getInt("pId");
					SimpleDateFormat df = new SimpleDateFormat("kk:mm");
					String strDepTime = df.format(rs.getTimestamp("pDTime"));
					String strArrTime = df.format(rs.getTimestamp("pATime"));
					int flightMin = getFlightMin(strDepTime, strArrTime);
					
					String depSub = departure.substring(departure.length()-3, departure.length());
					String arrSub = arrive.substring(arrive.length()-3, arrive.length());
					String pName = depSub + arrSub + pId;
					Schedule schedule = new Schedule(pId, pName, strDepTime, strArrTime, flightMin, rs.getString("pDeparture"), rs.getString("pArrive"),
							rs.getInt("pAdultPrice"), rs.getInt("pChildPrice"), rs.getInt("pBabyPrice"), getRemainSeat(depSub, arrSub, pId));
					scheduleList.add(schedule);
				}				
			}
			return scheduleList;
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}				
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("DB CONN CLOSING ERROR");
			}
		}

	}
	
	/*
	 * �¼� ���̺��� �ܿ� �¼��� ������ ������ ���� �޼ҵ� 
	 */
	public int getRemainSeat(String depSub, String arrSub, int pId) {
		
		String sql = "SELECT remainSeat from " + depSub + arrSub + pId;
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		int remainSeat = -1;
		try {
			pstmt2 = conn.prepareStatement(sql);
			rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				remainSeat = rs2.getInt("remainSeat");
			}
			return remainSeat;
		} catch(SQLException e) {
			e.printStackTrace();
			return remainSeat;
		} finally {
			try {
				if(rs2 != null) {
					rs2.close();
				}
				if(pstmt2 != null) {
					pstmt2.close();
				}				
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("DB CONN CLOSING ERROR");
			}
		}
	}
	
	@SuppressWarnings("finally")
	public boolean insertReservation(int rPId, String rId, String rDTime, String rDeparture, String rATime, String rArrive, String rSeat) {
		
	      String sql = "insert into reservation values (reservation_rNo.nextval,?,?,to_date(?,'RR/MM/DD HH24:MI'),?,to_date(?,'RR/MM/DD HH24:MI'),?,?)";
	      
	      try {
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setInt(1, rPId);
	    	  pstmt.setString(2, rId);
	    	  pstmt.setString(3, rDTime);
	    	  pstmt.setString(4, rDeparture);
	    	  pstmt.setString(5, rATime);
	    	  pstmt.setString(6, rArrive);
	    	  pstmt.setString(7, rSeat);
	    	  int result = pstmt.executeUpdate();
	    	  if(result != 0) {
	    		  return true;
	    	  } else {
	    		  System.out.println("�� ������Ʈ �� ��");
	    		  return false;
	    	  }
	      } catch(SQLException e) {
	    	  e.printStackTrace();
	    	  System.out.println("INSERT RESERVATION ERROR");
	    	  return false;
	      } finally {
				try {
					if(rs != null) {
						rs.close();
					}
					if(pstmt != null) {
						pstmt.close();
					}
				} catch(SQLException se) {
					se.printStackTrace();
					System.out.println("DB CONN CLOSING ERROR");
				}
			}
	      
	   }
	   
	@SuppressWarnings("finally")
	public boolean updateSeat(String rPIdStr, String rSeat) {
		String Bae[] = rSeat.split("_");
		String sql = null;
		StringBuffer sb = new StringBuffer();
		if (Bae.length == 1) {
			sb.append(Bae[0] + "=1, ");
		}
		if (Bae.length > 1) {
			for (int i = 0; i < Bae.length; i++) {
				sb.append(Bae[i] + "=1, ");
			}
		}
		String updateSeat = new String(sb);
		System.out.println(updateSeat);
		sql = "update " + rPIdStr + " set " + updateSeat + "remainSeat=remainSeat-" + Bae.length;
		try {
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			if(result != 0) {
				System.out.println(rPIdStr+" ����� �� "+updateSeat+" �¼� ������Ʈ");
				return true;
			} else {
				System.out.println("�� ������Ʈ �� ��");
				return false;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("UPDATE SEAT ERROR");
			return false;
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch(SQLException se) {
				se.printStackTrace();
				System.out.println("DB CONN CLOSING ERROR");
			}
		}

	}
}
