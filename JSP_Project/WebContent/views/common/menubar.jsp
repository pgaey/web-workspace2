<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 메뉴바다</title>

<style>
	.nav-area{
		background-color : lightgreen;
	}

	.menu{
		display : table-cell;
		width : 150px;
		height : 50px;
	}

	.menu a{
		text-decoration: none;
		color : white;
		font-size : 20px;
		font-weight : bold;
		display : block;
		width : 100%;
		height : 100%;
		line-height : 50px;
	}

	.menu a:hover{
		background-color:rgb(34, 158, 34);
	}

</style>

</head>
<body>

	<h1 align="center">개발해서 건물사자</h1>

	<div class="login-area">
	
		<!--
			form태그 안에 있는 제출버튼(submit) 클릭 시 form태그가 가지고 있는 속성 중
			action에 작성된 url로 요청~(제출)
			즉, Controller(Servlet)를 호출한다고 생각하면 됨

			Servlet요청 같은 경우 반드시 그 요청값이 현재 웹 어플리케이션의
			contextPath == /context Root/뒤에 붙는 경로
			형식으로 작성해야함
			=> http://localhost:8001/jsp/test1.do (서블릿매핑값)

			* 경로 지정 방식
			절대경로방식(/) : /Context Root/요청할 url
									/ 로 시작하는 경우
							localhost:8001 뒤에 action속성에 작성한 값이 붙으면서 요청
			상대경로방식(test1.do) : 요청할 url문구로 시작하는 경우
									현재 이 페이지가 보여질 때 url경로 중에서
									마지막 /로부터 뒤에 action속성에 적은 값이 붙으면서 요청
		-->
	
	
		<!-- 사용자가 로그인 전에 보게 될 화면 -->
		<form action="/jsp/login.me" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userPwd" required></td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="submit">로그인</button>
						<button type="button">회원가입</button>
					</th>
				</tr>
			</table>
		</form>
	
	
		<!-- 사용자가 로그인 후에 보게 될 화면 -->
		<div id="user-info">
			<b>홍길동</b>님 환영합니다~~! <br><br>
			<div align="center">
				<a href="#">마이페이지</a>
				<a href="#">로그아웃</a>
			</div>
		</div>
	

		<div class="nav-area" align="center">
			<div class="menu"><a href="#">HOME</a></div>
			<div class="menu"><a href="#">공지사항</a></div>
			<div class="menu"><a href="#">일반게시판</a></div>
			<div class="menu"><a href="#">사진게시판</a></div>
		</div>
	
	
	
	
	
	
	</div>





</body>
</html>