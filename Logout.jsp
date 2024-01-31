<%@ page language="java" contentType="text/html; charset=utf-8" %>

<%
    session.invalidate();
%>

<html>
	<head>
		<title>Hidden Field 방식을 이용한 세션관리 - 로그아웃</title>
	</head>
	<body>
		<h2>로그아웃 되었습니다.</h2>
		<a href="HiddenFieldLogin.jsp">다시 로그인</a>
	</body>
</html>