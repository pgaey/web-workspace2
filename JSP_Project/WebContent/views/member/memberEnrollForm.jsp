<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입해라</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
    .outer{
        background-color : rgb(100, 190, 100);
        width : 1000px;
        margin : auto;
        color : white;
        margin-top : 5px;
    }

    #enroll-form input{margin : 5px;}

    table input{
        background-color:rgb(51, 138, 51);
        border : 1px solid white;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">회원가입</h2>

        <form action="<%=contextPath%>/insert.me" method="post" id="enroll-form">
            <!--아이디, 비밀번호, 이름, 전화번호, 이메일, 주소, 취미-->

            <table align="center">
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required></td>
                    <td><button type="button" onclick="idCheck();">중복확인</button></td>
                    <!-- 중복확인 나중에 AJAX배우고 다음주 금요일쯤..? -->
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" maxlength="15" required></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="5" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="-포함해서 입력해주세요"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address"></td>
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

            <div align="center">
                <button type="submit" disabled>회원가입</button>
                <button type="reset">초기화</button>
            </div>


            <br><br><br>
        </form>
    </div>

	<script>
		function idCheck(){
			
			// 아이디 인풋태그로부터 값을 뽑아와야함 => 인풋요소 자체를 먼저 접근
			var $userId = $('#enroll-form input[name=userId]');
			// name이 userId인 요소가 menubar.jsp에도 있기 때문에 더 디테일하게 선택해야함
			
			// AJAX컨트롤러로 요청하기
			$.ajax({
				url : 'idCheck.me',
				data : {checkId : $userId.val()},
				success : function(result){
					// console.log(result);
					// result 경우의 수 : "NNNNN" / "NNNNY" 
					
					// 동등비교연산으로 문자열 따지기
					if(result == 'NNNNN'){ // 중복된 아이디 == 사용불가
						alert('이미 존재하거나 탈퇴한 회원의 아이디입니다');
						// 재입력 유도
						$userId.val('').focus();
					}
					else{ // 중복 X == 사용가능
						
						// 알림창 => confirm();
						if(confirm('사용가능한 아이디 입니다. 사용하시겠습니까?')){
							
							// 중복확인 전에 막아두었던 submit버튼을 활성화!
							$('#enroll-form button[type=submit]').removeAttr("disabled");
							
							// 아이디 값은 이후에 변경 불가능하도록 ==> readonly
							$userId.attr('readonly', true);
							
						}
						else {
							$userId.focus();
						}
						
						
					}
				},
				error : function(){
					console.log('AJAX 아이디 중복체크 통신 실패 ! ');	
				},
				
				
					
					
					
					
					
					
					
					
					
			});
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}
		
	</script>



























</body>
</html>