<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
<style>
    #signUp table *{
        padding: 10px;
    }
    #signUp{
        display: block;
        width : 700px;
        height : 900px;
        margin: auto;
        margin-top: 120px;
        padding: 20px;
        background-color: antiquewhite;
    }
    #signUp input{
        width: 350px;
    }
    #signUp #enroll:hover{
        zoom: 1.2;
    }
    #signUp #enroll{    /* 회원가입버튼 */
        margin-top : 10px;
    }
    #signUp .hidden{
        display: none;
    }
    #signUp .collect{
        color : yellowgreen;
    }
    #signUp #hiddenMsg label{
        font-size: 15px;
        color : red;
        padding : 0px;
        margin-left: 10px;
    }
    #signUp #hiddenMsg td{
        padding:0px;
    }
    tfoot label{
        font-size: 15px;
        color : red;
        padding : 0px;
        margin-left: 10px;
    }

</style>
</head>
<body>

	

    <%@ include file="/views/common/header.jsp" %>
    <div class="outer"><!-- 전체 div  -->
	
        <div id="signUp"><!-- 회원가입 폼 전체 테두리 -->

            <div style="margin:20px;">
                <h2 align="center">회원가입</h2>
            </div>


            <form action="<%= contextPath %>/insertUser.do" method="post"> <!-- onsubmit="return submit();" -->
                <table align="center" style="margin-top: 50px;">
                    <tbody>
                        <tr>
                            <th> * 아이디</th>
                            <td><input type="text" name="userId" id="userId" class="required"  placeholder="영문 대소문자, 숫자 포합 8~15자" minlength="8" maxlength="15" required></td>
                        </tr>
                        <tr id="hiddenMsg" class="hidden" height='5'>
                            <td></td>
                            <td><label>중복된 아이디가 존재합니다.</label></td>
                        </tr>
                        <tr>
                            <th> * 비밀번호</th>
                            <td><input type="password" name="userPwd" id="userPwd" class="check required"  placeholder="영문 대소문자, 숫자 포합 8~15자" minlength="8" maxlength="15" required></td>
                        </tr>
                        <tr>
                            <th> * 비밀번호 확인</th>
                            <td><input type="password" name="checkPwd" id="checkPwd" class="required" placeholder="비밀번호를 한번 더 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th> * 닉네임</th>
                            <td><input type="text" name="nickname" id="nickname" class="check required"  placeholder="영문 대소문자, 숫자 포합 8~15자" minlength="8" maxlength="15" required></td>
                        </tr>
                        
                        <tr>
                            <th> * 이름</th>
                            <td><input type="text" name="userName" id="userName" class="required" minlength="2" required></td>
                        </tr>
                        
                        <tr>
                            <th> * 이메일</th>
                            <td><input type="email" name="userEmail" id="useremail" class="required"  required></td>
                        </tr>
                        
                        <tr>
                            <th> * 전화번호</th>
                            <td><input type="text" name="userPhone" class="required" id="userPhone" placeholder="숫자만 입력하세요" minlength="10" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/, '')" required></td>
                        </tr>
                        
                        <tr>
                            <th>거주지</th>
                            <td>
                                <select name="userLocation" id="" value="" style="width :350px;">
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="부산">부산</option>
                                    <option value="여수">여수</option>
                                    <option value="제주도">제주도</option>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>생년월일</th>
                            <td><input type="date" value="" name="userBirth" placeholder="ex) 2002-02-02"></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" align="center"><input id="enroll" name="asd" type="submit" class="btn btn-info" value="회원가입" style="width : 200px;" ></td>
                            <td></td>
                        </tr>
                        <tr class="hidden" height='5'>
                            <td></td>
                            <td><label>필수항목을 확인해주세요</label></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>

        <script>

            



            var regExp = /^[a-zA-Z0-9]{8,15}$/;
            var regExp2 = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]{2,}$/;
            var regExp3 = /^[a-zA-Z0-9]{1,13}@[a-zA-Z0-9.]{1,13}$/;


            $('#enroll').on('click', function(){
                if(regExp.test($('#userId').val())){
                    if(regExp.test($('#userPwd').val())){
                        if(($('#userPwd').val()) == $('#checkPwd').val()){
                            if(regExp.test($('#nickname').val())){
                                if(regExp2.test($('#username').val())){
                                    if(regExp3.test($('#useremail').val())){
                                        if($('#userPhone').val().length > 3){
                                            return true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $('tfoot .hidden').removeClass('hidden');
                return false;
            })

        

            /* 질문 : collect 클래스를 가진것으로 판단할 수는 없을까? */
            // $('#enroll').on('click', function(){


            //     $.each($('.required'), function(){
            //         if($(this).parent().prev().hasClass('collect')){
            //             return true;
            //         }
            //         return false;
            //     })
            // })
            


            $('#userId').keyup(function(){
                if(regExp.test($(this).val())){
                    /* 정규표현식에 만족하고 */
                    $.ajax({
                        url : '<%=contextPath%>/checkId.do',
                        data : {userId : $('#userId').val()},
                        type : 'get',
                        success : function(result){
                            if(result == "possible"){
                                /* 사용가능한 아이디이면 */
                                $('#userId').parent().prev().addClass('collect');
                                $('#hiddenMsg').addClass('hidden');
                            } else{
                                $('#userId').parent().prev().removeClass('collect');
                                $('#hiddenMsg').removeClass('hidden');
                            }
                        },
                        error : function(){
                            console.log('456');
                        }
                    });
                } else{
                    $(this).parent().prev().removeClass('collect');
                    $('#hiddenMsg').addClass('hidden');
                }
            });

            // 비밀번호, 닉네임 검사 영문, 숫자 포합 8~15자
            $('.check').keyup(function(){
                if(regExp.test($(this).val())){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect');
                }
                if($('#signUp #userPwd').val().length > 7 && $('#signUp #userPwd').val() == $('#signUp #checkPwd').val()){
                    $('#signUp #checkPwd').parent().prev().addClass('collect');
                } else{
                    $('#signUp #checkPwd').parent().prev().removeClass('collect');
                }
            });

            // 비밀번호확인
            $('#checkPwd').keyup(function(){
                if($('#signUp #userPwd').val().length > 7 && $('#signUp #userPwd').val() == $('#signUp #checkPwd').val()){
                    $('#signUp #checkPwd').parent().prev().addClass('collect');
                } else{
                    $('#signUp #checkPwd').parent().prev().removeClass('collect');
                }
            });

            // 이름 확인
            $('#userName').keyup(function(){
                if($(this).val().length > 1 && regExp2.test($(this).val())){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect');
                }
            });

            // 이메일 정규식
            $('#useremail').keyup(function(){
                if(regExp3.test($(this).val())){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect')
                };
            });

            // 전화번호 입력
            $('#userPhone').keyup(function(){
                if($('#userPhone').val().length > 3){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect');
                };
            });
      
            


            
            
       

            
        </script>





    </div><!-- 전체 div 끝  -->
</body>
</html>