package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;

public class Initialization {
	
	private Connection con;
	private ConnectionPool cp;
	
	// cung cấp các phương thức truy cập và thiết lập kết nối với cơ sở dữ liệu 
	
	public Initialization() {
		this.cp = new ConnectionPoolImpl();
		try {
			this.con = this.cp.getConnection("section");
			if(this.con.getAutoCommit())
			{
				this.con.setAutoCommit(false); // chấm dứt chế độ thực thi section
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}


	public Connection getCon() {
		return con;
	}


	public void setCon(Connection con) {
		this.con = con;
	}


	public ConnectionPool getCp() {
		return cp;
	}


	public void setCp(ConnectionPool cp) {
		this.cp = cp;
	}
	
}
