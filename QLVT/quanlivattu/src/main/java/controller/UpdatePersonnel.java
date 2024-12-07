package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PersonnelDAO;
import model.Personnel;

/**
 * Servlet implementation class UpdatePersonnel
 */
@WebServlet("/UpdatePersonnel")
public class UpdatePersonnel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonnelDAO personnelDAO = new PersonnelDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePersonnel() {
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
            int personnelId = Integer.parseInt(request.getParameter("personnel_id1"));
            String personnelName = request.getParameter("personnel_name1");
            String personnelGender = request.getParameter("personnel_gender1");
            String personnelBirthday = request.getParameter("personnel_birthday1");
            String personnelPhone = request.getParameter("personnel_phone1");
            String personnelAddress = request.getParameter("personnel_address1");
            int departmentId = Integer.parseInt(request.getParameter("department_id11"));

            // Tạo đối tượng Personnel để cập nhật
            Personnel personnel = new Personnel();
            personnel.setPersonnel_id(personnelId);
            personnel.setPersonnel_name(personnelName);
            personnel.setPersonnel_gender(personnelGender);
            personnel.setPersonnel_birthday(personnelBirthday);
            personnel.setPersonnel_phone(personnelPhone);
            personnel.setPersonnel_address(personnelAddress);
            personnel.setDepartment_id(departmentId);

            // Gọi DAO để cập nhật
            boolean isUpdated = personnelDAO.updatePersonnel(personnel);

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
