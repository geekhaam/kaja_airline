package airfaqDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import airfaqVO.AirFAQVO;
import kajaDBConn.KajaDBConn;

public class AirFAQDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public AirFAQDAO() throws ClassNotFoundException, SQLException {
		con=new KajaDBConn().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null)
			pstmt.close();
	}

	public void getAllInfoClass() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public ArrayList<AirFAQVO> getAllFAQ(int startRow, int endRow) throws SQLException {
		ArrayList<AirFAQVO> aFAQVO = new ArrayList<AirFAQVO>();
		String sql = "select * from(select rownum rn,qId,qQuestion,qAnswer,qKategorie from\r\n" + 
				"(select * from FAQ order by qId desc)) where rn between ? and ?";
		

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String qId = rs.getString("qId");
			String qQuestion = rs.getString("qQuestion");
			String qAnswer = rs.getString("qAnswer");
			String qKategorie = rs.getString("qKategorie");
			AirFAQVO ai = new AirFAQVO(qId, qQuestion, qAnswer, qKategorie);

			aFAQVO.add(ai);
		}
		pstmt.close();
		return aFAQVO;
	}

	public ArrayList<AirFAQVO> SearchQ(String Kategorie1) throws SQLException {
		ArrayList<AirFAQVO> aFV = new ArrayList<AirFAQVO>();
		String sql = "SELECT * FROM FAQ where qKategorie=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Kategorie1);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String qId = rs.getString("qId");
			String qQuestion = rs.getString("qQuestion");
			String qAnswer = rs.getString("qAnswer");
			String qKategorie = rs.getString("qKategorie");
			AirFAQVO ai = new AirFAQVO(qId, qQuestion, qAnswer, qKategorie);
			aFV.add(ai);
		}
		pstmt.close();
		return aFV;
	}

	public int getCount() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select count(*) from faq";
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
