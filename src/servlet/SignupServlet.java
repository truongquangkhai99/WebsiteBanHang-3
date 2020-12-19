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

@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignupServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		response.sendRedirect("account.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");

		if (UserDAO.mapKhachHang.get(userName) != null) {
			request.setAttribute("errorString", "Tên tài khoản đã tồn tại, vui lòng thử tên khác.");
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		} else {
			User kh = new User(userName, passWord);

			if (new UserDAO().add(kh)) {
				HttpSession session = request.getSession();
				if (kh.getRole())
					session.setAttribute("adminUser", kh);
				else {
					session.setAttribute("customerUser", kh);
				}
				response.sendRedirect(request.getParameter("from"));
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	}

}
