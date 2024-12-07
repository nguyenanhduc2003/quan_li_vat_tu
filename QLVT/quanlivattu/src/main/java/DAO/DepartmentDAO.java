package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Department;

public class DepartmentDAO extends BaseDAO implements Dao<Department> {
	public boolean deleteDepartment(int departmentId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tbldepartment WHERE department_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, departmentId);

	        int rowsAffected = pstmt.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Đóng kết nối
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	
	public int getTotalDepartments() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int totalDepartments = 0;

	    try {
	        conn = getConnection();

	        String sql = "SELECT COUNT(*) AS total FROM tbldepartment";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            totalDepartments = rs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return totalDepartments;
	}

	// Phương thức thêm phòng ban
	public boolean addDepartment(Department department) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        String sql = "INSERT INTO tbldepartment (department_id, department_name, department_unit, department_specialized) "
	                   + "VALUES (?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, department.getDepartment_id());
	        pstmt.setString(2, department.getDepartment_name());
	        pstmt.setString(3, department.getDepartment_unit());
	        pstmt.setString(4, department.getDepartment_specialized());

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            isInserted = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt);
	    }

	    return isInserted;
	}

	
	public boolean updateDepartment(Department department) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "UPDATE tbldepartment SET department_name = ?, department_unit = ?, department_specialized = ? WHERE department_id = ?";
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, department.getDepartment_name());
	        pstmt.setString(2, department.getDepartment_unit());
	        pstmt.setString(3, department.getDepartment_specialized());
	        pstmt.setInt(4, department.getDepartment_id());

	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        closeResources(conn, pstmt, null);
	    }
	}


	@Override
	public List<Department> getAll() {
		List<Department> departments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tbldepartment";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
            	Department department = new Department();
            	department.setDepartment_id(rs.getInt("department_id"));
            	department.setDepartment_name(rs.getString("department_name"));
            	department.setDepartment_unit(rs.getString("department_unit"));
            	department.setDepartment_specialized(rs.getString("department_specialized"));
            	departments.add(department);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return departments;
	}

	@Override
	public Optional<Department> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Department t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Department t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Department t) {
		// TODO Auto-generated method stub
		
	}

}
