package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CouponDAO;
import model.Coupon;


@WebServlet("/CouponProcess")
public class CouponProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    public CouponProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String valuecoupon = request.getParameter("valuecoupon");
		String action = request.getParameter("action");
		
		if(action.equals("get")) {
			Coupon coup = CouponDAO.getCouponByCode(valuecoupon);
			
			request.setAttribute("valueCoupon", coup);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
	}

}
