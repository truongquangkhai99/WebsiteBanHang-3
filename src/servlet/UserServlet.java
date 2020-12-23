package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDAO;
import dao.UserDAO;
import model.Book;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id;
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if(action.equals("edit")) {
			id = request.getParameter("userId");
			User infoUser = (User)session.getAttribute("customerUser"); 
			String name = request.getParameter("userName");
			String username = infoUser.getUsername();
			String password = infoUser.getPassword();
			String address =infoUser.getAddress();
			String phone = request.getParameter("userPhone");
			String email = request.getParameter("userEmail");
			String picture = infoUser.getPicture();
			String province_code = infoUser.getProvince_code();
			String district_code = infoUser.getDistrict_code();
			String ward_code = infoUser.getWard_code();
			Boolean role = infoUser.getRole();
			User _us = new User(id, name, username, password, address, phone, email, picture, province_code, district_code, ward_code, role);
			
			Boolean result = new UserDAO().editUser(id, _us);
			if(result == true) {
				session.setAttribute("customerUser", _us);
				
				response.sendRedirect("account.jsp");
			}
			
		}
	}

}
