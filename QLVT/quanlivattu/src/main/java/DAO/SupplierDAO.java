package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import model.Supplier;

public class SupplierDAO extends BaseDAO implements Dao<Supplier>{
	
	// thống kê 
		public int getTotalSuppliers() {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    int total = 0;

		    try {
		        conn = getConnection();
		        String sql = "SELECT COUNT(*) AS total FROM tblsupplier";
		        pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            total = rs.getInt("total");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }

		    return total;
		}
	
	 public boolean deleteSupplier(int supplierId) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            conn = getConnection();
	            String sql = "DELETE FROM tblsupplier WHERE supplier_id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, supplierId);

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
	
	// Phương thức thêm nhà cung cấp
	public boolean addSupplier(Supplier supplier) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isInserted = false;

	    try {
	        conn = getConnection();

	        // Câu lệnh SQL để chèn nhà cung cấp mới
	        String sql = "INSERT INTO tblsupplier (supplier_id, supplier_name, supplier_email, supplier_phone, supplier_address, supplier_website, supplier_describe, supplier_date_created) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	        pstmt = conn.prepareStatement(sql);

	        // Gán giá trị từ đối tượng Supplier
	        pstmt.setInt(1, supplier.getSupplier_id());
	        pstmt.setString(2, supplier.getSupplier_name());
	        pstmt.setString(3, supplier.getSupplier_email());
	        pstmt.setString(4, supplier.getSupplier_phone());
	        pstmt.setString(5, supplier.getSupplier_address());
	        pstmt.setString(6, supplier.getSupplier_website());
	        pstmt.setString(7, supplier.getSupplier_describe());
	        pstmt.setString(8, supplier.getSupplier_date_created());

	        // Thực thi câu lệnh SQL
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


	@Override
	public List<Supplier> getAll() {
		
		List<Supplier> suppliers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblsupplier";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
            	Supplier supplier = new Supplier();
            	supplier.setSupplier_id(rs.getInt("supplier_id"));
            	supplier.setSupplier_name(rs.getString("supplier_name"));
            	supplier.setSupplier_email(rs.getString("supplier_email"));
            	supplier.setSupplier_phone(rs.getString("supplier_phone"));
            	supplier.setSupplier_address(rs.getString("supplier_address"));
            	supplier.setSupplier_website(rs.getString("supplier_website"));
            	supplier.setSupplier_describe(rs.getString("supplier_describe"));
            	supplier.setSupplier_date_created(rs.getString("supplier_date_created"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return suppliers;
		
	}

	@Override
	public Optional<Supplier> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Supplier t) {
		// TODO Auto-generated method stub
		
	}

	
}
