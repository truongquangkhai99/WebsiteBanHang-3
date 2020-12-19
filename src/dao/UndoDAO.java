package dao;

import java.util.Stack;

import model.Order;
import model.Book;
import model.User;

public class UndoDAO {
		public static Stack<User> undoCustomer = new Stack<>();
		public static Stack<Book> undoBook = new Stack<>();
		public static Stack<Order> undoOrder = new Stack<>();
		
		public boolean restoreDeletedCustomer(){
			if(!undoCustomer.isEmpty()){
				User kh = undoCustomer.pop();
				System.out.println(kh);
				if(kh!=null){
					UserDAO.mapKhachHang.put(kh.getId(), kh);
				}
				return true;
			}else{
				return false;
			}
		}
		public boolean restoreDeletedBook(){
			if(!undoBook.isEmpty()){
				Book sp = undoBook.pop();
				if(sp!=null){
					BookDAO.mapSanPham.put(sp.getId(), sp);
				}
				return true;
			}else{
				return false;
			}
		}
		public boolean restoreDeletedOrder(){
			if(!undoOrder.isEmpty()){
				Order o = undoOrder.pop();
				if(o!=null){
					OrderDAO.mapOrder.put(o.getId(), o);
				}
				return true;
			}else{
				return false;
			}
		}
}
