package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnUtils_SQLJDBC {

	public static Connection getSQLServerConnection_SQLJDBC() throws ClassNotFoundException, SQLException {
		// Chú ý: Thay đổi các thông số kết nối cho phù hợp.
		String hostName = "localhost";
		String dbName = "online_bookstore";
		String userName = "sa";
		String password = "1234567890";
		return getMySQLConnection(hostName, dbName, userName, password);
	}

	public static Connection getMySQLConnection(String hostName, String dbName, String userName, String password)
			throws SQLException, ClassNotFoundException {

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		// Cấu trúc URL Connection đối với SQL Server:
		// Ví dụ:
//		String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
		String connectionURL = "jdbc:sqlserver://"+hostName+":1433;database="+dbName+";user="+userName+";password="+password+"";

		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
	}
}