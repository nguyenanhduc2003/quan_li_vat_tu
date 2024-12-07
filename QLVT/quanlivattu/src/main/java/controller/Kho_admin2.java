package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ExportDAO;
import model.Export;

/**
 * Servlet implementation class Kho_admin2
 */
@WebServlet("/Kho_admin2")
public class Kho_admin2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExportDAO exportDAO = new ExportDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Kho_admin2() {
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
	        int export_id = Integer.parseInt(request.getParameter("export_id"));
	        String export_name = request.getParameter("export_name");
	        String export_date = request.getParameter("export_date");
	        String export_receiver = request.getParameter("export_receiver");
	        String export_department = request.getParameter("export_department");
	        String export_phone = request.getParameter("export_phone");
	        int export_quantity = Integer.parseInt(request.getParameter("export_quantity"));

	        // Tạo đối tượng Export
	        Export export = new Export();
	        export.setExport_id(export_id);
	        export.setExport_name(export_name);
	        export.setExport_date(export_date);
	        export.setExport_receiver(export_receiver);
	        export.setExport_department(export_department);
	        export.setExport_phone(export_phone);
	        export.setExport_quantity(export_quantity);

	        // Thêm phiếu xuất vào cơ sở dữ liệu
	        boolean isAdded = exportDAO.addExport(export);

	        // Xử lý kết quả
	        response.setContentType("text/html;charset=UTF-8");
	        if (isAdded) {
	            response.getWriter().println("<script>alert('Thêm phiếu xuất thành công!'); window.location.href = 'Kho_admin';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Thêm phiếu xuất thất bại, vui lòng thử lại.'); history.back();</script>");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
	    }
	}

}
