<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.board.model.vo.Board, com.common.model.vo.PageInfo" %>
<%

    
	String requestURI = request.getRequestURI();
	String[] arr = requestURI.split("/");
	String test = arr[4].substring(0, 4);
    
	
    
	//--------------------------------------------------------------
	
	ArrayList<Board> nList = (ArrayList<Board>)request.getAttribute("nList");
	ArrayList<Board> yList = (ArrayList<Board>)request.getAttribute("yList");
	ArrayList<Board> allList = (ArrayList<Board>)request.getAttribute("allList");

	PageInfo paging = (PageInfo)request.getAttribute("paging");
	
	int currentPage = paging.getCurrentPage();
	int startPage = paging.getStartPage();
	int endPage = paging.getEndPage();
	int maxPage = paging.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
    .wrap{
        width: 1200px;
    }
    .wrap-left{
        width: 250px;
        float: left;
    }
    .wrap-right{
        float: left;
        width: 950px;
        margin-top:120px;
        padding: 20px;
        height: 800px;
    }
    .head-area{
    	height : 50px;
    }
    
    .headleft{
    	float:left;
    }
    .headleft>span{
        color: #999999;
        font-size: 14px;
    }
    .headright{
    	float:right;
    }
    .boardList-area{
        border: 1px solid white;
        width: 100%;
        box-sizing: border-box;
        text-align: center;
    }
    .boardList-area thead{
        background-color: rgb(238, 238, 238);
        font-weight: 300;
        border-top : 1.5px solid rgb(138, 138, 138);
        border-bottom : 1.5px solid rgb(138, 138, 138);
        border-right : 2px solid  white;
        border-left : 2px solid  white;
    }
    .boardList-area td{
    	border : 1px solid black;
    }
    .boardList-area>tbody>tr:hover{
    	background-color : rgb(237, 237, 237);
    }
    .boardList-area tr{
        border-bottom: 1px solid rgb(181, 181, 181);
        height: 40px;
    }
    .paging-area{
        border: 1px solid white;
        width: 100%;
        height: 40px;
        margin-top : 20px;
    }
    .paging-area>button{
        width:35px;
        height: 100%;
        background-color: #ffd000;
        border : 0;
        color : white;
    }
    #title{
    	cursor : pointer;
    }
    .tTitle{
    	width : 500px;
    }
    
    
