package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//		
//		String chucNang = request.getParameter("func");
//		String bookID = request.getParameter("id");
//		
//		request.setAttribute("id", bookID);
		request.getRequestDispatcher("wishlist.jsp").forward(request, response);
//		if(chucNang.equals("Detail")) {
//		}
		
//		response.sendRedirect("showproduct.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
