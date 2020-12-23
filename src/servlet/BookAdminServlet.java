package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.BookDAO;
import dao.UndoDAO;
import model.Book;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/admin/book")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class BookAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "images/product";

	public BookAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");

		String chucNang = request.getParameter("chucNang");
		String bookID = request.getParameter("id");
		if (chucNang == null) {

		} else
		// delete
		if (chucNang.equals("Delete")) {
			UndoDAO.undoBook.push(BookDAO.mapSanPham.get(bookID));
			new BookDAO().del(bookID);
		} else
		// delete all
		if (chucNang.equals("DelAll")) {
			new BookDAO().delAll();
		} else
		// undo all
		if (chucNang.equals("UndoAll")) {
			new BookDAO().undo();
		} else
		// undoOne
		if (chucNang.equals("UndoOne")) {
			new UndoDAO().restoreDeletedBook();
		}
		response.sendRedirect("showbook.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("text/html;charset=utf-8");

			// Add vào BookDAO
			String chucNang = request.getParameter("chucNang");
			String bookID = request.getParameter("id");
			if (chucNang == null) {

			} else
			// delete
			if (chucNang.equals("Delete")) {
				UndoDAO.undoBook.push(BookDAO.mapSanPham.get(bookID));
				new BookDAO().del(bookID);
			} else
			// delete all
			if (chucNang.equals("DelAll")) {
				new BookDAO().delAll();
			} else
			// undo all
			if (chucNang.equals("UndoAll")) {
				new BookDAO().undo();
			} else
			// undoOne
			if (chucNang.equals("UndoOne")) {
				new UndoDAO().restoreDeletedBook();
			} else {
				// code up ảnh
				// Đường dẫn tuyệt đối tới thư mục gốc của web app.
				String appPath = request.getServletContext().getRealPath("");
				appPath = appPath.replace('\\', '/');

				// Thư mục để save file tải lên.
				String fullSavePath = null;
				if (appPath.endsWith("/")) {
					fullSavePath = appPath + SAVE_DIRECTORY;
				} else {
					fullSavePath = appPath + "/" + SAVE_DIRECTORY;
				}

				// Tạo thư mục nếu nó bookông tồn tại.
				File fileSaveDir = new File(fullSavePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdir();
				}
				String fileName = "";
				// Danh mục các phần đã upload lên (Có thể là nhiều file).
				for (Part part : request.getParts()) {
					fileName = extractFileName(part);
					if (fileName != null && fileName.length() > 0) {
						String filePath = fullSavePath + File.separator + fileName;
						System.out.println("Write attachment to file: " + filePath);

						// Ghi vào file.
						part.write(filePath);
						break;
					}
				}

				// Upload thành công.
				response.sendRedirect(request.getContextPath() + "/");
				// Edit
				if (chucNang.equals("Edit")) {
					String title  = request.getParameter("name");
					String price =request.getParameter("price");
					String sale_price =request.getParameter("sale_price");
					String publish_year =request.getParameter("publish_year");
					String picture =	SAVE_DIRECTORY+ "/"+fileName;
					picture = (fileName == "" || fileName == null)?request.getParameter("picture"):picture;
					String page_number = request.getParameter("page_number");
					String quantity = request.getParameter("quantity");
					String quotes_about = request.getParameter("quotes_about");
					String author_id = request.getParameter("author_id");
					String publisher_id = request.getParameter("publisher_id");
					String category_id = request.getParameter("category_id");
					String _new = request.getParameter("_new");
					Book book = new Book(bookID, title, price, sale_price, publish_year, picture, page_number, quantity,
							quotes_about, author_id, publisher_id, category_id, _new);
					new BookDAO().edit(bookID, book);
				} else
				// Add
				if (chucNang.equals("Add")) {
					String title  = request.getParameter("name");
					String price =request.getParameter("price");
					String sale_price =request.getParameter("sale_price");
					String publish_year =request.getParameter("publish_year");
					String picture =	SAVE_DIRECTORY+ "/"+fileName;
					String page_number =request.getParameter("page_number");
					String quantity =request.getParameter("quantity");
					String quotes_about =request.getParameter("quotes_about");
					String author_id =request.getParameter("author_id");
					String publisher_id =request.getParameter("publisher_id");
					String category_id =request.getParameter("category_id");
					String _new =request.getParameter("_new");
					String id = "" + BookDAO.mapSanPham.size()+1;
					Book book = new Book(id, title, price, sale_price, publish_year, picture, page_number, quantity,
							quotes_about, author_id, publisher_id, category_id, _new);
					new BookDAO().add(book);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error: " + e.getMessage());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
			dispatcher.forward(request, response);
		}
	}

	private String extractFileName(Part part) {
		// form-data; name="file"; filename="C:\file1.zip"
		// form-data; name="file"; filename="C:\Note\file2.zip"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// C:\file1.zip
				// C:\Note\file2.zip
				String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				// file1.zip
				// file2.zip
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}

}
