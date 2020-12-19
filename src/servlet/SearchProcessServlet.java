package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.OrderDAO;
import dao.BookDAO;
import model.User;
import model.Order;
import model.Book;

@WebServlet("/Search")
public class SearchProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchProcessServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();

		String chucNang = request.getParameter("chucNang");
		// chức năng chọn khách hàng
		if (chucNang.equals("searchCustomer")) {
			String id = request.getParameter("name");
			User kh = new UserDAO().find(id);
			ServletContext contextdisable = getServletContext();
			contextdisable.setAttribute("disabledButton", "disabled");
			session.setAttribute("KhachHang", kh);
			response.sendRedirect("orderonline.jsp");
		} else
		// chức năng lọc trả lại sản phẩm cho vào giỏ hàng
		if (chucNang.equals("Add")) {
			String id = request.getParameter("productID");
			Book sp = new BookDAO().findProductOrder(id);
			if (sp != null) {
				new BookDAO().addProductOrder(sp);
			}
			response.sendRedirect("orderonline.jsp");

		} else
		// Chức năng xuất đơn hàng
		if (chucNang.equals("OutOrder")) {
			User kh = (User) session.getAttribute("KhachHang");

			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("dd/MM/yyyy");
			String ngayGui = timeFormat.format(today.getTime());
			Order dh = new Order("DH" + new BookDAO().random(300) + "",  ProductDAO.getTotalProductOrder(),
					kh.getMaKH(), ngayGui, new BookDAO().tongGiaTienDatHang());
			try {
				new OrderDAO().add(dh);
				session.removeAttribute("KhachHang");
				BookDAO.mapProductOrder.clear();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Lổi xuất đơn hàng");
			}
			response.sendRedirect("showorder.jsp");
		} else
		// chức năng đổi khách hàng
		if (chucNang.equals("changeCustomer")) {
			ServletContext contextdisable = getServletContext();
			contextdisable.setAttribute("disabledButton", "");
			session.removeAttribute("KhachHang");
			ProductDAO.mapProductOrder.clear();
			response.sendRedirect("orderonline.jsp");
		} else
		// chức năng xóa sản phẩm trong giỏ hàng
		if (chucNang.equals("delProduct")) {
			String id = request.getParameter("id");
			new ProductDAO().delProductOrder(id);
			session.removeAttribute("SanPham");
			response.sendRedirect("orderonline.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
