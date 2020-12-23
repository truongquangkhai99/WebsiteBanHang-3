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

import dao.AuthorDAO;
import model.Author;

@WebServlet("/admin/author")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AuthorProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "images/author";

	public AuthorProcessServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html;charset=utf-8");

		String chucNang = request.getParameter("chucNang");
		String authorID = request.getParameter("id");
		
		response.sendRedirect("showauthor.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("text/html;charset=utf-8");

			// Add vào BookDAO
			String chucNang = request.getParameter("chucNang");
			String authorID = request.getParameter("id");
			if (chucNang == null) {

			} else
			// delete
			if (chucNang.equals("Delete")) {
				new AuthorDAO().del(authorID);
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
					String id = request.getParameter("id");
					String name = request.getParameter("name");
					String info = request.getParameter("info");
					String picture = SAVE_DIRECTORY + "/" + fileName;
					picture = (fileName == "" || fileName == null) ? request.getParameter("picture") : picture;
					
					Author author = new Author(id, name, info, picture);
					new AuthorDAO().edit(authorID, author);
				} else
				// Add
				if (chucNang.equals("Add")) {
					String name = request.getParameter("name");
					String info = request.getParameter("info");
					String picture = SAVE_DIRECTORY + "/" + fileName;
					String id = "" + AuthorDAO.mapTacGia.size()+1;
					Author author = new Author(id, name, info, picture);
					new AuthorDAO().add(author);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error: " + e.getMessage());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
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
