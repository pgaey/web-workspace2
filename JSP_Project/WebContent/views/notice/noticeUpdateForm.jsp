<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        box-sizing: border-box;
    }
    .outer{
        width : 1000px;
        margin : auto;
        background-color: lightgreen;
        margin-top: 5px;
        color:white;
    }
    #update-form > table{
        border: 1px solid white;
    }
    #update-form input, #update-form textarea{
        width : 100%;
    }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">공지사항 수정하기</h2>
        <br><br>

        <form action="<%= contextPath %>/update.no" method="post" id="update-form">
        
			<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
			
            <table align="center">
                <tr>
                    <th width="50;">제목</th>
                    <td width="600;"><input type="text" name="title" value="<%= n.getNoticeTitle() %>" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea  width="600px;" name="content" rows="10" style="resize:none;" required><%= n.getNoticeContent() %></textarea>
                    </td>
                </tr>
            </table>
            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
                <button type="button" class="btn btn-sm btn=secondary" onclick="history.back();">뒤로가기</button>
                <!-- history.back()이전페이지로 돌아가게 해주는 메서드-->
            </div>

            <br><br>
        </form>



    </div>
</body>
</html>