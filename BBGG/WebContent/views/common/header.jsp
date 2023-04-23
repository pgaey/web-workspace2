<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.*" %>
<%
    String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	
    String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>헤더</title>

<style>
    .outer{
            width : 1200px;
            margin: auto;
        }
    #header{
        width : 1200px;
        height : 120px;
        background-color : rgb(241,227,196);
        padding : none;
        margin : auto;
    }

    #header div{
        box-sizing: border-box;
        float :left;
        height : 100%;
    }

    #header #header1, #header3{
        width : 20%;
    }

    #header #header2{
        width: 60%;
    }

    #header #header1-1, #header1-3, #header2-1, #header2-3, #header3-1, #header3-3{
        width : 20%;
    }

    #header #header1-2, #header2-2, #header3-2{
        display: flex;
        align-items : center;
        justify-content : center;
        text-align: center;
        width : 60%;
        font-size: 14px;
    }

    #header #logo{
        height : 50%;
        width : 50%;
        display: flex;
        align-items : center;
        justify-content : center;
        text-align: center;
        background-color: #8cc2a4;
        border-radius: 10px;
        font-size : 20px;
    }
    #header3 a{ 
  		text-decoration: none;
        color: black;
	}
    span:hover{
        cursor: pointer;
    }
    

</style>

</head>
<body>

    <script>
        var msg = '<%= alertMsg %>';
        if(msg != 'null'){
            alert(msg);
            <% session.removeAttribute("alertMsg"); %>
        }
    </script>
    
    
	<div id="header">
        <div id="header1">
            <div id="header1-1"></div>
            <div id="header1-2">빵집 / 커뮤니티</div>
            <div id="header1-3"></div>
        </div>
        <div id="header2">
            <div id="header2-1"></div>
            <div id="header2-2"><div id="logo">빵빵곡곡</div></div>
            <div id="header2-3"></div>
        </div> 
        
        
        <div id="header3">
        <% if(loginUser == null) { %>
            <div id="header3-1"></div>
            <div id="header3-2"><a href="/bbgg/views/member/memberLogin.jsp">로그인</a>
                <hr> / <hr>
                <a href="/bbgg/views/member/signUpAgree.jsp">회원가입</a>
            </div>
                                                                                    <!-- a태그 파래지는 속성 지우기 -->
            <div id="header3-3"></div>
        <% } else { %>
            <div id="header3-1"></div>
            <div id="header3-2"><a href="<%= contextPath %>/userLogout.do">로그아웃</a>
                <hr> / <hr>
                <!-- <a href="<%= contextPath %>/userMyPage.do">마이페이지</a> -->
                <form action="<%= contextPath %>/userMyPage.do" method="post" id="noForm">
                    <span onclick="document.forms['noForm'].submit()">마이페이지</span> 
                    <input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
                </form>
            </div>
                                                                                    <!-- a태그 파래지는 속성 지우기 -->
            <div id="header3-3"></div>
        <% } %>
        </div>
        
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>

