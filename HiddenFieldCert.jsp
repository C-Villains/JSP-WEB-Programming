<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*" %>

<%
    String userId = request.getParameter("username");
    String userPw = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 연결 정보
        String jdbcUrl = "jdbc:mysql://localhost:3306/userdb";
        String dbUser = "yeonchan";
        String dbPassword = "loli24pop79!";

        // JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // 회원 정보 조회
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, userPw);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공
            session.setAttribute("userId", userId);
            response.sendRedirect("HiddenFieldLoginChk.jsp");
        } else {
            // 로그인 실패
            String failReason = "Invalid credentials";
            response.sendRedirect("LoginFail.jsp?error=" + failReason);
        }
    } catch (SQLException e) {
        // 데이터베이스 관련 예외 처리
        e.printStackTrace();
        String failReason = "Database error";
        response.sendRedirect("LoginFail.jsp?error=" + failReason);
    } catch (ClassNotFoundException e) {
        // 드라이버 로딩 예외 처리
        e.printStackTrace();
        String failReason = "Driver error";
        response.sendRedirect("LoginFail.jsp?error=" + failReason);
    } finally {
        // 리소스 해제
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
