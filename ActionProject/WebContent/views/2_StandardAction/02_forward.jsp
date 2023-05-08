<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>여기는 02_forward.jsp페이지야 ~ </h1>

	<!-- 
		
		url로는 http://localhost:8001/action/views/2_StandardAction/02_forward.jsp 찍혀있음
		
		jsp:forward 화면을 전환시켜주는 태그!! 특성상 url은 그대로고 화면만 바뀐다.
	-->


	<jsp:forward page="footer.jsp" />







</body>
</html>