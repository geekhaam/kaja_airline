package kajaDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KajaDBConn {
private Connection con;
	
	public Connection getConnection() {//사용시 객체.메소드()
		return con;
	}
	//접속 객체가 필요하다면 요 메소드를 호출하면 된다.
	public KajaDBConn() 
			throws ClassNotFoundException, SQLException {
		//생성자....
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:"
				+ "1521:xe","hr","hr");
	} // 누군가 객체를 만들면 제일 먼저 가동되는 것이 생성자이다. 즉 이 class의 객체를 생성하면
	//이 생성자에 적힌 드라이버로드와 아이피 포트번호를 입력해 접속객체를 만든다.
}
