package mypageDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clientsVO.ClientsVO;
import reservationVO.ReservationVO;
import kajaDBConn.KajaDBConn;

public class MypageDAO {
	   
	   Connection con;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   public MypageDAO() throws ClassNotFoundException, SQLException {
	      con = new KajaDBConn().getConnection();
	   }

	   
	   
	   public void clientsUpdate(String cPw, String cName, String cTel, String cEmail, String cNation, String cResiAddr, String cId) {
	      String sql = "update clients set cPw=?, cName=?, cTel=?, cEmail=?, cNation=?, cResiAddr=? where cId=?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, cPw);
	         pstmt.setString(2, cName);
	         pstmt.setString(3, cTel);       //회원 정보 변경
	         pstmt.setString(4, cEmail);
	         pstmt.setString(5, cNation);
	         pstmt.setString(6, cResiAddr);
	         pstmt.setString(7, cId);
	         
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   
	   public void clientsDelete(String cId) throws SQLException { //회원 삭제
	      String sql = "delete from clients where cId=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, cId);
	      pstmt.executeUpdate();
	   }
	   
	   public ArrayList<ReservationVO> selectReservation(int startRow, int endRow, String rId1) throws SQLException { //취소되지 않은 예매내역 가져옴
	      String sql = "select * from "
	            + "(select rownum rn,rPId,rId,to_char(rDTime,'yyyy-MM-dd hh24:mi'),rDeparture,to_char(rATime,'yyyy-MM-dd hh24:mi'),rArrive,rSeat from "
	            + "(select * from reservation where rId=? order by rno desc)) where rn between ? and ?";

	      ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, rId1);
	      pstmt.setInt(2, startRow);
	      pstmt.setInt(3, endRow);
	      rs = pstmt.executeQuery();

	      while (rs.next()) {
	         int rPId = rs.getInt(2);
	         String rId = rs.getString(3);
	         String rDTime = rs.getString(4);
	         String rDeparture = rs.getString(5);
	         String rATime = rs.getString(6);
	         String rArrive = rs.getString(7);
	         String rSeat = rs.getString(8);

	         ReservationVO vo = new ReservationVO(rPId, rId, rDTime, rDeparture, rATime, rArrive, rSeat);

	         list.add(vo);
	      }
	      return list;
	   }
	   
