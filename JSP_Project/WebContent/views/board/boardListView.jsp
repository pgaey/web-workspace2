<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo" %>
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int currentPage = pi.getCurrentPage();
	 
	 
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 일반게시판이야</title>
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

    .list-area>tbody>tr:hover{
        cursor:pointer;
        background : forestgreen;
    }
</style>

</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">일반게시판</h2>
        <br>
        
        
        
        <div align="right" style="width:860px;">
            <!-- 로그인한 회원만 보여지는 버튼 : loginUser가 null이냐 아니냐 -->
            <% if(loginUser != null) { %>
                <a href="<%= contextPath %>/enrollForm.bo" class="btn btn-sm btn-primary">글작성</a>
                <br><br>
            <% } %>
        </div>




        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th width="80">글번호</th>
                    <th width="80">카테고리</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                </tr>

            </thead>
            <tbody>
                <!-- 게시글 출력 : 게시글이 있는지 없는지 판단해서 -->
				<!-- isEmpty() -->
				<% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="6">조회된 게시글이 없습니다.</td>
	                </tr>
				<% } else { %>
                <!-- 반복 값을 순차적으로 접근해서 뽑아오기 -->
					<% for(Board b : list) { %>
					<tr>
						<td><%= b.getBoardNo() %></td>
						<td><%= b.getCategory() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><%= b.getBoardWriter() %></td>
						<td><%= b.getCount() %></td>
						<td><%= b.getCreateDate() %></td>
						
					</tr>
					<% } %>
				<% } %>
            </tbody>

        </table>

        <br><br>

        <div align="center" class="paging-area">
        

			<% if(currentPage != 1){ %>
            	<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage - 1 %>'" class="btn btn-sm btn-info">&lt;</button>
            <% } %>
            
            
            <% for(int i = startPage; i <= endPage; i++){ %>
            	<% if(currentPage != i){ %>
            	<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= i %>'" class="btn btn-sm btn-info"><%= i %></button>
            	<% } else { %>
            		<button class="btn btn-sm btn-info" disabled><%= i %></button>
            	<%} %>
            <% } %>
            
            
            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage + 1 %>'" class="btn btn-sm btn-info">&gt;</button>
			<% } %>
        </div>





        
    </div>



    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>