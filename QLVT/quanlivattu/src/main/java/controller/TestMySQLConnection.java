package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestMySQLConnection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/quanlivattu?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "quanlivattu_ducna";
        String password = "@123$%65";
        
        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Kết nối MySQL thành công!");
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối MySQL: " + e.getMessage());
        }
    }
}
