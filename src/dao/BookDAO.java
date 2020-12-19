package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class BookDAO implements ObjectDAO {
	public static Map<String, Book> mapSanPham = layDuLieuTuDatabase();

	@Override
	public boolean add(Object obj) {
		Book sp = (Book) obj;
		mapSanPham.put(sp.getId(), sp);
		try {
			String sql = "insert into Books values (?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getTitle());
			ppstm.setString(2, sp.getPrice());
			ppstm.setString(3, sp.getSale_price());
			ppstm.setString(4, sp.getPublish_year());
			ppstm.setString(5, sp.getPicture());
			ppstm.setString(6, sp.getPage_number());
			ppstm.setString(7, sp.getQuantity());
			ppstm.setString(8, sp.getQuotes_about());
			ppstm.setString(9, sp.getAuthor_id());
			ppstm.setString(10, sp.getPublisher_id());
			ppstm.setString(11, sp.getCategory_id());
			ppstm.setString(12, sp.get_new());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn đb " + e.getMessage());
			return false;
		}
		return true;
	}

	public static Map<String, Book> layDuLieuTuDatabase() {
		Map<String, Book> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from  Books");
			while (rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String price = rs.getString(3);
				String sale_price = rs.getString(4);
				String publish_year = rs.getString(5);
				String picture = rs.getString(6);
				String page_number = rs.getString(7);
				String quantity = rs.getString(8);
				String quotes_about = rs.getString(9);
				String author_id = rs.getString(10);
				String publisher_id = rs.getString(11);
				String category_id = rs.getString(12);
				String _new = rs.getString(13);
				Book sp = new Book(id, title, price, sale_price, publish_year, picture, page_number,
						quantity, quotes_about, author_id, publisher_id, category_id, _new);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id,Object obj) {
		Book sp = (Book) obj;
		mapSanPham.replace(sp.getId(), sp);
		String sql = "update Books set title=?,price=?,sale_price=?,publish_year=?,picture=?,"
				+ "page_number=?,quantity=?,quotes_about=?,author_id=?, publisher_id=?,category_id=?,new=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getTitle());
			ppstm.setString(2, sp.getPrice());
			ppstm.setString(3, sp.getSale_price());
			ppstm.setString(4, sp.getPublish_year());
			ppstm.setString(5, sp.getPicture());
			ppstm.setString(6, sp.getPage_number());
			ppstm.setString(7, sp.getQuantity());
			ppstm.setString(8, sp.getQuotes_about());
			ppstm.setString(9, sp.getAuthor_id());
			ppstm.setString(10, sp.getPublisher_id());
			ppstm.setString(11, sp.getCategory_id());
			ppstm.setString(12, sp.get_new());
			ppstm.setString(13, id);
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del (String id) {
		mapSanPham.remove(id);
		String sql = "delete from Books where id='" + id + "'";
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
