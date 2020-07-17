package airinquireDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




import airinquireVO.AirInquireVO;
import airnoticeVO.AirNoticeVO;
import kajaDBConn.KajaDBConn;

public class AirInquireDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public AirInquireDAO() throws ClassNotFoundException, SQLException {
		con=new KajaDBConn().getConnection();
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	
	public void getAllInfoClass() throws SQLException {
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}

	public ArrayList<AirInquireVO> getAllQuestion(int startRow, int endRow) throws SQLException {
		ArrayList<AirInquireVO> aiarray = new ArrayList<AirInquireVO>();
		String sql = "select * from(select rownum rn,iNO,iId,iName,iTitle,iDate,iContent,iFile,iFilePath from\r\n" + 
				"(select * from inquire order by iNo desc)) where rn between ? and ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int iNo = rs.getInt("iNo");
			String iId = rs.getString("iId");
			String iName = rs.getString("iName");
			String iTitle = rs.getString("iTitle");
			Date iDate = rs.getDate("iDate");
			String iContent = rs.getString("iContent");
			String iFile = rs.getString("iFile");
			String iFilePath = rs.getString("iFilePath");

			AirInquireVO ai = new AirInquireVO(iNo, iId, iName, iTitle, iDate, iContent, iFile, iFilePath);

			aiarray.add(ai);
		}
		pstmt.close();
		return aiarray;
	}
	
	// insert 삽입 메소드 정의문 =====================================
	public boolean insert_Inquire(String iId,String iName, String iTitle, String iContent, String iFile, String iFilePath) throws SQLException {
		String sql="insert into Inquire(iNo,iId,iName,iTitle,iContent,iFile,iFilePath) values(inquire_seq.NEXTVAL,?,?,?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, iId);
			pstmt.setString(2, iName);
			pstmt.setString(3, iTitle);
			pstmt.setString(4, iContent);
			pstmt.setString(5,iFile);
			pstmt.setString(6,iFilePath);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Insert Exception");
			
			return false;
		}
		pstmt.close();
		return true;
	}

	public AirInquireVO getInfo(String oriName) throws SQLException { //홍길동
		AirInquireVO ai =null;
		String sql = "select * from Inquire where iTitle=?";
		//? : 원하는 사람 이름
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, oriName);
		rs = pstmt.executeQuery();
		if(rs.next()) {//찾았으면 rs종이박스에 홍길동정보가 있다
			int iNo = rs.getInt("iNo");
			String iId = rs.getString("iId");
			String iName = rs.getString("iName");
			String iTitle = rs.getString("iTitle");
			Date iDate = rs.getDate("iDate");
			String iContent = rs.getString("iContent");
			String iFile = rs.getString("iFile");
			String iFilePath = rs.getString("iFilePath");
			ai = new AirInquireVO(iNo, iId, iName, iTitle, iDate, iContent, iFile, iFilePath);//생성자 사용하여 vo 그릇에 넣자
		}
		else {//그런 이름이 없으면
			ai=null;//tv객체참조변수에 null
		}
		pstmt.close();
		return ai;
	}
	public int getCount() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select count(*) from notice";
		int total=0;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			total=rs.getInt(1);
		}
		pstmt.close();
		return total;
	}
}
