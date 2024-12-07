package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DepartmentDAO;
import model.Department;

/**
 * Servlet implementation class UpdateDepartment
 */
@WebServlet("/UpdateDepartment")
public class UpdateDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DepartmentDAO departmentDAO = new DepartmentDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDepartment() {
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
		
		try {
			request.setCharacterEncoding("UTF-8");

		    // Lấy dữ liệu từ form
		    int departmentId = Integer.parseInt(request.getParameter("department_id1"));
		    String departmentName = request.getParameter("department_name1");
		    String departmentUnit = request.getParameter("department_unit1");
		    String departmentSpecialized = request.getParameter("department_specialized1");

		    // Tạo đối tượng Department để cập nhật
		    Department department = new Department();
		    department.setDepartment_id(departmentId);
		    department.setDepartment_name(departmentName);
		    department.setDepartment_unit(departmentUnit);
		    department.setDepartment_specialized(departmentSpecialized);

		    // Thực hiện cập nhật
		    boolean isUpdated = departmentDAO.updateDepartment(department);

		 // Xử lý kết quả
	        response.setContentType("text/html;charset=UTF-8");
	        if (isUpdated) {
	            response.getWriter().println("<script>alert('Cập nhật thành công!'); window.location.href = 'Department_admin';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Cập nhật thất bại, vui lòng thử lại.'); history.back();</script>");
	        }
			
		} catch (NumberFormatException | IOException e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
        }

	}

}
