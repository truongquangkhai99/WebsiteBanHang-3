package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class ReviewDAO implements ObjectDAO {
	public static Map<String, Review> mapReview = layDuLieuTuDatabase();

	@Override
	public boolean add(Object obj) {
		Review review = (Review) obj;
		mapReview.put(review.getId(), review);
		try {
			String sql = "insert into Reviews values (?,?,?,?,?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, review.getPost_date().toString());
			ppstm.setInt(2, review.getStar());
			ppstm.setString(3, review.getComment());
			ppstm.setString(4, review.getUser_id());
			ppstm.setString(5, review.getBook_id());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn đb " + e.getMessage());
			return false;
		}
		return true;
	}

	public static Map<String, Review> layDuLieuTuDatabase() {
		Map<String, Review> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select * from  Reviews");
			while (rs.next()) {
				String id = rs.getString(1);
				String post_date = rs.getString(2);
				Integer star = rs.getInt(3);
				String comment = rs.getString(4);
				String user_id = rs.getString(5);
				String book_id = rs.getString(6);

				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
				LocalDateTime dateTime = LocalDateTime.parse(post_date, formatter);

				Review review = new Review(id, dateTime, star, comment, user_id, book_id);
				map.put(review.getId(), review);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Review review = (Review) obj;
		mapReview.replace(review.getId(), review);
		String sql = "update Reviews set post_date=?,star=?,comment=?,user_id=?,book_id=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, review.getPost_date().toString());
			ppstm.setInt(2, review.getStar());
			ppstm.setString(3, review.getComment());
			ppstm.setString(4, review.getUser_id());
			ppstm.setString(5, review.getBook_id());
			ppstm.setString(6, id);
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String id) {
		mapReview.remove(id);
		String sql = "delete from Reviews where id='" + id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, sql);
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn db:" + e.getMessage());
			return false;
		}
		return true;
	}

	public static Map<String, Review> layDuLieuDanhGiaCuaSach(String idBook) {
		Map<String, Review> map = new HashMap<>();
		if(!mapReview.isEmpty())
		for (Review reivew : mapReview.values()) {
			if(reivew.getBook_id().equals(idBook))
				map.put(reivew.getId(), reivew);
		}

		return map;
	}
	
	public static ArrayList<String> getListReivews(String idBook) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select count(star) from reviews where book_id="+idBook+" group by star order by star desc");
			while (rs.next()) {
				String x = rs.getString(1);
				list.add(rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return list;
	}
}
