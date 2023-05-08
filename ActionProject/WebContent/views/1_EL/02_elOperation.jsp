<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>EL 연산</h1>
	
	<h3>1. 산술연산</h3>
	
	<p>
		* 기존 방식 <br>
		10 + 3 = <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	</p>

	<p>
		* EL연산<br>
		10 + 3 = ${ big + small } <br>
		10 - 3 = ${ big - small } <br>
		10 * 3 = ${ big * small } <br>
		10 / 3 = ${ big / small } 또는 ${ big div small } <br>
		10 % 3 = ${ big % small } 또는 ${ big mod small } <br>
	</p>
	
	<hr>
	
	<h3>2. 숫자간 대소 비교 연산</h3>
	
	<p>
		* 기존방식 <br>
		10 > 3 : <%= (int)request.getAttribute("big") > (int)request.getAttribute("small") %>
	</p>
	
	<p>
		* EL구문<br>
		10 &gt; 3 : ${ big > small } 또는 ${ big gt small }(가시성을 위해 후자를 선호) <br> 
		10 &lt; 3 : ${ big < small } 또는 ${ big lt small }(가시성을 위해 후자를 선호) <br>
		10 &gt;= 3 : ${ big >= small } 또는 ${ big ge small } <br>
		10 &lt; = 3 : ${big <= small } 또는 ${ big le small } <br>
	</p>

	<hr>
	
	<h3>3. 동등 비교 연산</h3>
	
	<p>
		* 기존방식<br>
		10과 3이 일치합니까??
		
		<%= (int)request.getAttribute("big") == (int)request.getAttribute("small") %> <br>
		
		sOne과 sTwo가 일치합니까??(주소비교) 
		<%= (String)request.getAttribute("sOne") == (String)request.getAttribute("sTwo") %>
		
		sOne과 sTwo가 일치합니까??(내용물비교)
		<%= ((String)request.getAttribute("sOne")).equals((String)request.getAttribute("sTwo")) %>
	</p>
	
	<p>
		* EL연산<br>
		10과 3이 일치합니까?? : ${ big == small } 또는 ${ big eq small } <br>
		big에 담긴 값과 10이 일치합니까?? : ${ big == 10 } 또는 ${ big eq 10 } <br>
		sOne과 sTwo가 일치합니까?? ${ sOne == sTwo } 또는 ${ sOne eq sTwo } <br>
		<!-- EL에서의 문자열의 == 비교는 자바에서의 equals()와 같은 동작을 함 => (내용물비교) -->
		sOne과 sTwo가 일치하지 않습니까?? : ${ sOne != sTwo } 또는 ${ sOne ne  sTwo } <br> <!-- ne : not equals -->
		sOne에 담긴 값과 "안녕"이 일치합니까?? : ${ sOne == "안녕" } 또는 ${ sOne eq '안녕' } <br>
		<!-- EL에서의 문자열리터럴 값 제시 시 홑따옴표 / 쌍따옴표 상관없음    그러나 홑따옴표를 쓰는 것이 좋다 -->
	</p>

	<hr>
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 체크하는 연산</h3>
	
	<p>
		* 기존 방식 <br>
		- 객체가 null인지 알고 싶을 경우 객체명 == null로 비교하면 true또는 false가 나옴 <br>
		- 리스트가 비어있는지 알고싶은 경우 리스트명.isEmpty() 사용하면 true 또는 false가 나옴 <br>
		혹은 리스트명.size() == 0을 사용해도 무방
	</p>

	<p>
		* EL 구문 <br>
		pTwo가 null입니까? : ${ pTwo == null } 또는 ${ empty pTwo } 또는 ${ pTwo eq null } <br>
		pOne이 null이 아닙니까? : ${ pOne != null } 또는 ${ !empty pOne } 또는 ${ pOne eq null } <br>
		
		lOne이 텅 비어있습니까? ${ empty lOne } <br>
		lTwo가 텅 비어있습니까? ${ empty lTwo } <br>
	</p>
	
	<hr>
	
	<h3>5. 논리연산자</h3>
	
	<p>
		* 기존방식 <br>
		&&(AND), ||(OR)
	</p>
	
	<p>
		* EL연산 <br>
		AND연산 : ${ true and true } <br>
		OR 연산 : ${ true or false } <br>
	</p>

	<p>
		big이 small보다 크고 lOne이 텅 비어있나요? <br>
		
		${ (big gt small) and (empty lOne) } <br>
	
		big과 small의 곱은 4의 배수인가요? <br>
		
		${ (big * small mod 4) eq 0 } <br>
		
	
	</p>





































	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

















