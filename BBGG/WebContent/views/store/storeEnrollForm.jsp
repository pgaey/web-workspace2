<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.store.model.vo.Category" %>
<%
	ArrayList<Category> category = (ArrayList<Category>)request.getAttribute("category");
	String grade = (String)session.getAttribute("grade");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>



#seller{
	background-color: #cfe6d9;
	width : 100%;
	height : 800px;
}

#seller #body1, #body2, #body3{
    float : left;
    height: 100%;
}

#seller #body1{
    width: 10%;
}
#seller #body2{
    width: 80%;
}
#seller #body3{
    width: 10%;
}

#seller form{
	border : 1px solid rgb(110, 110, 110);
	width : 80%;
	margin : auto;
	border-radius : 10px;
	
}

#seller td{
	vertical-align : middle;
}

#seller #table1 tr{
    line-height: 2.5;
}

#seller #table1 input{
    width : 97%;
    height : 20px;
}

#seller #table1 #tel select, input {
	width : 30%;
}

#seller #table1 #parking button{
	font-size : 11px;
	width : 70px;
	padding : 0px;
}

#seller #table1 #category button{
	font-size : 11px;
	width : 70px;
	padding : 0px;
}

#seller #table2 button, span, td{
	vertical-align : middle;
	height : 20px;
	font-size : 11px;
}

#seller #table2 input[type="button"]{
	vertical-align : middle;
	text-align : left;
	width : 90%;
	height : 20px;
	font-size : 11px;
    line-height: 1.0;
}

#seller #table2 input[type="text"]{
    width : 100%;
    height : 20px;
}

#seller #body3 input{
    font-size: 15px;
    margin-bottom: 12px;
    line-height: 1.0;
    height : 25px;
}

#seller .btn-outline-primary:hover {
  background-color: transparent;
  color: #007bff;
}

body{
	width : 1200px;
	height : 920px;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
}

#a{
	height : 120px;
}

#a-1{
    width : 100%;
    height : 100%;
    border : 1px solid black;
}

#b{
	height : 800px;
}

#b-1{
	width : 20%;
    height : 100%;
    float: left;
    border : 1px solid black;
}

#b-2{
	width : 80%;
    height : 100%;
    float: left;
    border : 1px solid black;
}

