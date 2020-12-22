package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.ReportDAO;
import model.Report;
import utils.SortMapUtils;

@WebServlet("/admin/Report")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		Date date = new Date();
		List<Report> listItem = ReportDAO.reportReceipt(date, 7);
		Map<Integer, Float> mapRevenue = ReportDAO.reportRevenue();
		Map<String, Integer> mapTopHotBook = new HashMap<>();

		// Map<String, Float> treeMap = new TreeMap<String, Float>(mapRevenue);
		// for (String str : treeMap.keySet()) {
		// 	System.out.println(str);
		// }

		for (Entry<String, Integer> entry : ReportDAO.reportTopHotBook().entrySet()){
			mapTopHotBook.put(BookDAO.mapSanPham.get(entry.getKey()).getTitle(), entry.getValue());
		}

		request.setAttribute("listReceipt", listItem);
		request.setAttribute("mapRevenue", mapRevenue);
		request.setAttribute("mapTopHotBook", mapTopHotBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("statistical.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
