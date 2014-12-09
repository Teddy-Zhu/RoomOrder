package Datebase;

import java.sql.*;

public class DataBase {

	Connection con;
	Statement stmt;
	ResultSet rs;

	public Statement connect_database() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/roomorder?useUnicode=true&characterEncoding=UTF-8";
			con = DriverManager.getConnection(url, "root", "zt123456");
			stmt = con.createStatement();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return stmt;
	}

	public void disconnect_database() {
		try {
			stmt.close();
			con.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public ResultSet executeQuerydate(String sql) throws SQLException {
		if (stmt == null)
			connect_database();
		rs = stmt.executeQuery(sql); // 返回查询结果
		return rs;
	}

	public int executeUpdatedate(String sql) throws SQLException {
		int n = 0;
		if (stmt == null)
			connect_database();
		n = stmt.executeUpdate(sql); // 返回查询结果
		return n;
	}

	public int authenticationlogin(String user, String cookies)
			throws SQLException {
		String sql = "select * from userbasic WHERE username='" + user
				+ "' and cookies='" + cookies + "'";
		rs = executeQuerydate(sql); // 返回查询结果
		if (rs.next())
			return 1;
		else
			return 0;
	}

	public int authenticationadmin(String user, String cookies)
			throws SQLException {
		String sql = "select * from userbasic WHERE username='" + user
				+ "' and cookies='" + cookies + "' and usertype=1";
		rs = executeQuerydate(sql); // 返回查询结果
		if (rs.next())
			return 1;
		else
			return 0;
	}

	public boolean isNullOrEmpty(String param) {
		  return param == null || param.trim().length() == 0;
		}
}