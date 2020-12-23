package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import model.Book;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/Book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
	
		String chucNang = request.getParameter("func");
		String bookID = request.getParameter("id");
		String pageNumber = request.getParameter("page");
		
		request.setAttribute("pageNumber", pageNumber);

		if(chucNang == null && pageNumber != null) {
			int p = Integer.parseInt(request.getParameter("page"));
			if(p == 1 || p == 0) {
				request.setAttribute("pageNumber", 1);
			}
			else {
				request.setAttribute("pageNumber", p);
			}
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(chucNang.equals("Detail")) {
			request.setAttribute("bookID", bookID);
			request.getRequestDispatcher("single.jsp").forward(request, response);
		}
		if(chucNang.equals("filter")) {
			String pageNumber1 = request.getParameter("search");
			String pageNumber2 = request.getParameter("search");
			request.getRequestDispatcher("single.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
