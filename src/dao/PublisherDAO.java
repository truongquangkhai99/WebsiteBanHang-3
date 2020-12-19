package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class PublisherDAO implements ObjectDAO {
	public static Map<String, Publisher> mapPublisher = layDuLieuTuDatabase();
	

	@Override
	public boolean add(Object obj) {
		Publisher ncc = (Publisher) obj;
		mapPublisher.put(ncc.getId(), ncc);
		try {
			String sql = "insert into [dbo].[Publishers] values (?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, ncc.getName());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lỗi thêm publisher: " + e.getMessage());
			return false;
		}
		return true;
	}
//PhÆ°Æ¡ng thá»©c láº¥y dá»¯ liá»‡u tá»« database lÃªn sá»­ dá»¥ng
	public static Map<String, Publisher> layDuLieuTuDatabase() {
		Map<String, Publisher> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from  Publishers");
			while (rs.next()) {
				String maPublisher = rs.getString(1);
				String tenPublisher = rs.getString(2);
				Publisher ncc = new Publisher(maPublisher, tenPublisher);
				map.put(ncc.getId(), ncc);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id,Object obj) {
		Publisher ncc = (Publisher) obj;
		mapPublisher.replace(ncc.getId(), ncc);
		String sql = "update Publishers set name=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, ncc.getName());
			ppstm.setString(2, id);
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String id) {
		mapPublisher.remove(id);
		String sql = "delete from Publishers where MaPublisher='" + id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, sql);
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn:" + e.getMessage());
			return false;
		}
		return true;
	}
}
