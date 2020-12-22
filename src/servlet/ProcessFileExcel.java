package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FileDAO;
import dao.UserDAO;
import dao.OrderDAO;
import dao.BookDAO;
import model.User;
import model.Order;
import model.Book;

@WebServlet("/admin/Excel")
public class ProcessFileExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessFileExcel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html ; charset=utf-8");

		String text = request.getParameter("data");
		String chucNang = request.getParameter("chucNang");
		// String[] s = text.split(",");

		if (chucNang == null || chucNang.equals("")) {

		} else
		// chức năng import khách hàng từ excel
		if (chucNang.equals("Customer")) {
			Map<String, User> mapCustomer = new FileDAO(text).getCustomer(new FileDAO(text).getStringArray());
			if(!mapCustomer.isEmpty()){
				for (User customer : mapCustomer.values()) {
					new UserDAO().add(customer);
				}
			}
			response.sendRedirect("showcustomer.jsp");
		} else
		// chức năng import sản phẩm từ excel
		if (chucNang.equals("Product")) {
			Map<String, Book> mapProduct = new FileDAO(text).getProduct(new FileDAO(text).getStringArray());
			if(!mapProduct.isEmpty()){
				for (Book sp : mapProduct.values()) {
					new BookDAO().add(sp);
				}
			}
			response.sendRedirect("showbook.jsp");

		} else
		// chức năng import đơn hàng từ excel
		if (chucNang.equals("Order")) {
			Map<String, Order> mapOrder = new FileDAO(text).getOrder(new FileDAO(text).getStringArray());
			if(!mapOrder.isEmpty()){
				for (Order o : mapOrder.values()) {
					new OrderDAO().add(o);
				}
			}
			response.sendRedirect("showorder.jsp");

		} else {
			System.out.println("Rỗng");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
