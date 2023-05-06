package ggmProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class RegisterGGM {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/ggmw?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "root";
	private final String PASS = "root";
	
	public RegisterGGM() { //생성자
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}
	public void insertMember(RegisterBean mem) { //회원가입 메소드
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement("insert into accounts values (?, ?, ?, ?, ?)");
			pstmt.setString(1, mem.getName());
			pstmt.setString(2, mem.getId());
			pstmt.setString(3, mem.getPw());
			pstmt.setString(4, mem.getPwc());
			pstmt.setString(5, mem.getEmail());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return;
	}
	public String viewMember(String i) { //로그인 확인 메소드
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String pw = null;
		
		try {
			String query = "select * from accounts where USERID = '"+ i +"'";
			
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				pw = rs.getString("userpw");

			}
		}catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		}
		return pw;
	}
	public boolean adminCheck(String adminId, String adminPw) { // admin 로그인 확인 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String query = "select adminId, adminPw from admin where adminId = '?' and adminPw = '?'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, adminId);
            pstmt.setString(2, adminPw);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
        	System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return loginCon;
    }
	public Vector<RegisterBean> getDBList() { // 등록된 유저리스트 확인 메소드
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector<RegisterBean> vecList = new Vector<RegisterBean>();

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String strQuery = "select * from accounts";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setId(rs.getString("userid"));
                regBean.setPw(rs.getString("userpw"));
                regBean.setName(rs.getString("name"));
                regBean.setEmail(rs.getString("email"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return vecList;
    }
	public RegisterBean getDB(String mem_id) { // 등록된 유저 확인 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String strQuery = "select * from accounts where userid='?'";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new RegisterBean();
                regBean.setId(rs.getString("userid"));
                regBean.setPw(rs.getString("userpw"));
                regBean.setName(rs.getString("name"));
                regBean.setEmail(rs.getString("email"));

            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return regBean;
    }
	public boolean memberUpdate(RegisterBean regBean) { // 등록된 유저 수정 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String strQuery = "update accounts set userpw='?', name=?, email='?' where userid='?' ";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getPw());
            pstmt.setString(2, regBean.getName());
            pstmt.setString(3, regBean.getEmail());
            pstmt.setString(4, regBean.getId());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return flag;
    }
	public boolean DeleteDB(String id) { //DB삭제 메소드
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			String query ="delete from accounts where userid='?'";
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("Exception" + ex);
			return false;
		}
		finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return true;
	}
}
