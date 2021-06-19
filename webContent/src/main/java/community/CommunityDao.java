package community;

import java.sql.*;
import java.util.ArrayList;

public class CommunityDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommunityDao(){
		try {
			String dbURL="jdbc:mysql://localhost:3300/community";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL="SELECT ID FROM community ORDER BY ID DESC";
		try {
			PreparedStatement pstmt=con.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public String getDate() {
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt=con.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	
	
	public int write(String Title,String Content) {
		String SQL="INSERT INTO community VALUES(?,?,?,?)";
		try {
			PreparedStatement pstmt=con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());//게시판 번호 : "SELECT ID FROM community ORDER BY ID DESC" 쿼리날린결과
			pstmt.setString(2, Title);
			pstmt.setString(3, Content);
			pstmt.setString(4, getDate());//시간날짜 : "SELECT NOW()"쿼리 날린 결과
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public ArrayList<Community> getList() {
		String SQL = "SELECT * FROM community";
		ArrayList<Community> list = new ArrayList<Community>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Community c = new Community();
				c.setID(rs.getInt(1));
				c.setTitle(rs.getString(2));
				c.setContent(rs.getString(3));
				c.setDate(rs.getString(4));
				
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public Community getCommunity(int ID) {
		String SQL = "SELECT * FROM community WHERE ID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Community c = new Community();
				c.setID(rs.getInt(1));
				c.setTitle(rs.getString(2));
				c.setContent(rs.getString(3));
				c.setDate(rs.getString(4));
			
				return c;
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
}
