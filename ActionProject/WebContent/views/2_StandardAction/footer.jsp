<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// Date 객체 -> new Date() 하면 오늘 날짜나옴
		// 오늘날짜 기준으로 년도만 뽑아야지!
		// SimpleDateFormat객체를 이용해서 !
		
		String year = new SimpleDateFormat("yyyy").format(new Date());
	%>

	Copyright © 1998-<%= year %> KH Information Educational Institute All Right Reserved

	<br>
	
	01_include.jsp로부터  전달받은 test라는 키값의 value값을 출력
	
	test : ${ param.test }
	
</body>
</html>