</style>
</head>
<body>
    <% if(grade.equals("일반")) { %>
		<script>alert("당신은 판매자가 아니잖아~~");</script>
	<% } else if(grade.equals("판매")) {%>

	<div id="a">
        <div id="a-1"><%@ include file="../common/header.jsp" %></div>
	</div>
	<div id="b">
		<div id="b-1"><%@ include file="../store/storeSidebar.jsp" %></div>
		<div id="b-2">
            <div id="seller">
			    <header>
				    <h1 align="center" style="font-size:20px; padding-top: 15px; padding-bottom:15px;"><b>매장 관리 - 정보 등록</b></h1>
			    </header>
			    <div id="body">
			    <div id="body1">ㅤ</div>
			    <div id="body2">
			        <form enctype="multipart/form-data" action ="<%= contextPath %>/enroll.me" method="post" id="store-enroll">
			            <table id ="table1" align="center">
			                <tr>
			                    <td width="120">매장명 (*필수입력): </td>
			                    <td width="300"><input type="text" required></td>
			                </tr>
			                <tr>
			                    <td width="120">주소 (*필수입력): </td>
			                    <td width="300">
			                    <select style="width:20%; height:19px; display: inline-block; text-align : middle" name="location">
			                            <option value="서울">서울</option>
			                            <option value="경기">경기</option>
			                            <option value="충북">충북</option>
			                            <option value="충남">충남</option>
			                            <option value="부산">부산</option>
			                     </select><input type="text" style="width:77%" required></td>
			                </tr>
			                <tr>
			                    <td width="120">오픈 시간 : </td>
			                    <td width="300"><input type="text"></td>
			                </tr>
			                <tr>
			                    <td width="120">마감 시간 : </td>
			                    <td width="300"><input type="text"></td>
			                </tr>
			                <tr>
			                    <td width="120">브레이크 타임 : </td>
			                    <td width="300"><input type="text"></td>
			                </tr>
			                <tr>
			                    <td width="120">휴무일 : </td>
			                    <td width="300"><input type="text"></td>
			                </tr>
			                <tr id="tel">
			                    <td width="120">연락처 : </td>
			                    <td width="300">
			                        <select style="width:20%; height:19px; display: inline-block; text-align : middle" name="location">
			                            <option value="02">02</option>
			                            <option value="031">031</option>
			                            <option value="032">032</option>
			                            <option value="033">033</option>
			                            <option value="034">034</option>
			                        </select>
			                        -
			                        <input type="text" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')" style="width:36%">
			                        -
			                        <input type="text" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')" style="width:36%">
			                    </td>
			                </tr>
			                <tr id="parking">
			                    <td width="120">주차 : </td>
			                    <td width="300">
			                        <button type="button" value="주차가능" class="btn btn-primary parking" id = "parking1">주차가능</button>
			                        <button type="button" value="주차불가" class="btn btn-outline-primary parking" id = "parking2">주차불가</button>
			                    </td>
			                </tr>
			                <tr id="category">
			                    <td width="120">카테고리 : </td>
			                    <td width="300">
			                    	<% for(Category c : category) {%>
			                                <button type="button" value="<%= c.getCateNo()%>" class="btn btn-outline-primary change" id = "category<%= c.getCateNo()%>"><%= c.getCate()%></button>
			                        <% } %>
			                    </td>
			                </tr>
			                <tr id="insta">
			                    <td width="120">인스타그램 : </td>
			                    <td width="300">
			                        <input type="text">
			                    </td>
			                </tr>
			                <tr id="youtube">
			                    <td width="120">유튜브 : </td>
			                    <td width="300">
			                        <input type="text">
			                    </td>
			                </tr>
			            </table>
			            <br>
			            <table id ="table2" align="center">
			            	<tr id="logo">
			                    <td rowspan="4">로고 : </td>
			                    <td rowspan="2" style="text-align:center">미리보기</td>
			                    <td><input type="button" class="btn btn-primary" value="등록"></td>
			                    <td colspan="3"></td>
			                </tr>
			                <tr>
			               		<td width="50"><input type="button" class="btn btn-secondary" value="삭제"></td>
			               		<td colspan="3"></td>
			                </tr>
			                <tr>
			                	<td style="text-align:center">제품명</td>
			                    <td style="text-align:center">단체주문</td>
			                    <td colspan="3"></td>
			                </tr>
			                <tr>
			                	<td><input type="text"></td>
			                    <td style="text-align:center"><input type="checkbox" class="form-check-input"></td>
			                    <td colspan="3"></td>
			                </tr>
			                <tr id="product1">
			                    <td width="70" rowspan="4">대표메뉴 1 : </td>
			                    <td width="90" rowspan="2" style="text-align:center">미리보기</td>
			                    <td width="50"><input type="button" class="btn btn-primary" value="등록"></td>
			                    <td width="70" rowspan="4">대표메뉴 2 : </td>
			                    <td width="90" rowspan="2" style="text-align:center">미리보기</td>
			                    <td width="50"><input type="button" class="btn btn-primary" value="등록"></td>
			                </tr>
			                <tr>
			                    <td><input type="button" class="btn btn-secondary" value="삭제"></td>
			                    <td><input type="button" class="btn btn-secondary" value="삭제"></td>
			                </tr>
			                <tr>
			                    <td style="text-align:center">제품명</td>
			                    <td style="text-align:center">단체주문</td>
			                    <td style="text-align:center">제품명</td>
			                    <td style="text-align:center">단체주문</td>
			                </tr>
			                <tr id="product2">
			                    <td><input type="text"></td>
			                    <td style="text-align:center"><input type="checkbox" class="form-check-input"></td>
			                    <td><input type="text"></td>
			                    <td style="text-align:center"><input type="checkbox" class="form-check-input"></td>
			                </tr>
			                <tr>
			                    <td width="70" rowspan="4">대표메뉴 3 : </td>
			                    <td width="90" rowspan="2" style="text-align:center">미리보기</td>
			                    <td width="50"><input type="button" class="btn btn-primary" value="등록"></td>
			                    <td width="70" rowspan="4">대표메뉴 4 : </td>
			                    <td width="90" rowspan="2" style="text-align:center">미리보기</td>
			                    <td width="50"><input type="button" class="btn btn-primary" value="등록"></td>
			                </tr>
			                <tr>
			                    <td><input type="button" class="btn btn-secondary" value="삭제"></td>
			                    <td><input type="button" class="btn btn-secondary" value="삭제"></td>
			                </tr>
			                <tr>
			                    <td style="text-align:center">제품명</td>
			                    <td style="text-align:center">단체주문</td>
			                    <td style="text-align:center">제품명</td>
			                    <td style="text-align:center">단체주문</td>
			                </tr>
			                <tr>
			                    <td><input type="text"></td>
			                    <td style="text-align:center"><input type="checkbox" class="form-check-input"></td>
			                    <td><input type="text"></td>
			                    <td style="text-align:center"><input type="checkbox" class="form-check-input"></td>
			                </tr>
			            </table>
			        </form>
			        </div>
			
			        <div id="body3">
			            <input type="submit" form ="store-enroll" style="width:80%" class="btn btn-success" value="요청">
			            <input type="reset" form ="store-enroll" style="width:80%" class="btn btn-secondary" value="취소 "">
			        </div>
			    </div>
		    </div>
        </div>
    </div>

    
    <% } else if(grade.equals("관리")) { %>
    	<script>alert("쪼매만 기다리시오")</script>
    <% } %>
    
    
    <script>
    $("#parking2").on("click", function(){
    	if(this.className == "btn btn-outline-primary parking"){
    		$("#parking1")[0].className = "btn btn-outline-primary parking";
    		this.className = "btn btn-primary parking";
    	}
    });
    
    $("#parking1").on("click", function(){
    	if(this.className == "btn btn-outline-primary parking"){
    		$("#parking2")[0].className = "btn btn-outline-primary parking";
    		this.className = "btn btn-primary parking";
    	}
    });
    
    $(".change").on("click",function(){
    	if(this.className == "btn btn-outline-primary change"){
    		this.className = "btn btn-primary change";
    	} else{
    		this.className = "btn btn-outline-primary change";
    	}
    });
    </script>
    
</body>
</html>