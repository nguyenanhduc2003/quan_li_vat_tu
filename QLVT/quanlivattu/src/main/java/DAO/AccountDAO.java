package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Account;

public class AccountDAO extends BaseDAO implements Dao<Account> {

    // Lấy tất cả tài khoản
    @Override
    public List<Account> getAll() {
    	List<Account> accounts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblaccount";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("Query executed successfully!");

            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setAccount_name(rs.getString("account_name"));
                account.setAccount_email(rs.getString("account_email"));
                account.setAccount_pass(rs.getString("account_pass"));
                account.setAccount_phone(rs.getString("account_phone"));
                account.setAccount_address(rs.getString("account_address"));
                account.setAccount_birthday(rs.getString("account_birthday"));
                account.setAccount_created_date(rs.getString("account_created_date"));
                account.setAccount_role(rs.getString("account_role"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return accounts;
    }

    // Lấy tài khoản theo ID
    @Override
    public Optional<Account> get(int id) {
        Account account = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblaccount WHERE account_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setAccount_name(rs.getString("account_name"));
                account.setAccount_phone(rs.getString("account_phone"));
                account.setAccount_address(rs.getString("account_address"));
                account.setAccount_birthday(rs.getString("account_birthday"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return Optional.ofNullable(account);
    }

    // Lưu tài khoản mới
    @Override
    public void save(Account account) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "INSERT INTO tblaccount (account_name, account_email, account_phone, account_address, account_birthday) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, account.getAccount_name());
            pstmt.setString(2, account.getAccount_email());
            pstmt.setString(3, account.getAccount_phone());
            pstmt.setString(4, account.getAccount_address());
            pstmt.setString(5, account.getAccount_birthday());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt);
        }
    }

    // Cập nhật tài khoản
    @Override
    public void update(Account account) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "UPDATE tblaccount SET account_name = ?, account_phone = ?, account_address = ?, account_birthday = ? WHERE account_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, account.getAccount_name());
            pstmt.setString(2, account.getAccount_phone());
            pstmt.setString(3, account.getAccount_address());
            pstmt.setString(4, account.getAccount_birthday());
            pstmt.setInt(5, account.getAccount_id());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt);
        }
    }

    // Xóa tài khoản
    @Override
    public void delete(Account account) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "DELETE FROM tblaccount WHERE account_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, account.getAccount_id());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt);
        }
    }
}
