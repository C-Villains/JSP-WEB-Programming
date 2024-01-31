<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*" %>

<%   //SignIn에서 입력받은 값을 get으로 받아옴
    String userId = request.getParameter("username");
    String userPw = request.getParameter("password");
    String userEm = request.getParameter("email");

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
        String sql = "SELECT * FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 이미 존재하는 사용자
            response.sendRedirect("userExists.jsp");
        } else {
            // 신규 사용자 등록
            sql = "INSERT INTO users (username, password,email) VALUES (?, ? ,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            pstmt.setString(2, userPw);
            pstmt.setString(3,userEm);
            pstmt.executeUpdate();

            // 회원가입 성공 시 세션에 사용자 정보 저장
            session.setAttribute("userId", userId);
            response.sendRedirect("LoginSuccess.jsp");
            
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
