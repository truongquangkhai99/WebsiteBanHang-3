package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import conn.ConnectionUtils;
import model.Order;
import utils.DBUtils;

public class OrderDAO implements ObjectDAO {

	public static Map<String, Order> mapOrder = getLoadOrderDTB();
	public static Map<String, Order> mapUndo = new HashMap<>();
	public static Set<String> setDateOrder = getSetDateOrder();

	public OrderDAO() {

	}

	public static Set<String> getSetDateOrder() {
		Set<String> date = new HashSet<>();
		for (Order od : mapOrder.values()) {
			date.add(od.getOrder_date().toString());
		}
		return date;
	}

	public boolean delAll() {
		mapUndo.putAll(mapOrder);
		mapOrder.clear();

		return true;
	}

	public boolean undo() {
		mapOrder.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

	public int random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapOrder.containsKey("Order" + res)) {
			res = rd.nextInt(limit);
		}
		return res;
	}

	@Override
	public boolean add(Object obj) {
		Order order = (Order) obj;
		mapOrder.put(order.getId(), order);
		try {
			Connection conn = ConnectionUtils.getConnection();
			PreparedStatement statement = conn.prepareStatement("insert into [Orders] values(?,?,?,?,?,?,?,?)");
			statement.setString(1, order.getOrder_date().toString());
			statement.setDate(2, order.getRequired_date());
			statement.setDate(3, order.getShipped_date());
			statement.setString(4, order.getStatus());
			statement.setString(5, order.getComment());
			statement.setFloat(6, order.getTotal());
			statement.setString(7, order.getUser_id());
			statement.setString(8, order.getCoupon_code());
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return false;
	}

	public Map<String, Order> getSelectOrderDate(String date) {
		Map<String, Order> mapSelectProduct = new HashMap<>();
		try {
			java.util.Date dateD = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			for (Order sp : mapOrder.values()) {
				if (sp.getOrder_date().equals(dateD)) {
					mapSelectProduct.put(sp.getId(), sp);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mapSelectProduct;
	}

	public static Map<String, Order> getLoadOrderDTB() {
		Map<String, Order> listOrder = new HashMap<String, Order>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from [Orders]");
			while (rs.next()) {
				String id = rs.getString(1);
				Date order_date = rs.getDate(2);
				Date required_date = rs.getDate(3);
				Date shipped_date = rs.getDate(4);
				String status = rs.getString(5);
				String comment = rs.getString(6);
				Float total = rs.getFloat(7);
				String user_id = rs.getString(8);
				String coupon_code = rs.getString(9);
				listOrder.put(id, new Order(id, order_date, required_date, shipped_date, status, comment, total, user_id,
						coupon_code));
			}
		} catch (Exception e) {
			System.out.println("Lỗi ở load danh sách database " + e.getMessage());
			e.printStackTrace();
			return null;
		}
		return listOrder;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Order order = (Order) obj;
		mapOrder.replace(order.getId(), order);
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "update orders set order_date=?,required_date=?,shipped_date=?,status=?,comment=?,total=?,user_id=?,coupon_code=? where id=?";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setDate(1, order.getOrder_date());
			preparedStatement.setDate(2, order.getRequired_date());
			preparedStatement.setDate(3, order.getShipped_date());
			preparedStatement.setString(4, order.getStatus());
			preparedStatement.setString(5, order.getComment());
			preparedStatement.setFloat(6, order.getTotal());
			preparedStatement.setString(7, order.getUser_id());
			preparedStatement.setString(8, order.getCoupon_code());
			preparedStatement.setString(9, order.getId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String id) {
		mapOrder.remove(id);
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, "delete from orders where id='" + id + "'");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	

}
