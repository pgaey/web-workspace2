<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>1. formatNumber 태그</h1>
	
	<p>
		숫자형 데이터의 포맷(형식)을 지정 <br>
		- 표현하고자 하는 숫자 데이터의 형식을 통화기로, %등 원하는 쓰임에 맞게 지정하는 태그 <br><br>
		
		[ 표현법  ]
		
		&lt; fmt:formatNumber value="출력한값" groupingUsed="true/false" type="percent/currency" currencySymbol="$" &gt; <br>
		
		(groupingUsed, type, currencySymbol 생략 가능!)
	</p>
	
	<!-- 테스트할 변수 -->
	
	<!-- 
		- Missing end tag : 태그를 닫지 않아서 생기는 문제
		- Unknown tag : 라이브러리 선언을 안해서 발생하는 문제!(taglib지시어를 사용!)
	-->
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.45" />
	<c:set var="num3" value="50000" />
	
	
	num1의 경우 <br>
	그냥 출력 : ${ num1 } <br>
	세 자리마다 구분해서 출력 : <fmt:formatNumber value="${num1}" /> <br> <!-- 123,456,789 -->
	숫자 그대로 출력 : <fmt:formatNumber value="${ num1 }" groupingUsed="false" /> <br><br>
	
	<!-- 
		groupingUsed속성 : 3자리마다 , 로 구분해주는 속성 생략 가능(기본값은 true) 
	-->

	num2의 경우 <br>
	percent : <fmt:formatNumber value="${ num2 }" type="percent" /> <br><br>
	
	num3의 경우 <br>
	currency : <fmt:formatNumber value="${ num3 }" type="currency" currencySymbol="$" /> <br><br>

	<!-- 
		type "currency" : 통화(돈) 단위로 보여짐 현재 내가 사용하고 있는 로컬 운영체제의 정보에 따라서 단위가 정해짐
		currencySymbol : 통화기호 문자의 종류를 지정하는 속성
	-->
	
	
	<hr>
	
	
	<h3>2. formatDate</h3>

	<p>
		날짜 및 시간 데이터의 포맷(형식)을 지정 <br>
		단, java.util.Date클래스의 객체를 이용해야만 한다. <br>
	</p>
	
	<!-- 테스트할 변수 만들기 -->
	
	<c:set var="current" value="<%= new java.util.Date() %>"/>
	
	current 그냥 출력 : ${ current } <br>

	<ul>
		<li>
			현재 날짜 : <fmt:formatDate value="${ current }" type="date" />
		</li>
		<li>
			현재 시간 : <fmt:formatDate value="${ current }" type="time" />	
		</li>
		<li>
			현재 날짜와 시간 : <fmt:formatDate value="${ current }" type="both" />
		</li>
		<li>
			long : <fmt:formatDate value="${ current }" type="both" dateStyle="long" timeStyle="long" />
		</li>
		<li>
			full : <fmt:formatDate value="${ current }" type="both" dateStyle="full" timeStyle="full" />
		</li>
		<li>
			short : <fmt:formatDate value="${ current }" type="both" dateStyle="short" timeStyle="short" />
		</li>
		<li>
			customizing : <fmt:formatDate value="${ current }" type="both" pattern="yyyy-MM-dd(E) a HH:mm:ss" />
		</li>
	</ul>

<!-- 


	날짜 시간형식 지정할 고려할 점
	반드시 dateStyle이랑 timeStyle이랑 맞춰야하는건 아님
	- pattern속성을 이용해서 디테일하게 지정할 수 있음
	
	yyyy : 4자리 년도
	MM : 2자리 월수
	dd : 2자리 일수
	
	E : 요일
	a : 오전 / 오후
	
	HH : 2자리 시간
	mm : 2자리 분
	ss : 2자리 초
	
	
-->












	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>