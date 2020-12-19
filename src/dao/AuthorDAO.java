package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class AuthorDAO implements ObjectDAO {
	public static Map<String, Author> mapTacGia = layDuLieuTuDatabase();

	@Override
	public boolean add(Object obj) {
		Author author = (Author) obj;
		mapTacGia.put(author.getId(), author);
		try {
			String sql = "insert into Authors values (?,?,?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, author.getName());
			ppstm.setString(2, author.getInfo());
			ppstm.setString(3, author.getPicture());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn đb " + e.getMessage());
			return false;
		}
		return true;
	}

	public static Map<String, Author> layDuLieuTuDatabase() {
		Map<String, Author> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from  Authors");
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String info = rs.getString(3);
				String picture = rs.getString(4);
				Author author = new Author(id, name, info, picture);
				map.put(author.getId(), author);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id,Object obj) {
		Author author = (Author) obj;
		mapTacGia.replace(author.getId(), author);
		String sql = "update Authors set title=?,price=?,sale_price=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, author.getName());
			ppstm.setString(2, author.getInfo());
			ppstm.setString(3, author.getPicture());
			ppstm.setString(4, id);
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del (String id) {
		mapTacGia.remove(id);
		String sql = "delete from Authors where id='" + id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, sql);
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn db:" + e.getMessage());
			return false;
		}
		return true;
	}

	

}
