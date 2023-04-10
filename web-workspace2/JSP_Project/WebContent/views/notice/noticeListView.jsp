<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 공지사항이야</title>
<style>
    .outer{
        width : 1000px;
        margin : auto;
        background-color : lightgreen;
        margin-top : 5px;
        color : white;
    }
    .list-area{
        text-align : center;
        border : 1px solid white;
    }
    .list-area>tbody>tr:hover{
        cursor : pointer;
        background-color : forestgreen;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %> <!-- ../ 하면 상위폴더로 한번 올라감 -->

    <div class="outer">
        <br>
        <h2 align="center">공지사항!</h2>
        <br>
        
        <!-- 관리자만 글 작성 버튼이 보이게끔 -->
        <!-- 로그인이 되어있고, 관리자일 경우 -->
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>    <!-- 제발 == 말고 equals -->
        <!-- 앞 조건 없어도 되지 않나?? => loginUser가 null일 경우에는 .getUserId()도 null이 되기 때문에 NullPointException이 뜰 수 있음 -->
        
			<div align="right" style="width:870px;">
				<!-- 버튼에 href속성이 없으니까 
				onclick="location.href='요청url'"
				<button>글작성</button>
				-->
				
				<!-- 방법 1 -->
				<button onclick="enrollForm();">button태그 글작성</button>
				<!-- 방법 2  이 경우 a태그를 버튼처럼 만들어주는 방법을 알아야함  아래 참고 -->
				<a href="<%= contextPath %>/enrollForm.no" class="btn btn-sm btn-info">a태그 글작성</a>
				
			</div>
			
			<!-- 방법 1의 경우 -->
			<script>
				function enrollForm(){
					location.href= '<%= contextPath %>/enrollForm.no';
				}
			</script>
        
        
        <% } else { %>
        
        
        
        <% } %>
        
        
        
        
        

        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="150">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- 공지사항이 있을수도 있고 없을수도 있음 -->
                
                
				<% if(list.isEmpty()){ %>
                <!-- 공지사항이 없을 때 -->
                <tr>
                    <td colspan="5">공지사항이 존재하지 않습니다.</td>
                </tr>
				<% } else { %>
				
				
                <!-- 공지사항이 있을 때 -->
                <!--
                <tr>
                    <td>123</td>
                    <td>공지사항입니다.</td>
                    <td>관리자</td>
                    <td>23</td>
                    <td>2023-04-10</td>
                </tr>
                -->
                	<% for(Notice n : list){ %>
                		<tr>
                			<td><%= n.getNoticeNo() %></td>
                			<td><%= n.getNoticeTitle() %></td>
                			<td><%= n.getNoticeWriter() %></td>
                			<td><%= n.getCount() %></td>
                			<td><%= n.getCreateDate() %></td>
                		</tr>
                	<% } %>
				<% } %>
				
            </tbody>
        </table>
        <br><br>
    </div>

    <script>
        $(function(){
            
            // 1절 tr요소를 선택해서 클릭해야 함
            
            $('.list-area>tbody>tr').click(function(){
                
                // 2절 상세페이지 요청

                // console.log(location.href);

                // localhost:8001/jsp/detail.no

                // 클릭했을 때 해당 공지사항의 번호를 넘겨줘야함
                // 해당 tr태그의 자식 중에서도 첫번째 td태그의 값만 필요함
                // console.log($(this).children().eq(0).text());
                
                var nno = $(this).children().eq(0).text();
                
                // 글번호를 이용한 요청
                // GET방식 : 요청할url?키=밸류&키=밸류&키=밸류   
                // 이런 형식을 QueryString이라고 부름
                // localhost:8001/jsp/detail.no?nno=글번호
                // 대놓고 url을 만들어서 요청
                		
                location.href="<%=contextPath%>/detail.no?nno=" + nno;

            });

        });
    </script>











    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>