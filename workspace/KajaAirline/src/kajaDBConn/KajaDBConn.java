package kajaDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KajaDBConn {
private Connection con;
	
	public Connection getConnection() {//���� ��ü.�޼ҵ�()
		return con;
	}
	//���� ��ü�� �ʿ��ϴٸ� �� �޼ҵ带 ȣ���ϸ� �ȴ�.
	public KajaDBConn() 
			throws ClassNotFoundException, SQLException {
		//������....
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:"
				+ "1521:xe","hr","hr");
	} // ������ ��ü�� ����� ���� ���� �����Ǵ� ���� �������̴�. �� �� class�� ��ü�� �����ϸ�
	//�� �����ڿ� ���� ����̹��ε�� ������ ��Ʈ��ȣ�� �Է��� ���Ӱ�ü�� �����.
}
