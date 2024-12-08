package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DepartmentDAO;
import DAO.ExportDAO;
import DAO.ImportDAO;
import DAO.MaterialDAO;
import model.Department;
import model.Export;
import model.Import;
import model.Material;

/**
 * Servlet implementation class Kho_admin
 */
@WebServlet("/Kho_admin")
public class Kho_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ImportDAO importDAO = new ImportDAO();
	private ExportDAO exportDAO = new ExportDAO();
	private MaterialDAO materialDAO = new MaterialDAO();
	private DepartmentDAO departmentDAO = new DepartmentDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Kho_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 // Lấy danh sách tài khoản từ cơ sở dữ liệu
	    List<Import> importts = importDAO.getAll();
	    List<Export> exportts = exportDAO.getAll();
	    List<Material> materialList = materialDAO.getAllMaterials();
	    List<Department> departments = departmentDAO.getAllDepartments();
	    MaterialDAO materialDAO = new MaterialDAO();
	    List<Material> materialList2 = materialDAO.getAllMaterialsWithStatistics();
	    
	 // Tính toán tổng số vật tư, tổng số nhập và tổng số xuất
        int totalMaterials = materialList.size();
        int totalImported = importDAO.getTotalImportedQuantity();
        int totalExported = exportDAO.getTotalExportedQuantity();


        // Đưa các thông tin vào request để truyền cho JSP
        request.setAttribute("totalMaterials", totalMaterials);
        request.setAttribute("totalImported", totalImported);
        request.setAttribute("totalExported", totalExported);
        request.setAttribute("materialList2", materialList2);
	    
	    // Đưa danh sách tài khoản vào request để gửi đến JSP
	    request.setAttribute("importts", importts);
	    request.setAttribute("exportts", exportts);
	    request.setAttribute("materialList", materialList);
	    request.setAttribute("departments", departments);

	    
	    // Chuyển hướng đến trang JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("kho_admin.jsp");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		 // Lấy dữ liệu từ form
        String materialName = request.getParameter("material_name");
        String importName = request.getParameter("import_name");
        String importDate = request.getParameter("import_date");
        String importReceiver = request.getParameter("import_receiver");
        String importPhone = request.getParameter("import_phone");
        String importDepartment = request.getParameter("import_department");
        int importQuantity = Integer.parseInt(request.getParameter("import_quantity"));

        // Tạo đối tượng MaterialDAO để tương tác với cơ sở dữ liệu
        MaterialDAO materialDAO = new MaterialDAO();

        // Lấy material_id từ tên vật tư
        int materialId = materialDAO.getMaterialIdByName(materialName);

        if (materialId == -1) {
        	response.getWriter().println("<script>alert('Vật tư không tồn tại.'); history.back();</script>");
            return;
        }

        // Nhập kho
        boolean success = materialDAO.importMaterial(materialId, importName, importDate, importReceiver, importPhone, importDepartment, importQuantity);

        // Kiểm tra kết quả
        response.setContentType("text/html;charset=UTF-8");
        if (success) {
        	 response.getWriter().println("<script>alert('Nhập vào kho thành công!'); window.location.href = 'Kho_admin';</script>");
        } else {
        	response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }	
	}

}
