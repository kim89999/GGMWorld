package ggmProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GuestMgr {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/ggmw?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "root";
	private final String PASS = "root";
	private PreparedStatement pstmt;
	
	public GuestMgr() {
		
		/*try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}*/
    }
	
	
	public boolean insertGuest(HttpServletRequest req) { //방명록 등록 메소드
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir =	uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"GGMWorld/WebContent/data";
			MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String query = "insert into guestdm(text, date, userid, todm, image) values(?, now(), ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, multi.getParameter("text"));
			pstmt.setString(2, multi.getParameter("userid"));
			pstmt.setString(3, multi.getParameter("todm"));
			pstmt.setString(4, multi.getFilesystemName("image"));
			if (multi.getParameter("todm") == null) {
                pstmt.setString(1, "noimage.png");
            } else {
                pstmt.setString(4, multi.getFilesystemName("image"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1)
            	result = true;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return result;
	}

	public GuestBean getGuest(String no) { //방명록 출력 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		GuestBean datas = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String query = "select * from guestdm where no='?'";
            pstmt.setString(1, no);
            rs = pstmt.executeQuery(query);
			
			if(rs.next()) {
				GuestBean gb = new GuestBean();
				gb.setNo(rs.getInt("no"));
				gb.setText(rs.getString("text"));
				gb.setUserid(rs.getString("userid"));
				gb.setTodm(rs.getString("todm"));
				gb.setImage(rs.getString("image"));
			}
		} catch (SQLException ex) {
			System.out.println("Exception" + ex);
		}
		finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		}
		return datas;
	}
	public Vector<GuestBean> getGuestList(String td) throws SQLException { //방명록 리스트 출력 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector<GuestBean> vlist = new Vector<GuestBean>();

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String query = "select * from guestdm where todm='" + "?'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, td);
            rs = pstmt.executeQuery(query);

            while (rs.next()) {
            	GuestBean gtBean = new GuestBean();
            	gtBean.setNo(rs.getInt("no"));
            	gtBean.setText(rs.getString("text"));
            	gtBean.setDate(rs.getString("date"));
            	gtBean.setUserid(rs.getString("userid"));
            	gtBean.setTodm(rs.getString("todm"));
            	gtBean.setImage(rs.getString("image"));
                vlist.add(gtBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return vlist;
    }
	public boolean updateGuest(HttpServletRequest req) throws IOException { //방명록 수정 메소드
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir = this.getClass().getResource("").getPath();
        uploadDir =	uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"GGMWorld/WebContent/data";

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
        	MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
            
            String query = "update guestdm set text='?', todm='?' where no = '?'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("text"));
            pstmt.setString(2, multi.getFilesystemName("todm"));
            pstmt.setString(3, multi.getParameter("no"));
            int count = pstmt.executeUpdate();
            if (count == 1) 
            	result = true;
		} catch (SQLException ex) {
			System.out.println("Exception" + ex);
		}
		finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return result;
	}
	public boolean deleteGuest(String no) { //방명록 삭제 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String query = "delete from guestdm where no='?'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
        	System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }
}
