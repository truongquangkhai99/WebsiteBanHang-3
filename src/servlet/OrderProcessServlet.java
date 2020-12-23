package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.UndoDAO;
import dao.UserDAO;
import model.Order;
import model.Order_detail;
import model.User;

@WebServlet("/admin/order")
public class OrderProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderProcessServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		session.getAttribute("");
		
		String chucNang = request.getParameter("chucNang");
		String maKH = request.getParameter("id");
		if(chucNang==null){
			response.sendRedirect("showorder.jsp");
		}else
			//chức năng xem chi tiết đơn hàng
			if(chucNang.equals("Detail")){
				String orderID=request.getParameter("id");
				Order order = OrderDAO.mapOrder.get(orderID);
				User user =UserDAO.getUserByID(order.getUser_id());
				List<Order_detail> detail = OrderDetailDAO.getDetailByOrderID(orderID);
				request.setAttribute("order", order);
				request.setAttribute("user", user);
				request.setAttribute("detail", detail);
				request.getRequestDispatcher("order/info.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		session.getAttribute("");
		
		String chucNang = request.getParameter("chucNang");
		String maKH = request.getParameter("id");
		if(chucNang==null){
			
		}else
			//chức năng xóa đơn hàng
			if(chucNang.equals("Delete")){
				UndoDAO.undoOrder.push(OrderDAO.mapOrder.get(maKH));
				new OrderDAO().del(maKH);
		}else
			//chức năng xóa tất cả đơn hàng
			if(chucNang.equals("DelAll")){
			new OrderDAO().delAll();
		}else
			//chức năng undoAll
			if(chucNang.equals("UndoAll")){
			new OrderDAO().undo();
		}else
			//chức năng undoOne
			if(chucNang.equals("UndoOne")){
			new UndoDAO().restoreDeletedOrder();
		}else
			//chức năng sửa đơn hàng
			if(chucNang.equals("Edit")){
			String productName=request.getParameter("pdName");
			String customerName=request.getParameter("name");
			String price=request.getParameter("price");
			String orderID=request.getParameter("masp");
			String date=request.getParameter("date");
			Order kh = new Order(orderID, null, null, null, productName, customerName, null, date, price);
			new OrderDAO().edit(maKH, kh);
		}else
			//chức năng thêm đơn hàng
			if(chucNang.equals("Add")){
				String productName=request.getParameter("pdName");
				String price=request.getParameter("price");
				String customerName=request.getParameter("name");
				String date=request.getParameter("date");
				String orderID="DH"+new OrderDAO().random(9000);
				Order kh = new Order(orderID, null, null, null, productName, customerName, null, date, price);
			new OrderDAO().add(kh);
		}else
			//chức năng thêm đơn hàng
			if(chucNang.equals("Detail")){
				String orderID=request.getParameter("masp");
				Order order = OrderDAO.mapOrder.get(orderID);
				List<Order_detail> detail = OrderDetailDAO.getDetailByOrderID(orderID);
				request.setAttribute("order", order);
				request.setAttribute("detail", detail);
				request.getRequestDispatcher("order/info.jsp").forward(request, response);
		}
		response.sendRedirect("showorder.jsp");
	}

}
