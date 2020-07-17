package airUserDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import airuserVO.AirUserVO;
import kajaDBConn.KajaDBConn;



public class AirUserDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public AirUserDAO() throws ClassNotFoundException, SQLException {

		con=new KajaDBConn().getConnection();

	}

	// 전체출력을 위해
	public ArrayList<AirUserVO> getAllInfo() throws SQLException {
		ArrayList<AirUserVO> auarray = new ArrayList<AirUserVO>();
		String sql = "SELECT * FROM Clients ORDER BY id";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String cId = rs.getString("cid");
			String cPw = rs.getString("cPw");
			String cName = rs.getString("cName");
			String cTel = rs.getString("cTel");
			String cEmail = rs.getString("cEmail");
			String cNation = rs.getString("cNation");
			String cResiAddr = rs.getString("cResiAddr");

			AirUserVO au = new AirUserVO(cId, cPw, cName, cTel, cEmail, cNation, cResiAddr);

			auarray.add(au);
		}
		pstmt.close();
		return auarray;
	}
}
