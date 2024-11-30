package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import model.Account;
import model.Material;

public class MaterialDAO extends BaseDAO implements Dao<Material>{
	
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
