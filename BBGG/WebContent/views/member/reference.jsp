<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	width : 1200px;
	height : 920px;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
}
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
    /* padding-top : 10px; */
    
    font-size: 30px;
    font-weight: 1000;
}
.user-info{
    border: 1px solid red;
    height : 100%;
}
</style>
</head>
<body>
    <div class="wrap">
        <div class="wrap-left">
            <%@ include file="../common/userBar.jsp" %>
        </div>
        <div class="wrap-right">
            <div class="head-area" align="center"><!-- 마이페이지 제목 -->
                개인정보 수정
            </div><!-- head-area 끝 -->
            <div class="user-info">




            </div>
        </div>
</body>
</html>