package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class CouponDAO implements ObjectDAO {
	public static Map<String, Coupon> mapCoupon = layDuLieuTuDatabase();

	@Override
	public boolean add(Object obj) {
		Coupon sp = (Coupon) obj;
		mapCoupon.put(sp.getId(), sp);
		try {
			String sql = "insert into Coupons values (?,?,?,?,?,?,?,?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getCode());
			ppstm.setString(2, sp.getDescription());
			ppstm.setFloat(3, sp.getDiscount());
			ppstm.setFloat(4, sp.getMax_value());
			ppstm.setDate(5, sp.getValid_from());
			ppstm.setDate(6, sp.getValid_until());
			ppstm.setInt(7, sp.getCount());
			ppstm.setBoolean(8, sp.getIs_enable());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn đb " + e.getMessage());
			return false;
		}
		return true;
	}

	public static Coupon getCouponByCode(String code) {
		mapCoupon = layDuLieuTuDatabase();
		for(Coupon coupon: mapCoupon.values()) {
			if(coupon.getCode().equals(code))
				return coupon;
		}
		return null;
	}

	public static Map<String, Coupon> layDuLieuTuDatabase() {
		Map<String, Coupon> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select * from  Coupons");
			while (rs.next()) {
				String id = rs.getString(1);
				String code = rs.getString(2);
				String description = rs.getString(3);
				Float discount = rs.getFloat(4);
				Float max_value = rs.getFloat(5);
				Date valid_from = rs.getDate(6);
				Date valid_until = rs.getDate(7);
				Integer count = rs.getInt(8);
				Boolean is_enable = rs.getBoolean(9);
				Coupon sp = new Coupon(id, code, description, discount, max_value, valid_from, valid_until, count,
						is_enable);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Coupon sp = (Coupon) obj;
		mapCoupon.replace(sp.getId(), sp);
		String sql = "update Coupons set code=?,description=?,discount=?,max_value=?,valid_from=?,"
				+ "valid_until=?,count=?,is_enable=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getCode());
			ppstm.setString(2, sp.getDescription());
			ppstm.setFloat(3, sp.getDiscount());
			ppstm.setFloat(4, sp.getMax_value());
			ppstm.setDate(5, sp.getValid_from());
			ppstm.setDate(6, sp.getValid_until());
			ppstm.setInt(7, sp.getCount());
			ppstm.setBoolean(8, sp.getIs_enable());
			ppstm.setString(9, sp.getId());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del (String id) {
		mapCoupon.remove(id);
		String sql = "delete from Coupons where id='" + id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, sql);
		} catch (Exception e) {
			System.out.println("Lỗi truy vấn db:" + e.getMessage());
			return false;
		}
		return true;
	}

	public static Coupon getCouponByCode(String Code) {
		Coupon cp = new Coupon();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select * from coupons where code='"+Code+"'");
			while (rs.next()) {
				String id = rs.getString(1);
				String code = rs.getString(2);
				String description = rs.getString(3);
				Float discount = rs.getFloat(4);
				Float max_value = rs.getFloat(5);
				Date valid_from = rs.getDate(6);
				Date valid_until = rs.getDate(7);
				Integer count = rs.getInt(8);
				Boolean is_enable = rs.getBoolean(9);
				Coupon sp = new Coupon(id, code, description, discount, max_value, valid_from, valid_until, count,
						is_enable);
				cp = sp;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return cp;
	}

}
