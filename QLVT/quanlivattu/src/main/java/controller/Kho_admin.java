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

        // Lấy danh sách phiếu nhập từ cơ sở dữ liệu
        List<Import> importts = importDAO.getAll(); // Lấy tất cả phiếu nhập
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
        
        // Đưa danh sách phiếu nhập vào request để gửi đến JSP
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
