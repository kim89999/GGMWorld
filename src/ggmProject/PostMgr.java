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

public class PostMgr {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/ggmw?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "root";
	private final String PASS = "root";
	private PreparedStatement pstmt;
	
	public PostMgr() {
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
    }
	
	
	public boolean insertPost(HttpServletRequest req) { //게시글 등록 메소드
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir =	uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"GGMWorld/WebContent/data";
			MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String query = "insert into post(image, text, date, userid) values(?, ?, now(), ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(2, multi.getParameter("text"));
			pstmt.setString(3, multi.getParameter("userid"));
			
			if (multi.getFilesystemName("image") == null) {
                pstmt.setString(1, "noimage.png");
            } else {
                pstmt.setString(1, multi.getFilesystemName("image"));
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

	public PostBean getPost(String no) { //게시글 출력 메소드
		
		PostBean datas = null;
		pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String query = "select * from post where no='?'";
            pstmt.setString(1, no);
            rs = pstmt.executeQuery(query);
			
			if(rs.next()) {
				PostBean pb = new PostBean();
				pb.setNo(rs.getInt("no"));
				pb.setImage(rs.getString("image"));
				pb.setText(rs.getString("text"));
				pb.setUserid(rs.getString("userid"));
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
	public Vector<PostBean> getPostList() throws SQLException { //게시글 리스트 출력 메소드
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector<PostBean> vlist = new Vector<PostBean>();

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String query = "select * from post order by no desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                PostBean ptBean = new PostBean();
                ptBean.setNo(rs.getInt("no"));
                ptBean.setText(rs.getString("text"));
                ptBean.setDate(rs.getString("date"));
                ptBean.setUserid(rs.getString("userid"));
                ptBean.setImage(rs.getString("image"));
                vlist.add(ptBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
        	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return vlist;
    }
	public boolean updatePost(HttpServletRequest req) throws IOException { //게시글 수정 메소드
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir = this.getClass().getResource("").getPath();
        uploadDir =	uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"GGMWorld/WebContent/data";

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
        	MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
            
            String query = "update post set text=?, image=?  where no = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getFilesystemName("image"));
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
	public boolean deletePost(String no) { //게시글 삭제 메소드
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        	conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
            String query = "delete from post where no=?";
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
