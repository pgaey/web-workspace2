<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와 ! 정말 중요하다 !!</title>
</head>
<body>

	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == attribute)</h3>
	
	<pre>
		* 변수 선언(&lt; c:set var="변수명" value="리터럴" scope="스코프영역지정(생략가능)" / &gt;)
		- 변수를 선언하고 초기값을 대입해두는 기능을 제공
		- 해당 변수를 어떤 scope영역에 담아갈건지 지정 가능(생략 시 pageScope에 담김)		
		
		=> 해당 scope영역에 setAttribute메소드를 이용해서 key + value형태로 데이터를 담아둔다라고 생각하면 됨 
		=> c:set을 통해 선언된 변수는 EL로 접근해서 사용 (스크립팅 원소로는 접근 불가능)
		
		* 주의사항
		- 변수의 타입을 별도로 지정하지 않음
		- 반드시 해당 변수에 담아두고자 하는 값(value속성에 담길 리터럴)을 무조건 세팅해야함(즉, 선언과 동시에 초기화)
	</pre>
	
	<c:set var="num1" value="10" /> <!-- pageScope에 담김 pageContext.setAttribute("num1", 10); -->
	<c:set var="num2" value="20" scope="request" /><!-- request.setAttribute("num2", 10); -->

	num1의 변수값 : ${ num1 } <br>
	num2의 변수값 : ${ num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope="session" /> <!-- sessionScope에 담김 -->

	result : 변수값 : ${ result } <br>
	
	<!-- 
		EL구문 사용시 키값만 제시하면 공유범위가 작은 곳에서부터 찾음
		(스코프영역.키값을 권장)
	-->
	
	${ pageScope.num1 } <br>
	${ requestScope.num2 } <br>
	${ sessionScope.result } <br>
	
	<c:set var="result" scope="request">9999</c:set>
	<!-- value속성 말고 시작태그와 종료태그 사이에도 대입할 값을 기술 가능 -->
	
	${ requestScope.result } <br>

	<hr>
	
	<pre>
		* 변수삭제(&lt; c:remove var="제거하고자하는 변수명" scope="스코프영역지정(생략가능)" /&gt;)
		- 해당 변수를 scope에서 찾아서 제거하는 태그 
		- scope 지정 생략 시 모든 scope에서 해당 변수를 다 찾아서 제거함
		=> .removeAttribute("키값"); 요거 이요해서 제거하는 것과 비슷하다고 생각하면 됨
	</pre>

	삭제 전 result : ${ result } <br>
	
	1) 특정 scope를 지정해서 삭제 <br>
	<c:remove var="result" scope="request" />
	request에서 삭제 후 result : ${ result } <br>

	2) 모든 scope에서 삭제 <br>
	<c:remove var="result" />
	모든 scope에서 삭제 후 result : ${ result } <br>

	<hr>
	
	<pre>
		* 변수 출력(&lt; c:out value="출력하고자하는 값" default="기본값(생략가능)" escapeXml="true(기본값, 생략가능)" /&gt;)
		- 데이터를 출력하려고 할 때 사용하는 태그
		- default : 기본값, value 속성에 출력하려는 값이 없을 경우 대체해서 기본값으로 출력할 내용물을 기술가능(생략가능)
	</pre>
	
	result를 EL구문으로 출력 : ${ result }<br>
	result를 c:out으로 출력 : <c:out value="${ result }" /> <br>
	result를 c:out으로 출력할건데 default를 지정해서 출력 : <c:out value="${ result }" default="값이 없음" /> <br><br>

	<!-- escapeXml 테스트 -->
	<!-- 테스트를 하기 위한 변수 선언 -->
	<c:set var="outTest" value="<b>출력테스트</b>" />

	outTest를 c:out으로 출력할건데 : <c:out value="${ outTest }" /> <br>
	outTest를 c:out으로 출력할건데 escapeXml속성을 false로 지정해서 출력 : <c:out value="${ outTest }" escapeXml="false" />
	
	<hr>

	<h3>2. 조건문 - if(&lt; c:if test="조건식"&gt; 조건이 true일 경우 실행할 내용 &lt;/c:if&gt;)</h3>

	<pre>
		- JAVA의 단일 if문과 비슷한 역할을 하는 태그
		- 조건식은 test라는 속성에 작성(************************************** 조건을 작성할 경우 반.드.시 EL구문으로 작성해야함)
	
	</pre>

	<%--
	기존방식
	<% if(조건식) { %>	
		어쩌고저쩌고
	<% } %>
	--%>
	
	<c:if test="${ num1 gt num2 }">
		<b>num1이 num2보다 큽니다.</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if> 

	<br>
	
	<%--
		<% if(str.equals("안녕하세요")) { %>
			어쩌고 저쩌고~~~
		<% } %>
	--%>
	
	<c:set var = "str" value="안녕하세요" />
	
	<c:if test="${ str eq '안녕하세요' }">
		<mark>안녕못해~</mark>		
	</c:if>
	
	<br>
	
	
	<h3>3. 조건문 - choose, when, otherwise</h3>
	
	
	<pre>
		[ 표현법 ]
		
		&lt; c:choose &gt;
			&lt; c:when test="조건1" &gt; ~~~~ &lt; /c:when &gt;
			&lt; c:when test="조건2" &gt; ~~~~ &lt; /c:when &gt;
			...
			&lt; c:otherwise &gt; ~~~~ &lt; /c:otherwise &gt; => else블록 / switch문의 default
		&lt; /c:choose &gt;
		
		- JAVA의 if-else, switch문과 비슷한 역할을 하는 태그
		- 각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성
		- c:otherwise에는 조건을 적어주지 않음
	</pre>

	<%--
	<% if(조건1) { %>

	<% } else if(조건2) { %>

	<% } else { %>
	--%>
	
	<c:choose>
		<c:when test="${ num1 eq 20 }"> <!-- if블럭 -->
			<b>num1은 20이다</b>
		</c:when>
		<c:when test="${ num1 eq 15 }"> <!-- else if블럭 -->
			<b>num1은 15이다</b>
		</c:when>
		<c:otherwise>
			<b>나는 조건이 없어~</b> <!-- else블럭 -->
		</c:otherwise>
	</c:choose>

	<!-- choose태그가 가질 수 있는 요소는 오로지 when / otherwise뿐!! 주석을 포함한 그 어떤 것도 절대 못들어감!!!!!!!!!!!!!!! choose안에 있는 when이나 otherwise에는 가능 -->


	<hr>

	<h3>4. 반복문 - forEach</h3>
	
	<pre>
		[ 표현법 ]
		for loop문
		&lt; c:forEach var="변수명" begin="초기값" end="끝값" step="증가시킬값(생략 가능)" &gt;
			반복적으로 실핼할 코드
		&lt; /c:forEach &gt;
		=> step 생략 시 기본값은 1
		
		향상된 for문
		&lt; c:forEach var="변수명" items="순차적으로 접근할 배열명 또는 컬렉션명" &gt;
			반복적으로 실행할 코드
		&lt; /c:forEach &gt;
		
		var속성으로 선언된 변수에 접근할 때는 반드시 EL구문으로 접근해야 함
		
	</pre>
	
	<!-- for loop문 -->
	<%--
		<% for(int i = 1; i <= 10; i++) { %>
			~~~
		<% } %>
	--%>

	<c:forEach var="i" begin="1" end="10">
		반복확인 : ${ i } <br>
	</c:forEach>

	<br>
	
	<!-- i = i + 2 -->

	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${ i } <br>
	</c:forEach>


	<c:forEach var="i" begin="1" end="6">
		<h${i}> 태그 안에도 적용이 가능함! </h${i}>
	</c:forEach>

	
	<!-- 향상된 for문 -->
	<c:set var="colors">
		yellowgreen, orangered, grey, greenyellow, lightpink
	</c:set>
	
	color 값 : ${ colors } <br>
	
	<ul>
		<c:forEach var="c" items="${ colors }">
			<li style="color:${c}">${c}<li>
		</c:forEach>
	</ul>

	<br>


	<%@ page import="com.el.model.vo.Person, java.util.ArrayList" %>
	<%
		// 서블릿에서 일어난 일
		
		ArrayList<Person> list = new ArrayList();
		list.add(new Person("홍길동", 15, "한양"));
		list.add(new Person("김길동", 25, "대구"));
		list.add(new Person("황길동", 35, "부산"));
	
		/*
		request.setAttribute("list", list);
		forward(request, response);
		*/
		// 여기까지의 코드가 원래 이 페이지가 응답되기 전 서블릿에서 완성된 코드
	%>

	<c:set var="pList" value="<%= list %>" scope="request" />

	<table border="1">
		<thead>
			<th></th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty pList }">
					<tr align="center">
						<td></td>
						<td colspan="3">조회 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${ requestScope.pList }" varStatus="status">
						<tr align="center">
							<td>${ status.count }</td> <!-- index : 0부터 시작 / count : 1부터 시작 -->
							<td>${ p.name }</td>
							<td>${ p.age }</td>
							<td>${ p.address }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<hr>
	
	<h3>5. 반복문 - forTokens</h3>
	
	<pre>
		[ 표현법  ]
		&lt; c:forTokens var="각 값을 보관할 변수명" items="분리시키고자하는 문자열" delims="구분자" &gt;
			반복적으로 실행할 구문(출력만)
		&lt; /c:forTokens &gt;
		
		- JAVA split("구분자") 또는 StringTokenizer와 비슷한 역할
		- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
	</pre>

	<br>
	
	<!-- 테스트할 문자열 변수 만들기 -->
	
	<c:set var="dinner" value="피자, 치킨/비빔밥-떡볶이.갈비" />
	
	<ul>
		<c:forTokens var="d" items="${ dinner }" delims=",/-." >
			<li>${ d }</li>
		</c:forTokens>
	</ul>
	
	<hr>
	
	<h3>6. 쿼리스트링 관련 태그</h3>
	
	<pre>
		[ 표현법  ]
		&lt; c:url var="변수명" value="요청할url" &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
			&lt; c:param name="키값" value="밸류값" / &gt;
		&lt; /c:url &gt;
		
		- url경로를 생성하고, 쿼리스트링을 정의할 수 있는 태그
	</pre>
	
	<a href="list.do?cpage=1&num=2&boardLimit=3&condition=writer">기존방식으로 요청</a>
	
	<!-- c:url -->
	<c:url var="query" value="list.do">
		<c:param name="cpage" value="1" />
		<c:param name="num" value="2" />
		<c:param name="boardLimit" value="3" />
		<c:param name="condition" value="writer" />
	</c:url>
	
	<a href="${ query }">c:url방식으로 요청</a>



















	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>