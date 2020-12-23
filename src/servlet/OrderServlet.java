package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.pept.transport.Connection;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import model.CartItem;
import model.Order;
import model.Order_detail;
import utils.DBUtils;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
	
		String userId = request.getParameter("userId");
		String totalMoney = request.getParameter("totalMoney");
		String couponCode = (request.getParameter("couponCode")=="")?null:request.getParameter("couponCode");
		
		try {
			Order order = new Order();
			order.setCoupon_code(couponCode);
			order.setTotal(Float.parseFloat(totalMoney));
			order.setUser_id(userId);
			OrderDAO.addNewOrder(order);
			String order_id = OrderDAO.getLastestOrderID();
			HttpSession session = request.getSession();
			List<CartItem> listBooksInCart = (List) session.getAttribute("orderCart");
			for(CartItem _book : listBooksInCart) {
				Order_detail detail = new Order_detail(null, _book.getQuantity(), Float.parseFloat(_book.getBook().getSale_price()), order_id, _book.getBook().getId());
				OrderDetailDAO.addNewOrder(detail);
			}
			
			session.setAttribute("orderCart", null);
			request.setAttribute("success", "Đặt hàng thành công");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		response.sendRedirect("cart.jsp");
	}

}
