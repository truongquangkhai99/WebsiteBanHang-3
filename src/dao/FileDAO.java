package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.User;
import model.ObjExcel;
import model.Order;
import model.Book;

public class FileDAO {
	String text;

	public FileDAO(String text) {
		super();
		this.text = text;
	}

	public String getStringArray() {
		String res = "";
		String[] str = this.text.split("[\n]");
		for (String string : str) {
			res += string.trim();
		}

		String sf = "";
		int batDau = 0;
		int ketThuc = 0;
		for (int i = 0; i < res.length(); i++) {
			if (res.charAt(i) != ' ') {
				sf += res.charAt(i) + "";
			}
		}
		for (int i = 0; i < sf.length(); i++) {
			if (sf.charAt(i) == '[') {
				batDau = i;
				break;
			}
		}
		for (int i = 0; i < sf.length(); i++) {
			if (sf.charAt(i) == ']') {
				ketThuc = i;
				break;
			}
		}
		res = sf.substring(batDau, ketThuc);
		res = res.substring(1, res.length());

		return res;
	}

	public Map<String, User> getCustomer(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, User> mapOBJ = new HashMap<String, User>();
		//láº¥y ra tá»«ng hÃ ng cá»§a file excel
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		//Kiá»ƒm tra xem danh sÃ¡ch nháº­n tá»« excel cÃ³ há»£p lá»‡ hay khÃ´ng,náº¿u cÃ³ thÃ¬ import,ngÆ°á»£c láº¡i lÃ  return null
		// if (listBig.size() < 5 || listBig.size() > 5) {
		// 	return null;
		// } else {
			//Láº¥y ra tá»«ng giÃ¡ trá»‹ cá»§a hÃ ng,táº¡o ra object tÆ°Æ¡ng á»©ng,truyá»�n giÃ¡ trá»‹ cá»§a hÃ ng vÃ o thuá»™c tÃ­nh
			for (int j = 0; j < listBig.size(); j++) {
				list = getStringDoubleDot(listBig.get(j));
				mapOBJ.put(list.get(0), new User(list.get(0), list.get(1), list.get(2), list.get(3), list.get(4), list.get(5), list.get(6),
						list.get(7), list.get(8), list.get(9), list.get(10), null));
			}
		// }
		return mapOBJ;
	}

	public Map<String, Book> getProduct(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, Book> mapProduct = new HashMap<>();
		int continueBookID = BookDAO.mapSanPham.size();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		// if (listBig.size() < 5 || listBig.size() > 5) {
		// return null;
		// } else {
		for (int j = 0; j < listBig.size(); j++) {
			list = getStringDoubleDot(listBig.get(j));
			mapProduct.put(continueBookID+j+"",
					new Book(continueBookID+j+"", list.get(0), list.get(1), list.get(2), list.get(3), list.get(4), list.get(5), list.get(6), list.get(7), list.get(8), list.get(9), list.get(10), list.get(11)));
		}
		// }
		return mapProduct;
	}

	public Map<String, Order> getOrder(String s) {
		ArrayList<String> listBig = new ArrayList<>();
		ArrayList<String> list = new ArrayList<>();
		Map<String, Order> mapOrder = new HashMap<>();
		s = s.substring(1, s.length() - 1);
		String[] arr = s.split("}");
		for (int i = 0; i < arr.length; i++) {
			if (i == 0) {
				arr[i] = arr[i].substring(0, arr[i].length());
			} else {
				arr[i] = arr[i].substring(2, arr[i].length());
			}
			listBig.add(arr[i]);
		}
		// if (listBig.size() < 5 || listBig.size() > 5) {
		// return null;
		// } else {
		for (int j = 0; j < listBig.size(); j++) {
			list = getStringDoubleDot(listBig.get(j));
			mapOrder.put(list.get(0),
					new Order(list.get(0), null, null, null, list.get(1), list.get(2), null, list.get(3), list.get(4)));
		}
		// }
		return mapOrder;
	}

	public ArrayList<String> getStringDoubleDot(String s) {
		ArrayList<String> list = new ArrayList<>();
		String[] arr = s.split(",");
		for (int i = 0; i < arr.length; i++) {
			list.add(arr[i].split(":")[1].replace("\"",""));
		}
		return list;
	}

	public static void main(String[] args) {
		String st = "{  ok.xlsx: {    Sheet1: [      {        TÃªn:  Phong ,         Lá»›p :  B ,         Khoa :  CNTT       },      {         TÃªn :  Háº­u , Lá»›p :  C ,         Khoa :  CNTT       },{         TÃªn :  HÃ²a ,         Lá»›p :  C ,         Khoa :  ThÃº Y       }], Sheet2 :[], Sheet3 :[]}} ;";
		String ok = "TÃªn:Phong,Lá»›p:B,Khoa:CNTT";
		FileDAO test = new FileDAO(st);
		// System.out.println(test.getStringArray());
		// System.out.println(test.getStringDoubleDot(ok));
		System.out.println(test.getCustomer(test.getStringArray()));
	}
}
