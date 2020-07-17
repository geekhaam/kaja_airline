package com.kaja_air.admin.DAO;

import java.sql.Connection;
import java.sql.Date;///////////////////
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.kaja_air.admin.VO.AdmimVO;

import kajaDBConn.KajaDBConn;


public class AdminDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	Statement stmt = null;
	ResultSet rs = null;

	public AdminDAO()  //시작하자마자 생성자에서 접속객체 get
			throws ClassNotFoundException, SQLException{
		con= new KajaDBConn().getConnection();
	}
	public void pstmtClose() throws SQLException{
		if(pstmt != null){ pstmt.close(); }
	}

	public void getAllInfoClose() throws SQLException{
		if(rs != null){ rs.close(); }
		if(pstmt != null){ pstmt.close(); }
		if(con != null){ con.close(); }
	}

	
	

	//공지사항 목록 가져오는 메소드 
	public ArrayList<AdmimVO> getNoticeList() throws SQLException {

		ArrayList<AdmimVO> tiarray = new ArrayList<>();

		String sql = "select * from notice order by nNo desc";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()) {
			int No= rs.getInt("nNo");
			String Title = rs.getString("nTitle");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String Date = sd.format(rs.getTimestamp(("nDate")));
			String Content = rs.getString("nContent");
			String File = rs.getString("nFile");
			String Fname = rs.getString("nFname");

			AdmimVO vo = new AdmimVO(No, Title, Date, Content, File, Fname);
			tiarray.add(vo); //리스트에 추가

		}
		return tiarray;
	}
	
	//게시글 하나의 내용을 가져오는 메소드
	public AdmimVO getOneNotice(String nNo) throws SQLException {
		
		AdmimVO tv = null;
		String sql = "select * from notice where nNo =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(nNo));
		rs = pstmt.executeQuery();

		if(rs.next()) {
			int no = rs.getInt("nNo");
			String title = rs.getString("nTitle");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String date =sd.format(rs.getTimestamp("nDate"));
			String content = rs.getString("nContent");
			String file = rs.getString("nFile");
			String fname = rs.getString("nFname");
			tv = new AdmimVO(no,title,date, content,file, fname);

		}  else {
			tv = null;
		}
		return tv;
	}
	
		//글쓸때 게시물 삽입 메소드
	public boolean insertNoticeList(String title, String date, String content, String file, String filename) throws SQLException {
		
		String sql = "insert into notice (nNo, nTitle, nDate, nContent, nFile, nFname)  values(notice_se.nextval, ? ,to_date(?,'YYYYMMDDHH24MISS'),?,?,?)";
		
		try {
		pstmt=con.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, date);
		pstmt.setString(3, content);
		pstmt.setString(4, file);
		pstmt.setString(5, filename);
		pstmt.executeUpdate();
		} catch(SQLException e){ 
		 	System.out.println("Insert Exception:"+e);
			 return false;
		 } 	
		return true;
	}
	
	// 게시글 업데이트 메소드
	public boolean updateNotice(String num, String title,String content) throws SQLException {
		
		String sql = "update notice set nTitle=?, nContent=? where nNo=?";

		try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, Integer.parseInt(num));
		pstmt.executeUpdate();
		
		}catch (SQLException e) {
		System.out.println("Update Exception:"+e);
		return false;
		}
		return true;
	}
	
	//게시글 삭제 메소드
	public boolean deleteNotice(String nNo) {
		
		String sql = "Delete from notice where nNo =?";
		
		try {	
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(nNo));	
			pstmt.executeUpdate();
		
		}catch (SQLException e) {
			System.out.println("DeleteNotice Exception:"+e);
			return false;
		}
		return true;
	}

		



	//항공편 전제 스케줄을 불러오는 메소드
	public ArrayList<AdmimVO> getSchedule() throws SQLException{

		ArrayList<AdmimVO> tiarray = new ArrayList<>();

		String sql = "select * from schedule order by pDTime";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()) {
			int pid = rs.getInt("pId");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String d = sd.format(rs.getTimestamp("pDtime"));
			String d2 = sd.format(rs.getTimestamp("pATime"));
			String pdeparture = rs.getString("pDeparture");
			String parrive = rs.getString("pArrive");
			int adultprice = rs.getInt("pAdultPrice");
			int childprice = rs.getInt("pChildPrice");
			int babyprice = rs.getInt("pBabyPrice");

			AdmimVO vo = new AdmimVO(pid, d, d2, pdeparture, parrive, adultprice, childprice, babyprice);
			tiarray.add(vo);

		}
		return tiarray;
		}
	
	//하나의 스케줄만 가져오는 메소드
	public AdmimVO getOneSchedule(String pid) throws SQLException{
	
		AdmimVO tv = null;
		String sql = "select * from schedule where pId =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(pid));
		rs = pstmt.executeQuery();

		if(rs.next()) {
			int id = rs.getInt("pId");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
			String d = sd.format(rs.getTimestamp("pDTime"));
			String d1 = sd.format(rs.getTimestamp("pATime"));			
			String departure = rs.getString("pDeparture");			
			String arrive = rs.getString("pArrive");			
			int aprice = rs.getInt("pAdultPrice");
			int cprice = rs.getInt("pChildPrice");
			int bprice = rs.getInt("pBabyPrice");
			tv = new AdmimVO(id,d,d1,departure,arrive,aprice,cprice,bprice);
		} else {
			tv = null;
		}
		return tv;
	}

	//스케줄 삽입 메소드
	public boolean InsertSchedule(ArrayList<String[]> bae) throws SQLException, ParseException{
		
	
		String sql = "insert into schedule values(?,to_date(?,'YYYYMMDDHH24MISS'),to_date(?,'YYYYMMDDHH24MISS'),?,?,?,?,?)";
	
		
			//i는 스케쥴이 저장된 2차원 배열 행 번호 = 스케줄 하나를 뜻함.
		try {
			
			for(int i=0;i<bae.size();i++) {
				
			
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(bae.get(i)[0]));
				pstmt.setString(2, bae.get(i)[1]); //메모장에서 날짜는 yyyyMMddkkmmss db에 넣을 때는 to_date(String, format)
				pstmt.setString(3, bae.get(i)[2]);
				pstmt.setString(4, bae.get(i)[3]);
				pstmt.setString(5, bae.get(i)[4]);
				pstmt.setInt(6, Integer.parseInt(bae.get(i)[5]));
				pstmt.setInt(7, Integer.parseInt(bae.get(i)[6]));
				pstmt.setInt(8, Integer.parseInt(bae.get(i)[7]));				
				pstmt.executeUpdate();
				
				/*//테이블을 새로 만듬
				  stmt = con.createStatement(); // Statement stmt // pstmt가 아님
				  String sql2 =
				  "create table "+bae.get(i)[3]+bae.get(i)[4]+bae.get(i)[0] +" (" +
				  "A1 number(1) default 0," + "B1 number(1) default 0," +
				  "C1 number(1) default 0," + "D1 number(1) default 0," +
				  "A2 number(1) default 0," + "B2 number(1) default 0," +
				  "C2 number(1) default 0," + "D2 number(1) default 0," +
				  "A3 number(1) default 0," + "B3 number(1) default 0," +
				  "C3 number(1) default 0," + "D3 number(1) default 0," +
				  "A4 number(1) default 0," + "B4 number(1) default 0," +
				  "C4 number(1) default 0," + "D4 number(1) default 0," +
				  "A5 number(1) default 0," + "B5 number(1) default 0," +
				  "C5 number(1) default 0," + "D5 number(1) default 0," +
				  "remainSeat number(3))" ;
				
				  stmt.executeUpdate(sql2);
				  
				  //새로만든 테이블에 값 넣어줌 
				  String sql3 = "insert into "+bae.get(i)[3]+bae.get(i)[4]+bae.get(i)[0]+"(remainSeat) values(20)";
				  
				  pstmt1=con.prepareStatement(sql3);
				  pstmt1.executeUpdate();*/
				  
				 
				}	
		
		 	}catch(SQLException e){ 
		 	System.out.println("Insert Exception:"+e);
			 return false;
		 } 	
		return true;

	}
	
	
	public boolean UpdateSchedule (int pid, String Dtime, String Atime, String Departure, String Arrive, int Aprice, int Cprice, int Bprice, String Departure1, String Arrive1) {
		
		String sql = "update schedule set pDtime=TO_DATE(?,'YYYYMMDD HHMI'),"
				+ " pAtime=TO_DATE(?,'YYYYMMDD HHMI'),"
				+ " pDeparture=?,"
				+ " pArrive=? ,"
				+ " pAdultPrice=?,"
				+ " pChildPrice=?,"
				+ " pBabyPrice=? "
				+ " where pId=?";
		try {	
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(8, pid);
		pstmt.setString(1, Dtime);
		pstmt.setString(2, Atime);
		pstmt.setString(3, Departure);
		pstmt.setString(4, Arrive);
		pstmt.setInt(5, Aprice);
		pstmt.setInt(6, Cprice);
		pstmt.setInt(7, Bprice);
		pstmt.executeUpdate();
		
		//수정하면  이전에 만들어진 pdeparture+parrive+pid 테이블 삭제
		String  sql1 = "drop table "+ Departure1 + Arrive1 + pid +"";
		pstmt=con.prepareStatement(sql1);
		pstmt.executeUpdate(sql1);
		
		//그리고 수정한 테이블 만들기
		  stmt = con.createStatement(); // Statement stmt // pstmt가 아님 
		  String sql2 =
		  "create table "+Departure+Arrive+pid+" (" +
		  "A1 number(1) default 0," + "B1 number(1) default 0," +
		  "C1 number(1) default 0," + "D1 number(1) default 0," +
		  "A2 number(1) default 0," + "B2 number(1) default 0," +
		  "C2 number(1) default 0," + "D2 number(1) default 0," +
		  "A3 number(1) default 0," + "B3 number(1) default 0," +
		  "C3 number(1) default 0," + "D3 number(1) default 0," +
		  "A4 number(1) default 0," + "B4 number(1) default 0," +
		  "C4 number(1) default 0," + "D4 number(1) default 0," +
		  "A5 number(1) default 0," + "B5 number(1) default 0," +
		  "C5 number(1) default 0," + "D5 number(1) default 0," +
		  "remainSeat number(3))" ;
		  stmt.executeUpdate(sql2);
		
		}catch (SQLException e) {
			System.out.println("Update Exception:"+e);
			return false;
		}
		return true;
	}

	//스케줄을 삭제하는 메소드
	public boolean DeleteSchedule (int pId, String pDeparture, String pArrive) throws SQLException{
		
		String sql = "Delete  from schedule where pId = ?";
		
		try {	
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pId);	
			pstmt.executeUpdate();
			
			String sql1 = "drop table "+ pDeparture + pArrive + pId +"";
			pstmt=con.prepareStatement(sql1);

			pstmt.executeUpdate(sql1);

		}catch (SQLException e) {
			System.out.println("DeleteSchedule Exception:"+e);
			return false;
		}
		return true;
	}


		
	

}






