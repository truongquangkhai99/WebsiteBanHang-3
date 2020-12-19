package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.UndoDAO;
import model.Order;

@WebServlet("/Order")
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
			Order kh = new Order(orderID, productName, customerName, date, price);
			new OrderDAO().edit(kh);
		}else
			//chức năng thêm đơn hàng
			if(chucNang.equals("Add")){
				String productName=request.getParameter("pdName");
				String price=request.getParameter("price");
				String customerName=request.getParameter("name");
				String date=request.getParameter("date");
				String orderID="DH"+new OrderDAO().random(9000);
				Order kh = new Order(orderID, productName, customerName, date, price);
			new OrderDAO().add( kh);
		}
		response.sendRedirect("showorder.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
