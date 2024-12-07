package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Personnel;

public class PersonnelDAO extends BaseDAO implements Dao<Personnel> {
	public boolean deletePersonnel(int personnelId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tblpersonnel WHERE personnel_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, personnelId);

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

	public int getTotalPersonnel() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int totalPersonnel = 0;

	    try {
	        conn = getConnection();

	        String sql = "SELECT COUNT(*) AS total FROM tblpersonnel";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            totalPersonnel = rs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return totalPersonnel;
	}

	// Phương thức thêm nhân sự
	public boolean addPersonnel(Personnel personnel) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        String sql = "INSERT INTO tblpersonnel (personnel_id, personnel_name, personnel_gender, personnel_birthday, personnel_phone, personnel_address, department_id) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, personnel.getPersonnel_id());
	        pstmt.setString(2, personnel.getPersonnel_name());
	        pstmt.setString(3, personnel.getPersonnel_gender());
	        pstmt.setString(4, personnel.getPersonnel_birthday());
	        pstmt.setString(5, personnel.getPersonnel_phone());
	        pstmt.setString(6, personnel.getPersonnel_address());
	        pstmt.setInt(7, personnel.getDepartment_id());

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

	
	public boolean updatePersonnel(Personnel personnel) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        // Kết nối đến cơ sở dữ liệu
	        conn = getConnection();
	        // Câu lệnh SQL cập nhật thông tin nhân sự
	        String sql = "UPDATE tblpersonnel SET personnel_name = ?, personnel_gender = ?, personnel_birthday = ?, personnel_phone = ?, personnel_address = ?, department_id = ? WHERE personnel_id = ?";
	        pstmt = conn.prepareStatement(sql);

	        // Thiết lập các tham số cho câu lệnh SQL
	        pstmt.setString(1, personnel.getPersonnel_name());
	        pstmt.setString(2, personnel.getPersonnel_gender());
	        pstmt.setString(3, personnel.getPersonnel_birthday());
	        pstmt.setString(4, personnel.getPersonnel_phone());
	        pstmt.setString(5, personnel.getPersonnel_address());
	        pstmt.setInt(6, personnel.getDepartment_id());
	        pstmt.setInt(7, personnel.getPersonnel_id());

	        // Thực hiện cập nhật và kiểm tra kết quả
	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Đóng các tài nguyên
	        closeResources(conn, pstmt, null);
	    }
	}


	@Override
	public List<Personnel> getAll() {
		List<Personnel> personnels = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblpersonnel";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
            	Personnel personnel = new Personnel();
            	personnel.setPersonnel_id(rs.getInt("personnel_id"));
            	personnel.setPersonnel_name(rs.getString("personnel_name"));
            	personnel.setPersonnel_gender(rs.getString("personnel_gender"));
            	personnel.setPersonnel_birthday(rs.getString("personnel_birthday"));
            	personnel.setPersonnel_phone(rs.getString("personnel_phone"));
            	personnel.setPersonnel_address(rs.getString("personnel_address"));
            	personnel.setDepartment_id(rs.getInt("department_id"));
            	personnels.add(personnel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return personnels;
	}

	@Override
	public Optional<Personnel> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Personnel t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Personnel t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Personnel t) {
		// TODO Auto-generated method stub
		
	}

}
