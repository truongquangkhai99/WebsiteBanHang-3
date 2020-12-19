package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.BookDAO;
import dao.ProductDAO;
import dao.UndoDAO;
import model.User;
import model.Book;

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
		String bookID = request.getParameter("id");
		if(chucNang==null){
			
		}else
			//chức năng xóa sách
			if(chucNang.equals("Delete")){
				UndoDAO.undoBook.push(BookDAO.mapSanPham.get(bookID));
			new BookDAO().del(bookID);
		}else
			//chức năng xóa tất cả sách
			if(chucNang.equals("DelAll")){
			new BookDAO().delAll();
		}else
			//chức năng undoAll
			if(chucNang.equals("UndoAll")){
			new BookDAO().undo();
		}else
			//chức năng undoOne
			if(chucNang.equals("UndoOne")){
			new UndoDAO().restoreDeletedProduct();
		}else
			//chức năng sửa sách
			if(chucNang.equals("Edit")){
			String productID = request.getParameter("masp");
			String productName=request.getParameter("pdName");
			String price=request.getParameter("price");
			String producerID=request.getParameter("NSXID");
			String img=request.getParameter("img");
			Book kh = new Book(productID, productName, price, producerID, img);
			new BookDAO().edit(kh);
		}else
			//chức năng thêm sách
			if(chucNang.equals("Add")){
				String productName=request.getParameter("pdName");
				String price=request.getParameter("price");
				String producerID=request.getParameter("NSXID");
				String img=request.getParameter("img");
				String productID="Product"+new BookDAO().random(9000);
				Book kh = new Book(productID, productName, price, producerID, img);
			new BookDAO().add( kh);
		}
		response.sendRedirect("showproduct.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
