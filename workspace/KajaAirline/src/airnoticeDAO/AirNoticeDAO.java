package airnoticeDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import airnoticeVO.AirNoticeVO;
import airuserVO.AirUserVO;
import kajaDBConn.KajaDBConn;

public class AirNoticeDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public AirNoticeDAO() throws ClassNotFoundException, SQLException {
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

	// 전체출력을 위해
	public ArrayList<AirNoticeVO> getAllNotice(int startRow,int endRow) throws SQLException {
		ArrayList<AirNoticeVO> anarray = new ArrayList<AirNoticeVO>();
		String sql = "select * from(select rownum rn,nNO,nTitle,nDate,nContent,nFile,nFName from\r\n" + 
				"(select * from notice order by nNo desc)) where rn between ? and ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int nNo = rs.getInt("nNo");
			String nTitle = rs.getString("nTitle");
			Date nDate = rs.getDate("nDate");
			String nContent = rs.getString("nContent");
			String nFile = rs.getString("nFile");
			String nFName = rs.getString("nFName");

			AirNoticeVO an = new AirNoticeVO(nNo, nTitle, nDate, nContent, nFile, nFName);

			anarray.add(an);
		}
		pstmt.close();
		return anarray;
	}
	//테이블 줄 누르면 검색
	public AirNoticeVO getInfo(String oriName) throws SQLException { //홍길동
		AirNoticeVO an =null;
		String sql = "select * from Notice where nTitle=?";
		//? : 원하는 사람 이름
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, oriName);
		rs = pstmt.executeQuery();
		if(rs.next()) {//찾았으면 rs종이박스에 홍길동정보가 있다
			int nNo = rs.getInt("nNo");
			String nTitle = rs.getString("nTitle");
			Date nDate = rs.getDate("nDate");
			String nContent = rs.getString("nContent");
			String nFile = rs.getString("nFile");
			String nFName = rs.getString("nFName");
			an = new AirNoticeVO(nNo, nTitle, nDate, nContent, nFile,nFName);//생성자 사용하여 vo 그릇에 넣자
		}
		else {//그런 이름이 없으면
			an=null;//tv객체참조변수에 null
		}
		pstmt.close();
		return an;
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
