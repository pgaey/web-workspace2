<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.StringTokenizer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body{
        box-sizing: border-box;
        font-family: 'Roboto', sans-serif;
        margin:0;
    }

    #boardSidebar{
        height : 800px;
        width: 250px;
        /*background-color : rgb(241,227,196);*/
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        padding-top: 70px;
        border-right: solid 1px rgb(160, 160, 160);
        position : relative;
    }
    #boardSidebar>tr{
        margin:auto;
        list-style-type: none;
        padding: 0;
    }
    #boardSidebar td {
        padding: 15px;
        text-align: center;
    }
    #boardSidebar a{
        text-decoration: none;
        color : black;
    }
    #boardSearch{
        margin-top:100px;
        text-align: center;
        height: 30px;
    }
    #search{
        size:5px;
        height: 100%;
        border: 1px solid rgb(150, 150, 150);
        border-radius: 5px;
        padding: 0;
        box-sizing: border-box;
        margin-left: 3px;
    }
    #searchBtn{
        width: 30px;
        height: 100%;
        margin: 0;
        padding: 0;
        border: 0;
        box-sizing: border-box;
        background-color : white;
    }
    #sidebarBtn-area{
        width:100%;
        height:70px;
        text-align: center;
        box-sizing: border-box;
        position : absolute;
        bottom : 70px;
    }
    #sidebarBtn-area>a{
        display: inline-block;
        box-sizing: border-box;
        border-radius: 35px;
        height: 100%;
        width: 70px;
        background-color: #c7c7c7;
        text-align: center;
        line-height: 80px;
        margin: 7px;
    }
    .clicked{
        font-size: 150%;
        background-color: red;
        /* color:green; */
        
    }
    
    
    </style>
</head>
<body>
    <div id="header-top">
        <%@ include file="../common/header.jsp" %>
    </div>
	<div id="boardSidebar">
		<table id="sideMenubar" align="center">
			<% if(loginUser.getGrade().equals("V") || loginUser.getGrade().equals("W")) { %>
	            <tr>
	                <td><a href="<%= contextPath %>/userMyPage.do">마이페이지</a></td>
	            </tr>
	            <tr>
	                <td><a href="<%= contextPath %>/enrollPath.do">개인정보수정</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">내 게시글</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">내 리뷰</a></td>
	            </tr>
	            <tr>
	                <td><a href="<%= contextPath %>/msgMain.do">내 쪽지</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">찜한 가게</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">차단 회원</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">빵집 문의</a></td>
	            </tr>
	            <tr>
	                <td><a href="#">고객센터</a></td>
	            </tr>
            <% } else if(loginUser.getGrade().equals("S"))  { %>
            	<tr>
                	<td><a href="#">판매자 페이지</a></td>
            	</tr>
            	<tr>
                	<td><a href="#">매장 관리</a></td>
            	</tr>
            	<tr>
                	<td><a href="#">리뷰 관리</a></td>
            	</tr>
            	<tr>
                	<td><a href="#">문의 관리</a></td>
            	</tr>
            	<tr>
                	<td><a href="#">게시글 관리</a></td>
            	</tr>
            	<tr>
                	<td><a href="#">개인정보수정</a></td>
            	</tr>
            <% } %>
            <% System.out.println(loginUser.getGrade()); %>
        </table>

        <script>
            $.each($('#sideMenubar a'), function(){
                $(this).click(function(){
                    $('#sideMenubar a').removeClass('clicked');
                    $('#sideMenubar a').css('color', 'black');
                    $(this).addClass('clicked');
                    $(this).css('color', 'white');
                })
            })

            // $.each($('#sideMenubar a'), function(){
            //     $(this).click(function(){
            //         $.ajax({
            //             url : 
            //         })
            //     })
            // })
                
            

        </script>


        <div id="boardSearch">
            <input type="text" id="search">
            <button type="submit" id="searchBtn"><i class="fa-solid fa-magnifying-glass fa-lg" style="color:#77A88D;"></i></button>
        </div>
        <div id="sidebarBtn-area">
            <a href="#header-top" id="top"><i class="fa-solid fa-arrow-up fa-2x" style="color:white"></i></a>
            <a href="#" id="boardWrite"><i class="fa-solid fa-pen fa-2x" style="color:white"></i></a>
        </div>
	</div>
</body>
</html>