package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ProducerDAO;
import dao.ProductDAO;
import model.Producer;
import model.Product;

@WebServlet("/Datalist")
public class ComboboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ComboboxServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("producerID");
		
		List<String> list = new ArrayList<String>();
		String json = null;
		for (Product sp : new ProductDAO().getListProductByProducerID(id).values()) {
			list.add(sp.getProductID()+"-"+sp.getProductName());
		}

		json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
