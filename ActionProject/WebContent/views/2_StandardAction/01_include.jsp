<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>include</h3>
	
	<p>
		또 다른 페이지를 포함할 때 쓰는 방법
	</p>
	
	<h4>1. 기존의 include지시어를 이용한 방법(정적 include방식 == 컴파일 시 포함되는 형태)</h4>
	<%--
	<%@ include file="footer.jsp" %>
	
	<br><br>
	
	특징 : include하고 있는 페이지 상에 선언되어있는 변수를 현재 페이지에서도 사용 가능함 <br>
	
	year : <%= year %> <br><br>
	
	<%
		String year = "2222";		
	%>
	--%>
	
	<hr>
	
	<h4>2. JSP 표준 액션태그를 이용한 방식(동적 include방식 == 런타임 시 포함되는 형태)</h4>
	
	<%--
	<jsp:include page="footer.jsp"></jsp:include>
	혹은
	--%>
	<jsp:include page="footer.jsp" />
	<!-- 
		반~~!!!!드시 시작태그와 종료태그를 같이 써야한다.
		단, 시작태그와 종료태그 사이에 넣을값이 따로 없다면 <시작태그 />로 표현이 가능 / 없으면 큰일남!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	-->
	
	<br><br>
	
	특징 1 : include하고 있는 페이지에서 선언한 변수를 공유하지 않음(즉, 동일한 이름의 변수 선언 가능) <br>
	
	<%
		String year = "2023";
	%>
	
	<br>
	=====================================================================================================================
	<br><br>
	
	특징 2 : 포함 시 include하는 페이지로 값을 전달할 수 있음 <br>
	
	<jsp:include page="footer.jsp">
		<jsp:param value="Hello" name="test" />
	</jsp:include>
	<jsp:include page="footer.jsp">
		<jsp:param value="Bye~" name="test" />
	</jsp:include>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>