	   public ArrayList<ReservationVO> selectCancelReservation(int startRow, int endRow, String rId1) throws SQLException {
	      String sql = "select * from "
	            + "(select rownum rn,nPId,nId,to_char(nDTime,'yyyy-MM-dd hh24:mi'),nDeparture,to_char(nATime,'yyyy-MM-dd hh24:mi'),nArrive,nSeat from "
	            + "(select * from noReservation where nId=? order by nNo desc)) where rn between ? and ?";
	      ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();  //취소된 내역들만 가져옴
	      pstmt = con.prepareStatement(sql); 
	      pstmt.setString(1, rId1);
	      pstmt.setInt(2, startRow);
	      pstmt.setInt(3, endRow);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	         int nPId = rs.getInt(2);
	         String nId = rs.getString(3);
	         String nDTime = rs.getString(4);
	         String nDeparture = rs.getString(5);
	         String nATime = rs.getString(6);
	         String nArrive = rs.getString(7);
	         String nSeat = rs.getString(8);

	         ReservationVO vo = new ReservationVO(nPId, nId, nDTime, nDeparture, nATime, nArrive, nSeat);

	         list.add(vo);
	      }
	      return list;
	   }

	   public ClientsVO selectClients(String cId1) throws SQLException { //회원 정보 가져옴
	      String sql = "select * from clients where cId=?";
	      ClientsVO vo = null;
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, cId1);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         String cId = rs.getString("cId");
	         String cPw = rs.getString("cPw");
	         String cName = rs.getString("cName");
	         String cTel = rs.getString("cTel");
	         String cEmail = rs.getString("cEmail");
	         String cNation = rs.getString("cNation");
	         String cResiAddr = rs.getString("cResiAddr");
	         
	         vo = new ClientsVO(cId, cPw, cName, cTel, cEmail, cNation, cResiAddr);
	      }
	      return vo;
	   }
	   
	   public void deleteReservation(String rId, String rDTime, String rDeparture, String rATime, String rArrive, String rSeat) throws SQLException { //선택한 취소내역 삭제
	      String sql = "delete from noReservation where nId=? and nDTime=to_date(?,'RR/MM/DD HH24:MI') and nDeparture=? and nATime=to_date(?,'RR/MM/DD HH24:MI') and nArrive=? and nSeat=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, rId); pstmt.setString(2, rDTime);
	      pstmt.setString(3, rDeparture); pstmt.setString(4, rATime);
	      pstmt.setString(5, rArrive); pstmt.setString(6, rSeat);
	      pstmt.executeUpdate();
	      
	   }
	   
	   public void cancelReservation(int rPId, String rId, String rDTime, String rDeparture, String rATime, String rArrive, String rSeat) throws SQLException { //선택한 예매내역 취소
	      String sql = "delete from reservation where rId=? and rDTime=to_date(?,'RR/MM/DD HH24:MI') and rDeparture=? and rATime=to_date(?,'RR/MM/DD HH24:MI') and rArrive=? and rSeat=?";
	      String sql2 = "insert into noReservation values (noReservation_nNo.nextval,?,?,to_date(?,'RR/MM/DD HH24:MI'),?,to_date(?,'RR/MM/DD HH24:MI'),?,?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, rId); pstmt.setString(2, rDTime);
	      pstmt.setString(3, rDeparture); pstmt.setString(4, rATime);
	      pstmt.setString(5, rArrive); pstmt.setString(6, rSeat);
	      pstmt.executeUpdate();
	      pstmt = con.prepareStatement(sql2);
	      pstmt.setInt(1, rPId); pstmt.setString(2, rId);
	      pstmt.setString(3, rDTime); pstmt.setString(4, rDeparture);
	      pstmt.setString(5, rATime); pstmt.setString(6, rArrive); pstmt.setString(7, rSeat);
	      pstmt.executeUpdate();
	   }
	   
	   public int getCount(String rId) throws SQLException{
	      int count = 0;
	      String sql = "select count(*) from reservation where rId=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, rId);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         count = rs.getInt(1);
	      }
	      return count; // 예매내역 총 레코드 수 리턴
	   }
	   public int getCount2(String rId) throws SQLException{
	      int count = 0;
	      String sql = "select count(*) from noReservation where nId=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, rId);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         count = rs.getInt(1);
	      }
	      return count; // 취소내역 총 레코드 수 리턴
	   }
	   
	   public String selectId(String cId) throws SQLException {
	      String sql = "select cId from clients where cId=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, cId);
	      rs = pstmt.executeQuery();
	      String cId1 = null;
	      if(rs.next()) {
	         cId1 = rs.getString("cId");
	      }
	      return cId1;
	   }
	   
	   public void insertClients(String cId, String cPw, String cName, String cTel, String cEmail, String cNation, String cResiAddr) throws SQLException {
	      String sql = "insert into clients values (?,?,?,?,?,?,?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, cId);
	      pstmt.setString(2, cPw);
	      pstmt.setString(3, cName);
	      pstmt.setString(4, cTel);
	      pstmt.setString(5, cEmail);
	      pstmt.setString(6, cNation);
	      pstmt.setString(7, cResiAddr);
	      pstmt.executeUpdate();
	   }
	   
	   public void cancelSeat(String rDeparture, String rArrive, int rPId, String rSeat) throws SQLException {
	      String Bae[] = rSeat.split("_");
	      String sql = null;
	      for (int i = 0; i < Bae.length; i++) {
	         sql = "update " + rDeparture + rArrive + rPId + " set " + Bae[i] + "=0";
	         pstmt = con.prepareStatement(sql);
	         pstmt.executeUpdate();
	      }
	      sql="update "+rDeparture+rArrive+rPId+" set remainSeat=remainSeat+"+Bae.length;
	      pstmt=con.prepareStatement(sql);
	      pstmt.executeUpdate();
	   }
	   


	}
