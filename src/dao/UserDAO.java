package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import conn.ConnectionUtils;
import model.User;
import utils.DBUtils;

public class UserDAO implements ObjectDAO {
	public static Map<String, User> mapKhachHang = loadData();
	public ArrayList<User> kh;
	public static Map<String, User> mapUndo = new HashMap<>();

	public UserDAO() {

	}

	private static Map<String, User> loadData() {
		Map<String, User> mapTemp = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select * from users");
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String username = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				String phone = rs.getString(6);
				String email = rs.getString(7);
				String picture = rs.getString(8);
				String province_code = rs.getString(9);
				String district_code = rs.getString(10);
				String ward_code = rs.getString(11);
				Boolean role = rs.getBoolean(12);

				User kh = new User(id, name, username, password, address, phone, email, picture, province_code,
						district_code, ward_code, role);
				mapTemp.put(kh.getUsername(), kh);
			}
		} catch (Exception e) {
			System.out.println("Lỗi load danh sách user database " + e.getMessage());
			e.printStackTrace();
		}

		return mapTemp;
	}

	public boolean checkLogin(String userName, String passWord) {
		User kh = mapKhachHang.get(userName);
		if (kh != null) {
			if (kh.getPassword().equals(passWord)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public boolean add(Object obj) {
		User kh = (User) obj;
		mapKhachHang.put(kh.getUsername(), kh);
		String sql = "insert into Users values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn = ConnectionUtils.getConnection();
			PreparedStatement ppstm = conn.prepareStatement(sql);
			ppstm.setString(1, kh.getName());
			ppstm.setString(2, kh.getUsername());
			ppstm.setString(3, kh.getPassword());
			ppstm.setString(4, kh.getAddress());
			ppstm.setString(5, kh.getPhone());
			ppstm.setString(6, kh.getEmail());
			ppstm.setString(7, kh.getPicture());
			ppstm.setString(8, kh.getProvince_code());
			ppstm.setString(9, kh.getDistrict_code());
			ppstm.setString(10, kh.getWard_code());
			ppstm.setBoolean(11, kh.getRole());
			ppstm.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("error when add customer :" + e.getMessage());
		}
		return false;
	}

	@Override
	public boolean del(String id) {
		mapKhachHang.remove(id);
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, "delete from Users where id='" + id + "'");
			return true;
		} catch (Exception e) {
			System.out.println("error when delete customer :" + e.getMessage());
		}
		return false;
	}

	@Override
	public boolean edit(String id, Object obj) {
		User kh = (User) obj;
		mapKhachHang.replace(id, kh);
		String sql = "update Users set username=?,password=?,name=?,address=?,phone=?,email=?,picture=?,province_code=?,district_code=?,ward_code=?, role=? where id='"
				+ id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			PreparedStatement ppstm = conn.prepareStatement(sql);
			ppstm.setString(1, kh.getUsername());
			ppstm.setString(2, kh.getPassword());
			ppstm.setString(3, kh.getName());
			ppstm.setString(4, kh.getAddress());
			ppstm.setString(5, kh.getPhone());
			ppstm.setString(6, kh.getEmail());
			ppstm.setString(7, kh.getPicture());
			ppstm.setString(8, kh.getProvince_code());
			ppstm.setString(9, kh.getDistrict_code());
			ppstm.setString(10, kh.getWard_code());
			ppstm.setBoolean(11, kh.getRole());
			ppstm.setString(12, id);
			ppstm.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("error when edit customer :" + e.getMessage());
		}
		return false;
	}

	public boolean changePass(String userName, String newPass) {
		User kh = mapKhachHang.get(userName);
		if (kh != null) {
			kh.setPassword(newPass);
			mapKhachHang.replace(kh.getUsername(), kh);
			edit(kh.getUsername(), kh);
			return true;
		} else {
			return false;
		}
	}

	public static boolean sendMail(String to, String subject, String text) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("shopphoneltw@gmail.com", "abcdabcd");
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setFrom(new InternetAddress("shopphoneltw@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
		} catch (MessagingException e) {
			return false;
		}
		return true;
	}

	public boolean passwordRecovery(String userName, String email) {
		User kh = mapKhachHang.get(userName);
		if (kh != null) {
			sendMail(email, "passWord recorvery", kh.getPassword());
			return true;
		} else {
			System.out.println("No account");
		}
		return false;
	}

	public static void main(String[] args) {
		System.out.println(new UserDAO().passwordRecovery("anhdinh", "nguyenlephong1997@gmail.com"));
	}

	public String getNameCustomer(String id) {
		String name = "";
		for (User kh : mapKhachHang.values()) {
			if (kh.getId().equals(id)) {
				name = kh.getName();
			}
		}
		return name;
	}

	public User find(String id) {
		return mapKhachHang.get(id);
	}

	public Map<String, User> getMapKhachHang() {
		return mapKhachHang;
	}

	public ArrayList<User> getKh() {
		return kh;
	}

	public boolean delAll() {
		mapUndo.putAll(mapKhachHang);
		mapKhachHang.clear();

		return true;
	}

	public boolean undo() {
		mapKhachHang.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

	public int random(int limit) {
		Random rd = new Random();
		int res = rd.nextInt(limit);
		while (mapKhachHang.containsKey("KH" + res)) {
			res = rd.nextInt(limit);
		}
		return res;
	}

	public ArrayList<User> getLoadDTB() {
		ArrayList<User> listCustomer = new ArrayList<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, "select * from Users");
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String username = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				String phone = rs.getString(6);
				String email = rs.getString(7);
				String picture = rs.getString(8);
				String province_code = rs.getString(9);
				String district_code = rs.getString(10);
				String ward_code = rs.getString(11);
				Boolean role = rs.getBoolean(12);
				User kh = new User(id, name, username, password, address, phone, email, picture, province_code,
						district_code, ward_code, role);
				listCustomer.add(kh);
			}
			return listCustomer;
		} catch (Exception e) {
			System.out.println("Lỗi load danh sách user database " + e.getMessage());
			e.printStackTrace();
		}

		return null;
	}

	public static void setMapKhachHang(Map<String, User> mapKhachHang) {
		UserDAO.mapKhachHang = mapKhachHang;
	}
}