<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<style>
    .outer{
        margin: 20px;
        padding: 20px;
    }
    #agree{
        display: block;
        width : 700px;
        height : 900px;
        margin: auto;
        margin-top: 100px;
        padding: 20px;
        background-color: antiquewhite;
    }
    #agree div{
        text-align: left;
        margin: 5px;
    }
    #buttons{
        cursor: pointer;
    }
    input{
        zoom: 1.5;
    }
    #agree textarea{
        resize: none;
        width:100%;
    }
    #buttons{
        padding-left: 200px;
        padding-top: 20px; 
    }

</style>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>

    <div class="outer"><!-- 전체 div  -->

        <div id="agree"> <!-- agree 시작 -->
            
            <div style="margin:20px;">
                <h2 align="center">회원가입</h2>
            </div>
            <div>
                <b>약관동의</b>
            </div>
            <br>
            <div>
                <input type="checkbox" id="all"> 전체동의
            </div>
            <br>
            <div>
                <input type="checkbox" class="agree"> 약관 1
            </div>
            <div class="textarea">
                <textarea name="" id="" cols="65" rows="5" readonly></textarea>
            </div>

            <br>

            <div>
                <input type="checkbox" class="agree"> 약관 2
            </div>
            <div class="textarea">
                <textarea name="" id="" cols="65" rows="5" readonly></textarea>
            </div>

            <br>
            
            <div>
                <input type="checkbox" class="agree"> 약관 3
            </div>
            <div class="textarea">
                <textarea name="" id="" cols="65" rows="5" readonly></textarea>
            </div>
            
            <div id="buttons">
                <button type="submit" class="btn-lg btn-secondary" onclick="back();" style="width:115px;">취소</button>  <!-- 메인 화면 나오면 메인으로 -->
                <button type="submit" id="next" disabled class="btn-lg btn-danger" onclick="next();">약관동의</button>
            </div>
            
        </div><!-- agree 끝 -->
    </div><!-- 전체 div 끝  -->
    
        <script>
            let nextPage = '다음으로';
            let anwser = '약관동의';
            $(function(){


                $('#all').click(function(){
                    if($('#all').prop('checked') == true){
                        $('.agree').prop('checked', true);
                        $('#next').prop('disabled', false);
                        $('#next').removeClass('btn-danger').addClass('btn-primary').html(nextPage);
                    }
                    else {
                        $('.agree').prop('checked', false);
                        $('#next').prop('disabled', true);
                        $('#next').removeClass('btn-primary').addClass('btn-danger').html(anwser);
                    }
                })

                $.each($('.agree'), function(){
                    $(this).click(function(){
                        if($('.agree:checked').length == $('.agree').length){
                            $('#all').prop('checked', true);
                        } else {
                            $('#all').prop('checked', false);
                        }
                    });
                });

                $.each($('.agree'), function(){
                    $(this).click(function(){
                        if($('.agree:checked').length == $('.agree').length){
                            $('#next').prop('disabled', false);
                            $('#next').removeClass('btn-danger').addClass('btn-primary').html(nextPage);
                        }
                        else{
                            $('#next').prop('disabled', true);
                            $('#next').removeClass('btn-primary').addClass('btn-danger').html(anwser)
                        }
                    });
                });
            });

            function next(){
                location.href="<%= contextPath %>/pathAgree.do";
            }
            function back(){
                location.href="<%= contextPath %>";
            }
        </script>
    
</body>
</html>