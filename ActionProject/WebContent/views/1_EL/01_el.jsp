<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.el.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>EL기본구문</h1>
	
	<h3>1. 기존방식을 이용해서 스크립틀릿과 표현식을 이용해서 각 영역에 담겨있는 값 뽑아서 화면에 출력</h3>
	<%--
	<%
		// requestScope에 담긴 값 뽑기 => classRoom, student
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope에 담긴 값 뽑기 => academy, lecture
		String academy = (String)session.getAttribute("academy");
		Person lecture = (Person)session.getAttribute("lecture");
	%>
	
	<p>
		학원명 : <%= academy %> <br>
		강의장 : <%= classRoom %> <br>
		강사정보 : <%= lecture.getName() %>, <%= lecture.getAge() %>, <%= lecture.getAddress() %> <br>
		
		수강생 정보 <br>
		<ul>
			<li>이름 : <%= student.getName() %></li>
			<li>나이 : <%= student.getAge() %></li>
			<li>주소 : <%= student.getAddress() %></li>
		</ul>
	</p>
	--%>
	<hr>

	<h3>2. EL을 이용해서 보다 쉽게 해당 Scope에 저장된 값들을 출력</h3>
	
	<p>
		EL은 getXXXX(getAttribute, getter메소드들)을 통해 값을 빼올 필요없이 키값만 제시하면 바로 값에 접근 가능<br>
		내부적으로 해당 Scope 영역에 해당 키값에 해당하는 밸류값을 가져올 수 있음<br>
		기본적으로 EL은 JSP내장객체(4가지)를 구분하지 않고 자동적으로 모든 내장객체에서 키값을 검색해서 존재하는 경우 값을 가져옴
	</p>
	
	<p>
		학원명 : ${ academy }  <br>
		강의장 : ${ classRoom } <br>
		강사정보 : ${ lecture.name }, ${ lecture.age }, ${ lecture.address } <br> 
		
		<!-- 
			마치 필드에 직접 접근한 것같은 문법같이 생김
			lecture에 접근했을 때 밸류값이 Person타입 객체임
			해당 Person객체에 각 필드에 값을 출력하고자 한다면 키값.필드명으로 접근(실제로는 직접접근이 안됨 -> 캡슐화 private으로 외부접근을 막았기 때문)
			내부적으로 getter메소드를 찾아서 호출해서 값을 가져오는 구조 ex) .name을 찍으면 getName()을 찾음
			=> 항상 명심해야할 사항 : getter메소드를 꼭 만들자
		-->
		
		수강생 정보
		<ul>
			<li>이름 : ${ student.name }</li>
			<li>나이 : ${ student.age }</li>
			<li>주소 : ${ student.address }</li>
		</ul>
	</p>

	<hr>
	
		출력식으로 없는 키값을 제시한 경우 : &lt;%= aaa %&gt; <!-- 500에러발생 -->
		EL로 없는 키값을 제시하는 경우 : ${ aaa } <br>
	<hr>

	<h3>3. EL사용시 내장 객체들에 저장된 키값이 동일한 경우</h3>
	
	scope키값에 해당하는 밸류 : ${ scope } <br> <!-- request가 찍힘 -->

	<!-- 
		EL구문은 공유범위가 가장 작은 Scope에서부터 해당 키값을 검색함
		page => request => session => application순으로 키값을 찾음
		
		만약에 모든 영역에서 해당 키에 대한 값을 찾지 못했다?? => 아무것도 출력안됨(오류가 안남) -> 안나오면 알아서 다 찾아야함
	-->

	<hr>
	
	<h3>4. 직접 Scope영역을 지정해서 접근하기</h3>
	
	<% pageContext.setAttribute("scope", "page"); %>

	${ scope }를 작성하면 무슨값이 나올까 ? => page(공유범위가 가작 작기 때문) <br><br>
	
	pageScope에 담긴 "scope"키값에 해당하는 값도 뽑고싶고,
	request, session, application에 있는 "scope"키값에 해당하는 값을 다 뽑고싶다 <br>
	
	pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope } <br>
	requestScope에 담긴 값 : ${ requestScope.scope } <br>
	sessionScope에 담긴 값 : ${ sessionScope.scope } <br>
	applicationScope에 담긴 값 : ${ applicationScope.scope } <br>

	Quiz : ${ sessionScope.classRoom } <br>
	
	연산처리순서가 page -> request -> session -> application이기 때문에
	앞에 Scope를 써주는 것이 추가연산작업을 줄일 수 있다.















	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>