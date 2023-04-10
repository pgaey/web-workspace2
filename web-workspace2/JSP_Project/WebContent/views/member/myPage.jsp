<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보를 바꿔줘 ~</title>
   
<style>
    .outer{
        background-color : rgb(100, 190, 100);
        width : 1000px;
        margin : auto;
        color : white;
        margin-top : 5px;
    }

    #mypage-form input{margin : 5px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		
		// 필수 X
		String phone = (loginUser.getPhone() == null)? "" : loginUser.getPhone();
		String email = (loginUser.getEmail() == null)? "" : loginUser.getEmail();
		String address = (loginUser.getAddress() == null)? "" : loginUser.getAddress();
		
		String interest = (loginUser.getInterest() == null)? "" : loginUser.getInterest();
	%>
    <div class="outer">
        <br>
        <h2 align="center">마이페이지</h2>

        <form action="<%=contextPath%>/update.me" method="post" id="mypage-form">

            <table align="center">
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" readonly value="<%= userId %>" maxlength="12" required></td>
                    <!-- <td><input type="text" name="userId" readonly value="<%= loginUser.getUserId() %>" maxlength="12" required></td> -->
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" value=<%= userName %> maxlength="5" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder = "-포함해서 입력해주세요" value=<%= phone %>></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email" value=<%= email %>></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address" value=<%= address %>></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;취미</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="travel" value="여행">여행<label for="travel"></label>
                        <input type="checkbox" name="interest" id="workout" value="운동">운동<label for="workout"></label>
                        <input type="checkbox" name="interest" id="bread" value="빵">빵<label for="bread"></label>

                        <br>

                        <input type="checkbox" name="interest" id="livealone" value="자취">자취<label for="livealone"></label>
                        <input type="checkbox" name="interest" id="market" value="중고거래">중고거래<label for="market"></label>
                        <input type="checkbox" name="interest" id="java" value="java">자바<label for="java"></label>
                    </td>
                </tr>
            </table>

            <br><br>

            <script>
                
    
                
                var interest = '<%= interest %>';
                // 여행, 운동, java
                
                // 모든 체크박스가 배열에 담김
                $('input[type=checkbox]').each(function(){
                    
                    // 순차적으로 접근한 checkbox의 value속성값이 interest에 포함되어있을 경우 체크
                    // => checked속성 => attr(속성명, 속성값);

                    // 자바스크립트의 indexOf => 찾고자하는 문자가 없을 경우 -1을 리턴 == 제이쿼리 search메소드
                    // 제이쿼리에서 value속성값을 리턴해주는 메소드 : val()
                    // 제이쿼리에서 현재 접근한 요소 지칭 : $(this)
                    if(interest.search($(this).val()) != -1){ // 포함되어 있을 경우 =? checked부여 
                        $(this).attr('checked', true);

                    };


                });




            </script>


            <div align="center">
                <button type="submit" class="btn-info">정보수정</button>
                <button type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호수정</button>
                <button type="button" class="btn-danger" data-toggle="modal" data-target="#deleteMem">회원탈퇴</button>
            </div>


            <br><br><br>
        </form>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- Button to Open the Modal -->

    <!-- 비밀번호 변경 모달창 -->
    <div class="modal" id="updatePwdForm">
    <div class="modal-dialog">
        <div class="modal-content">
        
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">로그인</h4>
            <button type="button" class="close" data-dismiss="modal">이거누르면닫힘</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <form action="<%= contextPath %>/updatePwd.me" method="post">
            
            	<!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
            
                <div class="form-group">
                  <label for="userPwd">현재 비밀번호 : </label>
                  <input type="password" class="form-control" id="userPwd" placeholder="비밀번호를 입력해주세요" name="userPwd" required>
                </div>
                <div class="form-group">
                  <label for="updatePwd">변경할 비밀번호 :</label>
                  <input type="password" class="form-control" id="updatePwd" placeholder="변경할 비밀번호를 입력해주세요" name="updatePwd" required>
                </div>
                <div class="form-group">
                  <label for="updatePwd">변경할 비밀번호 확인 :</label>
                  <input type="password" class="form-control" placeholder="변경할 비밀번호를 다시 입력해주세요" name="checkPwd" required>
                </div>
                
                <button type="submit" class="btn btn-danger" onclick="return validatePwd()">비밀번호 변경</button>
                <!-- 확실하게 사용자를 판별할 수 있는 유저번호도 같이 넘겨줌 -->
                <input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo">
                
               	<script>
                    function validatePwd(){

                        if($('#updatePwd').val() != $('input[name=checkPwd]').val()){
                            alert("비밀번호를 동일하게 입력해주세요 ! ");
                            $('input[name=checkPwd]').focus();
                            return false;
                        }
                        else {
                            return true;
                        }
                    };
               	</script>
                
              </form>
        </div>

        </div>
    </div>
    </div>
    
    
    
    <!-- 회원탈퇴 모달창  -->
	<div class="modal" id="deleteMem">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        

	        <!-- Modal body -->
	        <div class="modal-body">
	            <form action="<%= contextPath %>/deleteMem.me" method="post">
	            
	                <div class="form-group">
	                  <label for="userPwd2">비밀번호를 입력하세요 </label>
	                  <input type="password" class="form-control" id="userPwd2" placeholder="비밀번호를 입력해주세요" name="userPwd2" required>
	                </div>

	                
	                <button type="submit" class="btn btn-danger" onclick="return deleteMem()">회원탈퇴</button>
	                
	                <!-- 확실하게 사용자를 판별할 수 있는 유저번호도 같이 넘겨줌 -->
	                <input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo">
	
					<script>
                    function deleteMem(){

                        if($('#userPwd2').val() != '<%= loginUser.getUserPwd() %>'){
                            alert("일치하지 않습니다!");
                            return false;
                        }
                        else {
                            return true;
                        }
                    };
               	</script>














</body>
</html>