<%@ page language="java" contentType="text/html; charset=utf-8" %>

<html>
	<head>
		<title>Hidden Field 방식의 로그인입니다.</title>
	</head>
	<body>
		<form action="HiddenFieldCert.jsp" method="post">
			아이디와 비밀번호를 입력하십시오<hr/>
			<table border="1">
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td align="center">이메일</td>
					<td><input type="email" name="email"/></td>
				</tr>
				
				
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인"/>	</td>
			   </tr>
		</form>
		<form action="SignIn.jsp" method="post">
		     <td colspan="2" align="right"> 
		       <input type="submit" value="회원가입"/></td>
		       </form>
		
		</table>
	</body>
</html>
