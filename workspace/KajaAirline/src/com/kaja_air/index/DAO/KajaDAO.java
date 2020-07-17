package com.kaja_air.index.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kajaDBConn.KajaDBConn;


public class KajaDAO {
	private Connection con;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public KajaDAO() 
			throws ClassNotFoundException, SQLException {
		//생성자 : 접속객체참조변수 con을 TelInfoDBConn의 객체를 생성하면서  
		//생성자를 콜하여 접속을 하고 return되는 객체con을 찹조하도록 한다.
		con=new KajaDBConn().getConnection();
	}
	
	//method들
	public String checkLogin(String id,String pw) throws SQLException {
		String result="";
		String sql="select cid,cpw from clients where cid=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("cpw").equals(pw)) {
				result="member";	
			}
			else 
				result="pw";
		}
		else
			result="id";
		return result;
	}//checkLogin-end
	public String[] getNoticeHeader() throws SQLException {
		String[] head=new String[3];
		String sql="select ntitle from notice order by ndate desc";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int count=0;
		while(rs.next()) {
			
			if(count>2)
				return head;
			head[count]=rs.getString("ntitle");
			count++;
		}
		return head;
	}
}
