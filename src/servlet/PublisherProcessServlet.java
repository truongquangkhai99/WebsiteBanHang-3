package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PublisherDAO;
import model.Publisher;


@WebServlet("/admin/publisher")
public class PublisherProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublisherProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		response.sendRedirect("showpublisher.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("text/html;charset=utf-8");

			// Add vào BookDAO
			String chucNang = request.getParameter("chucNang");
			String publisherID = request.getParameter("id");
			if (chucNang == null) {

			} else
			// delete
			if (chucNang.equals("Delete")) {
				new PublisherDAO().del(publisherID);
			} else {
				response.sendRedirect(request.getContextPath() + "/");
				// Edit
				if (chucNang.equals("Edit")) {
					String id = request.getParameter("id");
					String name = request.getParameter("name");
					
					Publisher publisher = new Publisher(id, name);
					new PublisherDAO().edit(publisherID, publisher);
				} else
				// Add
				if (chucNang.equals("Add")) {
					String name = request.getParameter("name");
					String id = "" + PublisherDAO.mapPublisher.size()+1;
					Publisher publisher = new Publisher(id, name);
					new PublisherDAO().add(publisher);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error: " + e.getMessage());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
		}
	}

}
