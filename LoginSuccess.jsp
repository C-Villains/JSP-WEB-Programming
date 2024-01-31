<%@ page language="java" contentType="text/html; charset=utf-8" %>

<%
    String userId = (String) session.getAttribute("userId");
%>

<html>
    <head>
        <title>Hidden Field 방식을 이용한 세션관리 - 로그인 성공</title>
    </head>
    <body>
        <h2>로그인 성공!</h2>
        <p>안녕하세요, <%= userId %>님!</p>
        <a href="Logout.jsp">로그아웃</a>
    </body>
</html>