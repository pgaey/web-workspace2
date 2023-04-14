<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
	// 게시글번호, 카테고리명, 제목, 내용, 작성자 아이디, 작성일

    Attachment at = (Attachment)request.getAttribute("at");
	// 파일번호, 원본명, 수정명, 저장경로
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 일반게시글</title>
<style>
    .outer{
        width : 1000px;
        margin : auto;
        background-color: lightgreen;
        margin-top: 5px;
        color:white;
    }

    #detail-area{
        border : 1px solid white;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">일반 게시글 상세보기</h2>
        <br>

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="70">카테고리</th>
                <td width="100"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="400"><%= b.getBoardTitle() %></td>
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
                    <p style="height:300px;"><%= b.getBoardContent() %></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
					<% if(at == null){ %>
                    	<!-- 첨부파일이 없을 경우 -->
                    	첨부파일 없습니다.
					<% } else { %>
                    	<!-- 첨부파일이 있을 경우 -->
                    	<!-- /jsp/resources/board_upfiles/changeName -->
                    	<a href="<%= contextPath %>/<%= at.getFilePath() %>/<%= at.getChangeName() %>" download="<%= at.getOriginName() %>"><%= at.getOriginName() %></a>
                    <% } %>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="<%= contextPath %>/list.bo?cpage=1" class="btn btn-sm btn-info">목록으로</a>

            <!-- 로그인한 사용자이고 현재 게시글의 작성자일 경우 수정하기 버튼을 보이게끔 -->
            <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
                
                <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-sm btn-warning">수정하기</a>
            
            <% } %>

        </div>

    </div>


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>