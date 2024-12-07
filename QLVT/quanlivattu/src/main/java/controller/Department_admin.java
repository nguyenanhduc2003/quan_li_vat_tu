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
import DAO.PersonnelDAO;
import model.Department;
import model.Personnel;

/**
 * Servlet implementation class Department
 */
@WebServlet("/Department_admin")
public class Department_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DepartmentDAO departmentDAO = new DepartmentDAO();
	private PersonnelDAO personnelDAO = new PersonnelDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Department_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
		
		List<Department> departments = departmentDAO.getAll();
		List<Personnel> personnels = personnelDAO.getAll();
		int totalDepartments = departmentDAO.getTotalDepartments();
		int totalPersonnel = personnelDAO.getTotalPersonnel();
		
		
        request.setAttribute("departments", departments);
        request.setAttribute("personnels", personnels);
        request.setAttribute("totalDepartments", totalDepartments);
        request.setAttribute("totalPersonnel", totalPersonnel);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("phongban.jsp");
        dispatcher.forward(request, response);
		} catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Có lỗi xảy ra. Vui lòng thử lại sau.'); history.back();</script>");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try {
		        // Lấy dữ liệu từ form
		        int departmentId = Integer.parseInt(request.getParameter("department_id"));
		        String departmentName = request.getParameter("department_name");
		        String departmentUnit = request.getParameter("department_unit");
		        String departmentSpecialized = request.getParameter("department_specialized");
		        

		        // Tạo đối tượng Department
		        Department department = new Department();
		        department.setDepartment_id(departmentId);
		        department.setDepartment_name(departmentName);
		        department.setDepartment_unit(departmentUnit);
		        department.setDepartment_specialized(departmentSpecialized);
		        

		        // Thêm phòng ban vào cơ sở dữ liệu
		        boolean isAdded = departmentDAO.addDepartment(department);

		        // Xử lý kết quả
		        response.setContentType("text/html;charset=UTF-8");
		        if (isAdded) {
		            response.getWriter().println("<script>alert('Thêm phòng ban thành công!'); window.location.href = 'Department_admin';</script>");
		        } 
		        else {
		            response.getWriter().println("<script>alert('Thêm phòng ban thất bại, vui lòng thử lại.'); history.back();</script>");
		        }
		    } catch (NumberFormatException | IOException e) {
		        e.printStackTrace();
		        response.setContentType("text/html;charset=UTF-8");
		        response.getWriter().println("<script>alert('Có lỗi xảy ra trong quá trình xử lý dữ liệu. Vui lòng thử lại sau.'); history.back();</script>");
		    }
		 
	}

}
