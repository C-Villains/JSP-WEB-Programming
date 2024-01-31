 <%@ page language="java" contentType="text/html; charset=utf-8" %>

<html>
	<head>
		<title>Hidden Field 방식을 이용한 세션관리</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			String id = request.getParameter("username");
			String pw = request.getParameter("password");
			String em = request.getParameter("email");
			String grade;
			String grade_name;
		%>
		<%
			if ( id==null || pw == null || id.trim().equals("") || pw.trim().equals("") || em.trim().equals("") ){
				grade = "guest";
				grade_name = "손님";
				id = "";
				pw = "";
				em = "";
		%>
				<h3>[<%=grade_name %>]으로 접속하셨습니다. 환영합니다!</h3>
		<%				
			} else if (id.trim().equals("admin") ){
				grade = "admin";
				grade_name = "관리자";
		%>
				<h3>[<%=id %>]님은 [<%=grade_name %>] 권한으로 접속하셨습니다. 환영합니다!</h3>
		<%			
			} else {
				grade = "member";
				grade_name = "회원";
		%>
				<h3>[<%=id %>]님은 [<%=grade_name %>] 권한으로 접속하셨습니다. 환영합니다!</h3>
		<%			
			}
		%> <hr/>
		<form action="HiddenFieldMenu.jsp" method="post">
			<input type="hidden" name="id" value="<%= id%>"/>
			<input type="hidden" name="pw" value="<%= pw%>"/>
			<input type="hidden" name="grade" value="<%= grade%>"/>
			<input type="hidden" name="grade_name" value="<%= grade_name%>"/>
			<input type="submit" value="사용가능 메뉴 확인"/>					
		</form>
	</body>
</html>
