package utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBUtils {
	public static void executeSQL(Connection conn, String sql) throws Exception {
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}

	public static ResultSet selectData(Connection conn,String sql) throws Exception {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}
}