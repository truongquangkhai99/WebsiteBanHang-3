package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.ProductDAO;
import dao.UndoDAO;
import model.KhachHang;
import model.Product;

@WebServlet("/Product")
public class ProductProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductProcessServlet() {
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
			//chức năng xóa khách hàng
			if(chucNang.equals("Delete")){
				UndoDAO.undoProduct.push(ProductDAO.mapProduct.get(maKH));
			new ProductDAO().del(maKH);
		}else
			//chức năng xóa tất cả khách hàng
			if(chucNang.equals("DelAll")){
			new ProductDAO().delAll();
		}else
			//chức năng undoAll
			if(chucNang.equals("UndoAll")){
			new ProductDAO().undo();
		}else
			//chức năng undoOne
			if(chucNang.equals("UndoOne")){
			new UndoDAO().restoreDeletedProduct();
		}else
			//chức năng sửa khách hàng
			if(chucNang.equals("Edit")){
			String productID = request.getParameter("masp");
			String productName=request.getParameter("pdName");
			String price=request.getParameter("price");
			String producerID=request.getParameter("NSXID");
			String img=request.getParameter("img");
			Product kh = new Product(productID, productName, price, producerID, img);
			new ProductDAO().edit(kh);
		}else
			//chức năng thêm khách hàng
			if(chucNang.equals("Add")){
				String productName=request.getParameter("pdName");
				String price=request.getParameter("price");
				String producerID=request.getParameter("NSXID");
				String img=request.getParameter("img");
				String productID="Product"+new ProductDAO().random(9000);
				Product kh = new Product(productID, productName, price, producerID, img);
			new ProductDAO().add( kh);
		}
		response.sendRedirect("showproduct.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
