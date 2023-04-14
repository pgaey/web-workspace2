<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>    
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Attachment> at = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color : rgb(100, 190, 100);
        width : 1000px;
        margin : auto;
        color : white;
        margin-top : 5px;
    }

    #detail-form > table{
        border: 1px solid white;
    }
    #detail-form input, #detail-form p{
        width : 100%;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진 게시글 상세보기</h2>
        <br>


            <table align="center" border="1" id="detail-form">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3" width="600"><%= b.getBoardTitle() %></td>
                </tr>
                <tr>
                	<th>작성자</th>
                	<td><%= b.getBoardWriter() %></td>
                	<th>작성일</th>
                	<td><%= b.getCreateDate() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <p style="height : 100%;">
                        	<%= b.getBoardContent() %>
                        </p>
                    </td>
                </tr>
                <!-- 미리보기 영역 -->
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleimg" width="550" height="300" 
                        		src="<%=contextPath%>/<%= at.get(0).getFilePath() %>/<%= at.get(0).getChangeName()%>">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
	                    <% for(int i = 1; i < at.size(); i++){ %>
	                    	<td><img width="150" height="110" src="<%= contextPath %>/<%= at.get(i).getFilePath() %>/<%= at.get(i).getChangeName() %>"></td>
	                    <% } %>
                </tr>
            </table>
            <br>

            <br>
            <div align="center">
                <a href = "<%= contextPath %>/list.th" class="btn btn-sm btn-info">목록으로</a>
            </div>


        <br><br><br>
    </div>













</body>
</html>