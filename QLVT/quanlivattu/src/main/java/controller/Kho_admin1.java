package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ImportDAO;
import model.Import;

/**
 * Servlet implementation class Kho_admin1
 */
@WebServlet("/Kho_admin1")
public class Kho_admin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ImportDAO importDAO = new ImportDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Kho_admin1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

		    try {
		        // Lấy dữ liệu từ form
		        int import_id = Integer.parseInt(request.getParameter("import_id"));
		        String import_name = request.getParameter("import_name");
		        String import_date = request.getParameter("import_date");
		        String import_receiver = request.getParameter("import_receiver");
		        String import_department = request.getParameter("import_department");
		        String import_phone = request.getParameter("import_phone");
		        int import_quantity = Integer.parseInt(request.getParameter("import_quantity"));

		        // Tạo đối tượng Import
		        Import importt = new Import();
		        importt.setImport_id(import_id);
		        importt.setImport_name(import_name);
		        importt.setImport_date(import_date);
		        importt.setImport_receiver(import_receiver);
		        importt.setImport_department(import_department);
		        importt.setImport_phone(import_phone);
		        importt.setImport_quantity(import_quantity);

		        // Thêm phiếu nhập vào cơ sở dữ liệu
		        boolean isAdded = importDAO.addImport(importt);

		        // Xử lý kết quả
		        response.setContentType("text/html;charset=UTF-8");
		        if (isAdded) {
		            response.getWriter().println("<script>alert('Thêm phiếu nhập thành công!'); window.location.href = 'Kho_admin';</script>");
		        } else {
		            response.getWriter().println("<script>alert('Thêm phiếu nhập thất bại, vui lòng thử lại.'); history.back();</script>");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		        response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
		    }
	}

}
