<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

#storeSidebar{
    height : 800px;
    background-color : rgb(241,227,196);
}
.inlineDiv{
	display:inline-block;
	height : 800px;
	width : 50%;
}

.empty{
	border: 1px solid red;
	display: inline-block;
	height : 800px;
	width : 23%;
}
.inlineDiv tr{
	height : 40px;
	text-align: center;
}
#storeSidebar .inlineDiv a{
	font-size: 15px;
}

</style>

</head>
<body>

	<div id="storeSidebar">
		<div class="empty">
		</div>
		<div class="inlineDiv" id="asd" align="center">
			<% if(loginUser.getGrade() != "S") { %>
				<table>
					<tr style="height:20px;"> 
						<th></th>
					</tr>
					<tr>
						<td><a href="">마이페이지</a></td>
					</tr>
					<tr>
						<td>
							<a href="">개인정보수정</a>
						</td>
					</tr>
					<tr>
						<td><a href="">내 게시글</a></td>
					</tr>
					<tr>
						<td><a href="">내 리뷰</a></td>
					</tr>
					<tr>
						<td><a href="">내 쪽지</a></td>
					</tr>
					<tr>
						<td><a href="">찜한 가게</a></td>
					</tr>
					<tr>
						<td><a href="">차단 회원</a></td>
					</tr>
					<tr>
						<td><a href="">빵집 문의</a></td>
					</tr>
					<tr>
						<td><a href="">고객센터</a></td>
					</tr>
				</table>
			<% } else if(loginUser.getGrade() == "S") { %>
				<table>
					<tr>
						<td><a href="">판매자 페이지</a></td>
					</tr>
					<tr>
						<td><a href="">매장 관리</a></td>
					</tr>
					<tr>
						<td><a href="">리뷰 관리</a></td>
					</tr>
					<tr>
						<td><a href="">문의 관리</a></td>
					</tr>
					<tr>
						<td><a href="">게시글 관리</a></td>
					</tr>
					<tr>
						<td><a href="">개인정보수정</a></td>
					</tr>
				</table>
			<% } %>
		</div>

		<div class="empty">
		</div>
	</div><!-- storeSidebar 끝 -->

	<script>
		console.log(loginUser);
	</script>
</body>
</html>