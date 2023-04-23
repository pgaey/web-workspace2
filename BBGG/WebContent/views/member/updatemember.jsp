<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
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
    #updateUser table *{
        padding: 10px;
    }
    #updateUser{
        display: block;
        width : 700px;
        height : 900px;
        margin: auto;
        margin-top: 120px;
        padding: 20px;
        background-color: antiquewhite;
    }
    #updateUser input{
        width: 350px;
    }
    #updateUser #update:hover{
        zoom: 1.2;
    }
    #updateUser #delete:hover{
        zoom: 1.2;
    }
    #updateUser #update{    /* 회원가입버튼 */
        margin-top : 10px;
    }
    #updateUser .collect{
        color : yellowgreen;
    }
    #tf-updateMem label{
        font-size: 15px;
        color : red;
        padding : 0px;
        margin-left: 10px;
    }
    .readonly{
        background-color: gray;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div class="wrap-left">
            <%@ include file="../common/userBar.jsp" %>
        </div>
        <div class="wrap-right">
            <div id="updateUser"><!-- 개인정보수정 전체 -->

                <div style="margin:20px;">
                    <h2 align="center">회원가입</h2>
                </div>
    
    
                <form action="<%= contextPath %>/updateUser.do" method="post">
                    <table align="center" style="margin-top: 50px;">
                        <input type="hidden" name="memNo" id="memNo" value="<%= loginUser.getMemNo() %>">
                        <tbody>
                            <tr>
                                <th> 아이디</th>
                                <td><input type="text" name="userId" id="userId" class="required readonly"  value=<%= loginUser.getId() %> readonly></td>
                            </tr>
                            <tr>
                                <th> * 현재 비밀번호</th>
                                <td><input type="password" name="beforePwd" id="beforePwd" class="required"  placeholder="현재 비밀번호를 입력해주세요" minlength="8" maxlength="15" required></td>
                            </tr>
                            <tr>
                                <th> * 변경할 비밀번호</th>
                                <td><input type="password" name="afterPwd" id="afterPwd" class="check required" placeholder="영문 대소문자, 숫자 포합 8~15자" minlength="8" maxlength="15" required></td>
                            </tr>
                            <tr>
                                <th> * 변경할 비밀번호 확인 </th>
                                <td><input type="password" name="checkPwd" id="checkPwd" class="check required"  placeholder="변경할 비밀번호를 입력해주세요" minlength="8" maxlength="15" required></td>
                            </tr>
                            <tr>
                                <th> * 닉네임 </th>
                                <td><input type="text" name="nickname" id="nickname" class="check required" value="<%= loginUser.getNickname() %>" placeholder="영문, 숫자 포함 8~15자" minlength="8" maxlength="15" required></td>
                            </tr>
                            
                            <tr>
                                <th> 이름</th>
                                <td><input type="text" name="userName" id="userName" class="required readonly" value="<%= loginUser.getName() %>"></td>
                            </tr>
                            
                            <tr>
                                <th> 이메일</th>
                                <td><input type="email" name="userEmail" id="useremail" class="required" value="<%= loginUser.getEmail() %>" required></td>
                            </tr>
                            
                            <tr>
                                <th> 전화번호</th>
                                <td><input type="text" name="userPhone" class="required" id="userPhone" value="<%= loginUser.getPhone() %>" placeholder="숫자만 입력하세요" minlength="10" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/, '')" required></td>
                            </tr>
                            
                            <tr>
                                <th>거주지</th>
                                <td>
                                    <select name="userLocation" id="userLocation" value="<%= loginUser.getLocation() %>" style="width :350px;">
                                        <option value="서울">서울</option>
                                        <option value="경기">경기</option>
                                        <option value="부산">부산</option>
                                        <option value="여수">여수</option>
                                        <option value="제주도">제주도</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot id="tf-updateMem">
                            <tr>
                                <td colspan="2" align="center"><input id="update" name="update" type="submit" class="btn btn-info" value="정보수정" style="width : 200px;" ></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input id="delete" name="delete" type="button" class="btn btn-danger" value="회원탈퇴" style="width : 200px;">
                                </td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </form>
            </div>
        </div>

    <script>
        $(function(){  
            
            // select 목록을 유저의 기존 목록이 먼저 보이게 나열
            var Userlocation = '<%= loginUser.getLocation() %>'; /* 로그인 유저 거주지 */
            var opt = []; /* 빈 배열 생성 */

            for(var i = 0; i < $('option').length; i++){
                if($('option')[i].value != Userlocation){   /* 유저 거주지랑 다른 값일 경우 */
                    opt.push('<option value="' + $('option')[i].value + '">' + $('option')[i].value + '</option>');
                } else{ /* 유저 거주지와 일치할 경우 */
                    opt.unshift('<option value="' + Userlocation + '">' + Userlocation + '</option>');
                }
            }
            $('#userLocation').html(opt)


            
            // 비밀번호, 닉네임 검사 영문, 숫자 포합 8~15자
            var regExp = /^[a-zA-Z0-9]{8,15}$/;

            // 로딩되었을 때 닉네임이 조건에 해당되는지
            if(regExp.test($('#nickname').val())){
                $('#nickname').parent().prev().addClass('collect');
            } else{
                $('#nickname').parent().prev().removeClass('collect');
            }

            // 현재 비밀번호 검사식
            $('#beforePwd').keyup(function(){
                if($('#beforePwd').val() == '<%= loginUser.getPwd() %>'){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect');
                }
            });

            // 변경할 비밀번호 입력할 때
            $('.check').keyup(function(){
                if(regExp.test($(this).val())){
                    $(this).parent().prev().addClass('collect');
                } else{
                    $(this).parent().prev().removeClass('collect');
                }
                if($('#afterPwd').val().length > 7 && $('#afterPwd').val() == $('#checkPwd').val()){
                    $('#checkPwd').parent().prev().addClass('collect');
                } else{
                    $('#checkPwd').parent().prev().removeClass('collect');
                }
            });
            
            // 변경비밀번호 확인
            $('#checkPwd').keyup(function(){
                if($('#afterPwd').val().length > 7 && $('#afterPwd').val() == $('#checkPwd').val()){
                    $('#checkPwd').parent().prev().addClass('collect');
                } else{
                    $('#checkPwd').parent().prev().removeClass('collect');
                }
            });

            // 정보수정 누를 때
            $('#update').on('click', function(){
                if(($('#afterPwd').val()) == $('#checkPwd').val()){
                    if($('#beforePwd').val() == '<%= loginUser.getPwd() %>'){
                        return true;
                    }
                }
                alert("입력한 내용을 확인해주세요")
                return false;
            })




        })
    </script>

</body>
</html>