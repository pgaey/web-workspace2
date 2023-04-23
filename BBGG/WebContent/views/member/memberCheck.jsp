<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<%= contextPath %>/login.me" method="post">
		<select name="grade">
				<option value="1">일반</option>
				<option value="2">판매</option>
				<option value="3">관리</option>
		<select>
	<button type="submit">이동</button>
	
	</form>
	
	
</body>
</html>