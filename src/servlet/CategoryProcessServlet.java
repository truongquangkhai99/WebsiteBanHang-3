package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;


@WebServlet("/admin/category")
public class CategoryProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    public CategoryProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		response.sendRedirect("showcategory.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("text/html;charset=utf-8");

			// Add vào BookDAO
			String chucNang = request.getParameter("chucNang");
			String categoryID = request.getParameter("id");
			if (chucNang == null) {

			} else
			// delete
			if (chucNang.equals("Delete")) {
				new CategoryDAO().del(categoryID);
			} else {
				response.sendRedirect(request.getContextPath() + "/");
				// Edit
				if (chucNang.equals("Edit")) {
					String id = request.getParameter("id");
					String name = request.getParameter("name");
					
					Category category = new Category(id, name);
					new CategoryDAO().edit(categoryID, category);
				} else
				// Add
				if (chucNang.equals("Add")) {
					String name = request.getParameter("name");
					String id = "" + CategoryDAO.mapLoaiSanPham.size()+1;
					Category category = new Category(id, name);
					new CategoryDAO().add(category);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error: " + e.getMessage());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
		}
	}

}