</style>
</head>
<body>
	
    <div class="wrap">
        <div class="wrap-left">
            <%@ include file="boardBar.jsp" %>
        </div>
        <div class="wrap-right">
            <div class="head-area">
                <div class="headleft">
                    <select name="" id="">
                        <option value="" selected>전체보기</option>
                        <option value="">사는얘기</option>
                        <option value="">유머</option>
                        <option value="">고민/질문</option>
                        <option value="">정보</option>
                    </select>
                    <span>&nbsp;&nbsp;전체글 수 : <%= paging.getListCount() %>개</span>
                </div>
                <div class="headright">
                    <input type="checkbox" class="noticeCheck">공지감추기
                    <select name="list" id=""> <!-- 게시글 수 선택 -->
                        <option>10</option>
                        <option>15</option>
                        <option>20</option>
                    </select>
                </div>
            </div>
            
            <table border="1" class="boardList-area">
                <thead>
                    <tr>
                        <th class="tTitle">제목</th>
                        <th>작성자</th>
                        <th>작성시간</th>
                        <th>조회수</th>
                        <th>추천수</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(nList.isEmpty() && yList.isEmpty()) { %> <!-- 공지사항 & 일반 게시글 없을 때 -->
                			<tr>
                				<td colspan="5">등록된 게시글이 없습니다.</td>
                			</tr>
					               			
                	<% } else if((yList.size() != 0) && nList.isEmpty()) { %> <!--  공지사항 있음 & 일반게시글 없을 -->
	                	<% for(int i = 0; i < yList.size(); i++) { %>
	                		<tr class="noticeList">
                                <td style="display: none;"><%= yList.get(i).getBoardNo() %></td>
								<td id="title"><%= yList.get(i).getTitle() %>&nbsp;&nbsp;[<%= yList.get(i).getReplyCount() %>]</td>
								<td><%= yList.get(i).getNickName() %></td>
								<td><%= yList.get(i).getWriteDate() %></td>
								<td><%= yList.get(i).getHits() %></td>
								<td><%= yList.get(i).getRecommendCount() %></td>
	                		</tr>
	                	<% } %>
	                <% } else if(yList.isEmpty() && (nList.size() != 0)) { %>  <!-- 공지사항 없음 & 일반게시글 있음  -->
	                	<% for(int i = 0; i < nList.size(); i++) { %>
	                		<tr>
                                <td style="display: none;"><%= nList.get(i).getBoardNo() %></td>
								<td id="title">[<%= nList.get(i).getHead() %>]<%= nList.get(i).getTitle() %>&nbsp;&nbsp;[<%= nList.get(i).getReplyCount() %>]</td>
								<td><%= nList.get(i).getNickName() %></td>
								<td><%= nList.get(i).getWriteDate() %></td>
								<td><%= nList.get(i).getHits() %></td>
								<td><%= nList.get(i).getRecommendCount() %></td>
	                		</tr>
	                	<% } %>
	                <% } else if((yList.size() != 0) && (nList.size() != 0)) { %> <!--  공지사항, 일반게시글 둘 다 있을  -->
	                	<% for(int i = 0; i < yList.size(); i++) { %>
	                		<tr class="noticeList">
                                <td style="display: none;"><%= yList.get(i).getBoardNo() %></td>
								<td id="title"><%= yList.get(i).getTitle() %>&nbsp;&nbsp;[<%= yList.get(i).getReplyCount() %>]</td>
								<td><%= yList.get(i).getNickName() %></td>
								<td><%= yList.get(i).getWriteDate() %></td>
								<td><%= yList.get(i).getHits() %></td>
								<td><%= yList.get(i).getRecommendCount() %></td>
	                		</tr>
	                	<% } %>
	                	<% for(int i = 0; i < nList.size(); i++) { %>
	                		<tr>
                                <td style="display: none;"><%= nList.get(i).getBoardNo() %></td>
								<td id="title">[<%= nList.get(i).getHead() %>]<%= nList.get(i).getTitle() %>&nbsp;&nbsp;[<%= nList.get(i).getReplyCount() %>]</td>
								<td><%= nList.get(i).getNickName() %></td>
								<td><%= nList.get(i).getWriteDate() %></td>
								<td><%= nList.get(i).getHits() %></td>
								<td><%= nList.get(i).getRecommendCount() %></td>
	                		</tr>
	                	<% } %>
	                <% } %>
                </tbody>
            </table>

            <div align="center" class="paging-area">
            
            <% if(currentPage != 1) { %>
            	<button onclick="location.href='<%= contextPath %>/freeList.bo?cpage=<%= currentPage - 1 %>'">&lt;</button>
			<% } %>

            <% for(int i = startPage; i <= endPage; i++) { %>
				<% if(currentPage != i) { %>
	            	<button onclick="location.href='<%= contextPath %>/freeList.bo?cpage=<%= i %>'"><%= i %></button>
	            <% } else { %>
	            	<button disabled style="background-color: #e2e2e2;"><%= i %></button>
	            <% } %>
	        <% } %>

			<% if(currentPage != maxPage) {%>
            	<button onclick="location.href='<%= contextPath %>/freeList.bo?cpage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
            
            </div>
        </div>
    </div>
    <script>
		$(function(){
			
            // 메뉴바 게시판 표시
			<% if(test.equals("free")) { %>
				$('#freeBoard').css('color', '#77A88D').css('font-weight', '700');
			<% } else if (test.equals("tour")) { %>
				$('#tourBoard').css('color', 'red');
			<% } %>


            // 클릭시 해당 게시글 상세페이지로 이동
            $('.boardList-area>tbody>tr').click(function(){
                location.href='<%= contextPath %>/detailView.bo?bno=' + $(this).children().eq(0).text();
            });
            
          	
            // 공지사항 숨기기 기능(체크박스)
            $('.noticeCheck').change(function() {
                var checked = $(this).prop('checked');  // checked (true, false)
             
                if(checked){
                    $('.noticeList').css('display', 'none'); 
                } else {
                	$('.noticeList').css('display', ''); 
                }
            });
			
		});
	</script>
</body>
</html>