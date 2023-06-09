<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL이란?</h1>
	
	<p>
		JSP(Java Server Page) Standard Tag Library의 약자로 JSP에서 사용하는 커스텀 액션 태그<br>
		공통적으로 사용하는 코드들의 집합을 보다 쉽게 사용할 수 있도록 태그화해서 표준으로 제공하는 라이브러리
	</p>
	
	<hr>
	
	<h3>* 라이브러리 다운로드 후 추가 방법</h3>
	1) https://tomcat.apache.org/download-taglib.cgi        로 접속 <br>
	2) Standard-1.2.5 Jar Files 4개 다 다운로드 
	3) WEB-INF/lib 폴더에 추가

	
	<h3>* JSTL 선언 방법</h3>
	
	<p> 
		JSTL을 사용하고자 하는 JSP페이지 상단에  <br>
		taglib지시어를 사용해서 선언함   <br> <br>
		
		[ 표현법 ]  <br>
		&lt;%@ taglib prefix="접두어" uri="라이브러리 파일상의 uri주소" &gt;
	</p>

	<hr>
	
	<h3>* JSTL 분류</h3>
	
	<h4>1. JSTL Core Library</h4>
	
	<p>
		변수와 조건문, 반복문 등의 로직과 관련된 문법을 제공
	</p>
	
	<a href="01_core.jsp">core library</a>

	<h3>2. JSTL Formatting Library</h3>

	<p>
		숫자, 날짜 및 시간 데이터의 출력형식을 지정할 때 사용하는 문법을 제공
	</p>
	
	<a href="02_formatting.jsp">formatting library</a>



















	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>



























