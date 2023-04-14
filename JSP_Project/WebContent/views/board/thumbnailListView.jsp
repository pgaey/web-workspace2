<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board" %> 
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 사진게시판</title>
<style>
	.outer{
        background-color : rgb(100, 190, 100);
        width : 1000px;
        margin : auto;
        color : white;
        margin-top : 5px;
    }

    .list-area{
        text-align : center;
        border : 1px solid white;
    }

	.thumbnail{
		border : 1px solid whitesmoke;
		width : 300px;
		display : inline-block;
		margin : 6px;
		background-color: lightgreen;
		color :rgb(85, 81, 61)
	}

	img{
		width : 250px;
		height: 200px;
		padding : 10px;
	}
	
	.thumbnail:hover{
		cursor:pointer;
		opacity: 0.9;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		
		<br>
		<h2 align="center">사진 게시판</h2>
		<br>

		<% if(loginUser != null) {%>
			<div style="width : 860px;" align="right">
				<a href="<%=contextPath%>/enrollForm.th" class="btn btn-sm btn-info">글작성</a>
			</div>
			<br>
		<% } %>


		<div class="list-area">
		
			<% if(list.isEmpty()) { %>
				<!-- 등록된 게시글이 없을 경우 -->
				등록된 게시글이 없습니다.
			<% } else {%>
			
				<!-- 등록된 게시글이 있을 경우 -->
				<% for(Board b : list) { %>
				<div class="thumbnail" align="center">
					<input type="hidden" value="<%= b.getBoardNo() %>">
					<img src="<%= b.getTitleImg() %>" alt="">
					<p>
						No. <%= b.getBoardNo() %> / <%= b.getBoardTitle() %><br>
						조회수 : <%= b.getCount() %>
					</p>
				</div>
				<% } %>
			<% } %>
		</div><!-- list-area 영역 끝 -->

		<script>
			$(function(){

				$('.thumbnail').click(function(){
					
					// 클릭할 때마다 url요청 => location.href 
					let bno = $(this).children().eq(0).val();

					location.href = '<%=contextPath%>/detail.th?bno=' + bno;
					
				});
				
			});
		</script>

	






	
	</div>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>