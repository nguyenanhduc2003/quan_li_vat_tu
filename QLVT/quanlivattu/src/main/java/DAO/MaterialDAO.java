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

            String sql = "INSERT INTO tblmaterial (material_id, material_name, material_describe, material_unit, material_date, material_expiry, material_use, material_supplier, material_country, material_value, material_image) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
	        String sql = "UPDATE tblmaterial SET material_name = ?, material_describe = ?, material_unit = ?, material_date = ?, material_expiry = ?, material_use = ?, material_supplier = ?, material_country = ?, material_value = ?, material_image = ? WHERE material_id = ?";
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
	        pstmt.setInt(11, material.getMaterial_id());

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
