<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, java.util.ArrayList" %>

<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
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
        <h2 align="center">일반게시글 수정하기</h2>
        <br>

        <!-- 파일을 첨부하는 요청을 할 때는 반드시 form태그에 enctype="multipart/form-data를 추가해야한다." -->
        <form enctype="multipart/form-data" action="<%= contextPath %>/update.bo" id="update-form" method="post">
            <!-- 제목, 내용, 카테고리, 글쓴이, 첨부파일, 제출버튼 -->

			<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
			
		
            <table align="center">
                <tr>
                    <th width="150">카테고리</th>
                    <td width="600">
                        <select name="category" id="">
                            <% for(Category c : list) {%>
                                <option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                            <% } %>    
                        </select>
                        <script>
                            $(function(){

                                /* 
                                    b객체가 가지고 있는 Category필드를 보면
                                    사용자가 게시글 작성시 입력했던 CategoryName이 들어있을 것
                                    selected ==> true
                                */
                                $('#update-form option').each(function(){
                                    
                                    if($(this).text() == '<%= b.getCategory() %>'){
                                        $(this).attr('selected', 'true');
                                    }


                                });
                            });
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="<%= b.getBoardTitle() %>" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content" style="resize:none;" rows="10"><%= b.getBoardContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <!-- 기존 파일이 존재했다면 원본파일명 보여주기 aaa.jpg -->
                    <% if(at != null) { %>
                    	<td>
                    		<%= at.getOriginName() %>
		            		<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
		            		<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
                    	</td>
                    <% } %>
                    <td><input type="file" name="reUpfile"></td>
                </tr>
            </table>
            <br>
            <div align="center">
                <button type="submit">수정하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>












        <br><br><br>
    </div>








    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>