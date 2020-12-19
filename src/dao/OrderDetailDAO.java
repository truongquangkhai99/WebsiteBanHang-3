package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import conn.ConnectionUtils;
import model.Order_detail;
import utils.DBUtils;

public class OrderDetailDAO implements ObjectDAO {

	public static Map<String, Order_detail> mapOrder = getLoadOrderDTB();
	public static Map<String, Order_detail> mapUndo = new HashMap<>();
	public OrderDetailDAO() {

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
		while (mapOrder.containsKey("Order_detail" + res)) {
			res = rd.nextInt(limit);
		}
		return res;
	}

	@Override
	public boolean add(Object obj) {
		Order_detail order = (Order_detail) obj;
		mapOrder.put(order.getId(), order);
		try {
			Connection conn = ConnectionUtils.getConnection();
			PreparedStatement statement = conn.prepareStatement("insert into [Order_details] values(?,?,?,?)");
			statement.setInt(1, order.getQuantity());
			statement.setFloat(2, order.getPrice());
			statement.setString(3, order.getOrder_id());
			statement.setString(4, order.getBook_id());
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return false;
	}

	public static Map<String, Order_detail> getLoadOrderDTB() {
		Map<String, Order_detail> listOrder = new HashMap<String, Order_detail>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from [Order_details]");
			while (rs.next()) {
				String id = rs.getString(1);
				Integer quantity = rs.getInt(2);
				Float price = rs.getFloat(3);
				String orderID = rs.getString(4);
				String bookID = rs.getString(5);
				listOrder.put(id, new Order_detail(id, quantity, price, orderID, bookID));
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
		Order_detail order = (Order_detail) obj;
		mapOrder.replace(order.getId(), order);
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "update [Order_details] set quantity=?,price=?,orderID=?,bookID=? where id=?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, order.getQuantity());
			statement.setFloat(2, order.getPrice());
			statement.setString(3, order.getOrder_id());
			statement.setString(4, order.getBook_id());
			statement.setString(5, order.getId());
			statement.executeUpdate();
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
			DBUtils.executeSQL(conn, "delete from [Order_details] where id='" + id + "'");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	

}
