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
		//������ : ���Ӱ�ü�������� con�� TelInfoDBConn�� ��ü�� �����ϸ鼭  
		//�����ڸ� ���Ͽ� ������ �ϰ� return�Ǵ� ��ücon�� �����ϵ��� �Ѵ�.
		con=new KajaDBConn().getConnection();
	}
	
	//method��
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
