package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Material;

public class MaterialDAO extends BaseDAO implements Dao<Material>{	
	public List<Material> getAllMaterialsWithStatistics() {
	    List<Material> materials = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = getConnection();
	        String sql = "SELECT material_name, stock_quantity, total_imported, total_exported, unit FROM tblmaterial";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Material material = new Material();
	            material.setMaterial_name(rs.getString("material_name"));
	            material.setStock_quantity(rs.getInt("stock_quantity"));
	            material.setTotal_imported(rs.getInt("total_imported"));
	            material.setTotal_exported(rs.getInt("total_exported"));
	            material.setUnit(rs.getString("unit"));
	            materials.add(material);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return materials;
	}

	public boolean updateStock(String materialName, int newStock) {
	    String sql = "UPDATE tblmaterial SET material_quantity = ? WHERE material_name = ?";
	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, newStock);
	        ps.setString(2, materialName);
	        int result = ps.executeUpdate();
	        return result > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}


	public int getStockByMaterialName(String materialName) {
	    String sql = "SELECT material_quantity FROM tblmaterial WHERE material_name = ?";
	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, materialName);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("material_quantity");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return 0; 
	}


	// Phương thức lấy danh sách vật tư từ cơ sở dữ liệu
    public List<Material> getAllMaterials() {
        List<Material> materials = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT material_id, material_name FROM tblmaterial"; // Lấy material_id và material_name
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Material material = new Material();
                material.setMaterial_id(rs.getInt("material_id"));
                material.setMaterial_name(rs.getString("material_name"));
                materials.add(material);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return materials;
    }
	// Thực hiện xuất kho từ tblexport và cập nhật số lượng vật tư trong tblmaterial
		public boolean exportMaterial(int materialId, String exportName, String exportDate, String exportReceiver, String exportPhone, String exportDepartment, int exportQuantity) {
		    Connection conn = null;
		    PreparedStatement pstmtExport = null;
		    PreparedStatement pstmtUpdate = null;
		    boolean success = false;

		    try {
		        conn = getConnection();
		        conn.setAutoCommit(false); // Bắt đầu giao dịch

		        // Chèn phiếu xuất kho vào tblexport
		        String sqlExport = "INSERT INTO tblexport (export_name, export_date, export_receiver, export_phone, export_department, export_quantity, material_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
		        pstmtExport = conn.prepareStatement(sqlExport);
		        pstmtExport.setString(1, exportName);
		        pstmtExport.setString(2, exportDate);
		        pstmtExport.setString(3, exportReceiver);
		        pstmtExport.setString(4, exportPhone);
		        pstmtExport.setString(5, exportDepartment);
		        pstmtExport.setInt(6, exportQuantity);
		        pstmtExport.setInt(7, materialId);
		        pstmtExport.executeUpdate();

		        // Cập nhật số lượng vật tư trong tblmaterial
		        String sqlUpdate = "UPDATE tblmaterial SET material_quantity = material_quantity - ? WHERE material_id = ?";
		        pstmtUpdate = conn.prepareStatement(sqlUpdate);
		        pstmtUpdate.setInt(1, exportQuantity);
		        pstmtUpdate.setInt(2, materialId);
		        pstmtUpdate.executeUpdate();

		        conn.commit(); // Xác nhận giao dịch
		        success = true; // Thành công
		    } catch (SQLException e) {
		        try {
		            if (conn != null) {
		                conn.rollback(); // Nếu có lỗi, hoàn tác giao dịch
		            }
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		        e.printStackTrace();
		    } finally {
		        try {
		            if (conn != null) {
		                conn.setAutoCommit(true); // Quay lại chế độ commit tự động
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        closeResources(conn, pstmtExport, null);
		        closeResources(null, pstmtUpdate, null);
		    }

		    return success;
		}
	// Thực hiện nhập kho vào tblimport và cập nhật số lượng vật tư trong tblmaterial
		public boolean importMaterial(int materialId, String importName, String importDate, String importReceiver, String importPhone, String importDepartment, int importQuantity) {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    try {
		        conn = getConnection();
		        String sql = "INSERT INTO tblimport (import_name, import_date, import_receiver, import_phone, import_department, import_quantity, material_id) " +
		                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, importName);
		        pstmt.setString(2, importDate);
		        pstmt.setString(3, importReceiver);
		        pstmt.setString(4, importPhone);
		        pstmt.setString(5, importDepartment);
		        pstmt.setInt(6, importQuantity);
		        pstmt.setInt(7, materialId);

		        int rowsAffected = pstmt.executeUpdate();
		        return rowsAffected > 0;
		    } catch (SQLException e) {
		        System.out.println("SQL Error: " + e.getMessage());
		        e.printStackTrace();
		        return false;
		    } finally {
		        try {
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		}


	// Lấy material_id từ tên vật tư
	public int getMaterialIdByName(String materialName) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int materialId = -1; // Mặc định trả về -1 nếu không tìm thấy vật tư

	    try {
	        conn = getConnection();
	        String sql = "SELECT material_id FROM tblmaterial WHERE material_name = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, materialName);

	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            materialId = rs.getInt("material_id");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResources(conn, pstmt, rs);
	    }

	    return materialId;
	}

    // Cập nhật số lượng vật tư
    public boolean updateMaterial1(Material material) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isUpdated = false;

        try {
            conn = getConnection();
            String sql = "UPDATE tblmaterial SET material_quantity = ? WHERE material_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, material.getMaterial_quantity());
            pstmt.setInt(2, material.getMaterial_id());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt);
        }

        return isUpdated;
    }
	
	public boolean deleteMaterial(int materialId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "DELETE FROM tblmaterial WHERE material_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, materialId);

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
	
	// Phương thức thêm vật tư
    public boolean addMaterial(Material material) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isInserted = false;

        try {
            conn = getConnection();

            String sql = "INSERT INTO tblmaterial (material_id, material_name, material_describe, material_unit, material_date, material_expiry, material_use, material_supplier, material_country, material_value, material_image, material_quantity) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, material.getMaterial_id());
            pstmt.setString(2, material.getMaterial_name());
            pstmt.setString(3, material.getMaterial_describe());
            pstmt.setString(4, material.getMaterial_unit());
            pstmt.setString(5, material.getMaterial_date());
            pstmt.setString(6, material.getMaterial_expiry());
            pstmt.setString(7, material.getMaterial_use());
            pstmt.setString(8, material.getMaterial_supplier());
            pstmt.setString(9, material.getMaterial_country());
            pstmt.setDouble(10, material.getMaterial_value());
            pstmt.setString(11, material.getMaterial_image());
            pstmt.setInt(12, material.getMaterial_quantity());

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
	
	public int getTotalMaterials() {
	    int total = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // Kiểm tra kết nối cơ sở dữ liệu
	        conn = getConnection();
	        //System.out.println("Kết nối cơ sở dữ liệu thành công");

	        // Câu lệnh SQL đếm số vật tư
	        String sql = "SELECT COUNT(*) AS total FROM tblmaterial";
	        pstmt = conn.prepareStatement(sql);
	        //System.out.println("Câu lệnh SQL: " + sql);
	        
	        // Thực thi câu lệnh SQL
	        rs = pstmt.executeQuery();
	        //System.out.println("Câu lệnh SQL đã được thực thi");

	        // Kiểm tra và lấy dữ liệu từ ResultSet
	        if (rs.next()) {
	            total = rs.getInt("total");
	            System.out.println("Total materials in database: " + total); // In ra kết quả ngay sau khi lấy
	        } else {
	            System.out.println("No data found in tblmaterial");
	        }
	    } catch (SQLException e) {
	        System.out.println("Lỗi SQL: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        // Đảm bảo đóng tài nguyên sau khi xong
	        closeResources(conn, pstmt, rs);
	    }

	    return total;
	}

	@Override
	public List<Material> getAll() {
		
		List<Material> materials = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // Kết nối cơ sở dữ liệu
            String sql = "SELECT * FROM tblmaterial"; // Truy vấn SQL để lấy tất cả vật tư
            pstmt = conn.prepareStatement(sql); // Chuẩn bị câu lệnh SQL
            rs = pstmt.executeQuery(); // Thực thi câu lệnh SQL và nhận kết quả

            System.out.println("Query executed successfully!"); // Đoạn in debug log

            // Duyệt qua các bản ghi trả về từ truy vấn
            while (rs.next()) {
                Material material = new Material();
                material.setMaterial_id(rs.getInt("material_id"));
                material.setMaterial_name(rs.getString("material_name"));
                material.setMaterial_describe(rs.getString("material_describe"));
                material.setMaterial_unit(rs.getString("material_unit"));
                material.setMaterial_date(rs.getString("material_date"));
                material.setMaterial_expiry(rs.getString("material_expiry"));
                material.setMaterial_use(rs.getString("material_use"));
                material.setMaterial_supplier(rs.getString("material_supplier"));
                material.setMaterial_country(rs.getString("material_country"));
                material.setMaterial_value(rs.getDouble("material_value"));
                material.setMaterial_image(rs.getString("material_image"));
                material.setMaterial_quantity(rs.getInt("material_quantity"));

                materials.add(material); // Thêm vật tư vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        } finally {
            closeResources(conn, pstmt, rs); // Đóng kết nối và tài nguyên
        }

        return materials;
		
	}
	
	public boolean updateMaterial(Material material) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = getConnection();
	        String sql = "UPDATE tblmaterial SET material_name = ?, material_describe = ?, material_unit = ?, material_date = ?, material_expiry = ?, material_use = ?, material_supplier = ?, material_country = ?, material_value = ?, material_image = ?, material_quantity = ? WHERE material_id = ?";
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, material.getMaterial_name());
	        pstmt.setString(2, material.getMaterial_describe());
	        pstmt.setString(3, material.getMaterial_unit());
	        pstmt.setString(4, material.getMaterial_date());
	        pstmt.setString(5, material.getMaterial_expiry());
	        pstmt.setString(6, material.getMaterial_use());
	        pstmt.setString(7, material.getMaterial_supplier());
	        pstmt.setString(8, material.getMaterial_country());
	        pstmt.setDouble(9, material.getMaterial_value());
	        pstmt.setString(10, material.getMaterial_image());
	        pstmt.setInt(11, material.getMaterial_quantity());
	        pstmt.setInt(12, material.getMaterial_id());

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
	public Optional<Material> get(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public void save(Material t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Material t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Material t) {
		// TODO Auto-generated method stub
		
	}

	
}
