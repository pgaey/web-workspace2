<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너무 신기해 ~~</title>
</head>
<body>

	<h1>* EL(Expression Language) 표현 언어</h1>
	
	<p>
		기존에 사용했던 표현식(출력식) &lt;%= %&gt; <br>
		JSP상에서 표현하고자 하는 값을 \${ name }의 형식으로 표현해서 작성하는 것
	</p>
	
	<h3>1. EL기본구문에 대해서 먼저 배워보자!</h3>
	<a href="/action/el.do">01_EL</a>
	
	<br><br>

	<h3>2. EL의 연산자에 대해서 배워보자!</h3>
	<a href="/action/operation.do">02_EL의 연산자</a>

	<hr>
	
	<!--
		* JSP를 이루는 구성인자
		1. JSP스크립팅 원소 : JSP페이지에서 자바코드를 직접 기술할 수 있게 하는 기술
						예) 스크립틀릿, 표현식, 선언문
		2. 지시어 : JSP페이지 정보에 대한 내용을 포함한다던가, 현재 페이지에 정보를 표현할 때 사용
						예) include지시어 / page지시어 / taglib지시어
		3. JSP 액션 태그 : XML기술을 이용해서 기존의 jsp문법을 확장하는 기술을 제공하는 태그
		
		- 표준 액션 태그(Standard Action Tag)
		: JSP페이지 내에서 바로 사용가능한 태그
		[ 표현법 ]
		&lt;jsp:태그명&gt; &lt;/jsp:태그명&gt;
		=> 모든 태그명앞에  jsp:이라는 접두어가 붙음
		
		
		- 커스텀 액션 태그
		: JSP페이지에서 바로 사용 불가능한 태그(별도의 연동이 필요함, taglib지시어 사용)
		=> 모든 태그명 앞에 jsp : 외의 다른 접두어가 붙음 (종류가 다양)
		=> 제공되고 있는 대표적인 유용한 라이브러리가 있음(JSTL)
	-->
	
	
	<h1>* JSP Action Tag</h1>

	<p>
		XML기술을 이용해서 기존의 JSP문법을 확장하는 태그들!
	</p>
	
	<h3>1. 표준 액션 태그</h3>
	
	<p>
		JSP페이지에서 별도의 라이브러리 연동없이 곧바로 사용이 가능함!(버전 2.0이상!) <br>
	</p>

	<a href="views/2_StandardAction/01_include.jsp">01_jsp:include</a>
	
	
	<br>
	<a href="views/2_StandardAction/02_forward.jsp">02_jsp:forward</a>

	<br>
	
	
	
	<h3>2. 커스텀 액션 태그</h3>
	<a href="views/3_CustomAction/jstl.jsp">JSTL</a>









	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>


















