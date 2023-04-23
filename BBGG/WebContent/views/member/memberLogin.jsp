<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.*" %>
<%
	String errorMsg = (String)session.getAttribute("errorMsg");
	String searchUserId = (String)request.getAttribute("userId");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<title>Insert title here</title>
<style>
    table *{
        padding: 5px;
    }
    .outer{
        margin: 20px;
        padding: 20px;
    }
    #login{
        display: block;
        width : 600px;
        height : 450px;
        margin: auto;
        margin-top: 150px;
        padding: 20px;
        background-color: antiquewhite;
    }
    h3{ /* 제목 */
        text-align : center;
        font-weight: 1000;
    }
    h3 + div{
        margin: 30px;
    }

    #searchId>button{   /* div : 아이디, 비밀번호 찾기 */
        margin : 10px;
        width: 120px;
        font-size : 12px;
    }
    .buttons{ /* div : 로그인, 회원가입 버튼 */
        text-align: center;
        box-sizing: border-box;
    }
    .btn{ /* 로그인, 회원가입 버튼 */
        width : 300px;
    }
    #login>div>table input{
        width : 250px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<script>
		var msg = '<%= errorMsg %>'; 
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("errorMsg"); %>
		}
	</script>
	


    <div class="outer"><!-- 전체 div  -->

        <div id="login"><!-- #login 시작 -->
            <br>
            <h3>로그인</h3>
            <br>    
             
            <!-- form 태그 시작 -->
            <form id="loginForm" action="<%= contextPath %>/userLogin.do" method="post">
                <div>
                    <table align="center">
                        <tr>
                            <th><b>UserID : </b></th>
                            <td><input type="text" name="userId" id="userId" placeholder="Username" required></td>
                        </tr>
                        <tr>
                            <th><b>Password : </b></th>
                            <td><input type="password" name="userPwd" id="userPwd" placeholder="Password" required></td>
                        </tr>
                    </table>
                </div>


			<!-- 아이디 비밀번호 찾기 창 -->
                <div id="searchId" align="center">
                    <button class="btn-sm" type="button" data-toggle="modal" data-target="#searchIdForm">아이디 찾기</button>
                    <button class="btn-sm" type="button" class="btn-danger" data-toggle="modal" data-target="#searchPwdForm">비밀번호 찾기</button>
                </div>
                
                
                <br><br>
            </form><!-- form태그 끝 -->
                
                <!-- 로그인 회원가입 찾기 창 -->
                <div class="buttons">
                    <button type="submit" class="btn btn-primary" id="userLogin" form="loginForm">로그인</button> <br><br>
                    <button class="btn btn-secondary" onclick="location.href='signUpAgree.jsp';">회원가입</button>
                </div>
                
        </div><!-- #login 끝 -->
        
        <script>
            <!-- 회원가입 버튼 이동 -->
            function signUp(){ 
                // location.href="signUpAgree.jsp";
            }
        </script>
        


        <!-- Button to Open the Modal -->
		<!-- 아이디 찾기 모달 -->
	    <div class="modal" id="searchIdForm">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        
	        <!-- Modal Header -->
	        <div class="modal-header">
	            <h4 class="modal-title">아이디 찾기</h4>
	            <button type="button" class="close" data-dismiss="modal">이거누르면닫힘</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	            <form action="<%= contextPath %>/searchId.do" method="post">
	            
	            	<!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
	            
	                <div class="form-group">
                        <label for="userName">회원 이름 : </label>
                        <input type="text" class="form-control" id="userName" placeholder="성함을 입력해주세요" name="userName" required>
	                </div>
	                <div class="form-group">
                        <label for="userEmail">이메일 :</label>
                        <input type="email" class="form-control" id="userEmail" placeholder="이메일을 입력해주세요" name="userEmail" required>
	                </div>
	                
	                <button type="submit" class="btn btn-danger">아이디 찾기</button>
	                <!-- 확실하게 사용자를 판별할 수 있는 유저번호도 같이 넘겨줌 -->
	                
	              </form>
	        </div>
	        </div>
	    </div>
	    </div>
	
			
		<!-- Button to Open the Modal -->
		<!-- 비밀번호 찾기 모달 -->
	    <div class="modal" id="searchPwdForm">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        
	        <!-- Modal Header -->
	        <div class="modal-header">
	            <h4 class="modal-title">비밀번호 찾기</h4>
	            <button type="button" class="close" data-dismiss="modal">이거누르면닫힘</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	            <form action="<%= contextPath %>/searchPwd.do" method="post">
	            
	            	<!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
	            
	                <div class="form-group">
                        <label for="searchUserName">회원 이름 : </label>
                        <input type="text" class="form-control" id="searchUserName" placeholder="성함을 입력해주세요" name="searchUserName" required>
	                </div>
	                <div class="form-group">
                        <label for="searchUserEmail">이메일 :</label>
                        <input type="email" class="form-control" id="searchUserEmail" placeholder="이메일을 입력해주세요" name="searchUserEmail" required>
	                </div>
	                <div class="form-group">
                        <label for="searchUserId">아이디 :</label>
                        <input type="text" class="form-control" id="searchUserId" placeholder="아이디를 입력해주세요" name="searchUserId" required>
	                </div>
	                
	                <button type="submit" class="btn btn-danger">비밀번호 찾기</button>
	                <!-- 확실하게 사용자를 판별할 수 있는 유저번호도 같이 넘겨줌 -->
	                
	               	<script>
	                    
	               	</script>
	              </form>
	        </div>
	        </div>
	    </div>
	    </div>

	               	<script>
	                    function searchId(){
                            // location.href="<%= contextPath %>/searchId.do"
	                    };
	                    function searchPwd(){
                            // location.href="<%= contextPath %>/searchPwd.do"
	                    };
	               	</script>






    </div> <!-- 전체 div 끝 -->
</body>
</html>