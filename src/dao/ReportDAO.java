package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import conn.ConnectionUtils;
import model.Book;
import model.Report;
import utils.DBUtils;

public interface ReportDAO {
    
    public static List<Report> reportReceipt(Date date, int limit) {
        List<Report> list = new ArrayList<>();
        for (int i = limit - 1; i >= 0; i--) {
            Date d = subDays(date, i);
            Report myItem = new Report();
            myItem.setTime(covertD2S(d));
            myItem.setValue(countItemByDate(d));
            list.add(myItem);
        }
        return list;
    }

    public static Map<String, Integer> reportTopHotBook() {
        Map<String, Integer> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"SELECT top 10 book_id, SUM(quantity) as [quantity] FROM orders, order_details WHERE MONTH(order_date) = MONTH(GETDATE()) and orders.id = order_details.order_id and YEAR(order_date) = YEAR(GETDATE()) GROUP BY book_id");
			while (rs.next()) {
				String book_id = rs.getString(1);
				int quantity = rs.getInt(2);
				map.put(book_id, quantity);
			}
		} catch (Exception e) {
			System.out.println("Lỗi lấy dữ liệu:" + e.getMessage());
			return null;
		}

		return map;
    }

    public static Map<Integer, Float> reportRevenue() {
        // List<Integer> years = new ArrayList<>();
        Map<Integer, Float> map = new HashMap<>();
        // String sql = "select year(order_date) as year_order from orders group by year(order_date)";
        String sql = "SELECT * FROM getRevenueOnceMonth(1)";
        try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, sql);
			// while (rs.next()) {
			// 	Integer year = rs.getInt(1);
			// 	years.add(year);
            // }
            // for (Integer year : years) {
            //     sql = "SELECT * FROM getRevenueOnceMonth("+year+")";
            //     rs = DBUtils.selectData(conn, sql);
                while (rs.next()) {
                    Integer thoigian = rs.getInt(1);
                    Float doanhthu = rs.getFloat(2);
                    // map.put(year+"-"+thoigian, doanhthu);
                    map.put(thoigian, doanhthu);
                }
            // }
		} catch (Exception e) {
			System.out.println("Lỗi lấy dữ liệu:" + e.getMessage());
			return null;
        }
        return map;
    }

    public static int countItemByDate(Date date) {
    	try {
            String date1 = covertD2S(date);
            System.out.println("Hiiiii:" + date1.toString());
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"SELECT count(*) as [Số đơn] FROM orders WHERE order_date = CONVERT(DATETIME,'"+date1.toString()+"', 103)");
			while (rs.next()) {
                int count = rs.getInt(1);
                return count;
			}

		} catch (Exception e) {
			System.out.println("Lỗi lấy dữ liệu:" + e.getMessage());
			return 0;
		}
        return 0;
    }

    public static Date addDays(Date date, int days) {
        GregorianCalendar cal =  new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }

    public static Date subDays(Date date, int days) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, -days);
        return cal.getTime();
    }

    public static String covertD2S(Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyy");
        return df.format(date);
    }
    
}