package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		if(action != null && action.toLowerCase().contains("logout")){
			request.getSession().invalidate();
 
			// Redrect to Home Page.
			response.sendRedirect(request.getContextPath() + "/");
		}
		else
			response.sendRedirect("account.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		if(new UserDAO().checkLogin(userName, passWord)){
			HttpSession session = request.getSession();
			User kh = UserDAO.mapKhachHang.get(userName);
			if(kh.getRole())
				session.setAttribute("adminUser", kh);
			else {
				session.setAttribute("customerUser", kh);
			}
			String returnURL = request.getParameter("returnURL");
			if(returnURL == null) {
				returnURL = request.getContextPath() + "/";
			}
			response.sendRedirect(returnURL);
		}
		else {
			request.setAttribute("errorString", "Tên tài khoản hoặc mật khẩu không đúng, vui lòng thử lại.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
