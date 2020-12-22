package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDAO;
import model.Book;
import model.CartItem;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    int added_cart_product = 0;
    Cookie c = null;
    
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		int quantity = 1;
		String id;
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if(action.equals("add")) {
			if(request.getParameter("bookId") != null) {
				id = request.getParameter("bookId");
				Book book = BookDAO.mapSanPham.get(id);
				
				if(request.getParameter("quantity") != null) {
					quantity = Integer.parseInt(request.getParameter("quantity"));
				}
				
				if(session.getAttribute("orderCart") == null) {
					List<CartItem> listBooks = new ArrayList<CartItem>();
					CartItem item = new CartItem();
					item.setQuantity(quantity);
					item.setBook(book);
					
					listBooks.add(item);
					session.setAttribute("orderCart", listBooks);
				} else {
					List<CartItem> listBooksInCart = (List) session.getAttribute("orderCart");
					boolean check = false;
					for(CartItem _book : listBooksInCart) {
						if(_book.getBook().getId() == book.getId()) {
							_book.setQuantity(_book.getQuantity() + quantity);
							check = true;
//							listBooksInCart.remove(_book);
						}
					}
					if(check == false) {
						CartItem item = new CartItem();
						item.setQuantity(quantity);
						item.setBook(book);
						
						listBooksInCart.add(item);
					}
					session.setAttribute("orderCart", listBooksInCart);
				}
				response.sendRedirect("cart.jsp");
			}
		} else if(action.equals("sub")) {
			if(request.getParameter("bookId") != null) {
				id = request.getParameter("bookId");
				Book book = BookDAO.mapSanPham.get(id);
				
				if(request.getParameter("quantity") != null) {
					quantity = Integer.parseInt(request.getParameter("quantity"));
				}
				
				List<CartItem> listBooksInCart = (List) session.getAttribute("orderCart");
				for(CartItem _book : listBooksInCart) {
					if(_book.getBook().getId() == book.getId()) {
						if(_book.getQuantity() == 1) {
							listBooksInCart.remove(_book);
						} else {
							_book.setQuantity(_book.getQuantity() - quantity);
						}
					}
				}
				session.setAttribute("orderCart", listBooksInCart);
				response.sendRedirect("cart.jsp");
			}
		} else if(action.equals("delete")) {
			if(request.getParameter("bookId") != null) {
				id = request.getParameter("bookId");
				Book book = BookDAO.mapSanPham.get(id);
				
				List<CartItem> listBooksInCart = (List) session.getAttribute("orderCart");
				for(CartItem _book : listBooksInCart) {
					if(_book.getBook().getId() == book.getId()) {
						listBooksInCart.remove(_book);
					}
				}
				session.setAttribute("orderCart", listBooksInCart);
				response.sendRedirect("cart.jsp");
			}
		}
	}

}
