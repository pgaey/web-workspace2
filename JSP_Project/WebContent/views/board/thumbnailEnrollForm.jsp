<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진을 써라</title>
<style>
    .outer{
        background-color : rgb(100, 190, 100);
        width : 1000px;
        margin : auto;
        color : white;
        margin-top : 5px;
    }

    #enroll-form > table{
        border: 1px solid white;
    }
    #enroll-form input, #enroll-form textarea{
        width : 100%;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진 게시글 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.th" id="enroll-form" method="post" enctype="multipart/form-data">


            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">



            <table align="center" border="1">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3"><input type="text" required name="title"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <textarea name="content" style="resize:none" rows="10"></textarea>
                    </td>
                </tr>
                <!-- 미리보기 영역 -->
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleimg" width="250" height="180" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td><img id="contentImg1" width="150" height="110" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU"></td>
                    <td><img id="contentImg2" width="150" height="110" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU"></td>
                    <td><img id="contentImg3" width="150" height="110" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU"></td>
                </tr>
            </table>
            <br>

            <div id="file-area">
                <input type="file" id="file1" name="file1" required onchange="loadImg(this, 1);">
                <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
            </div>
            <!-- onchange : input 태그의 내용물이 변경되었을 때 발생하는 이벤트 속성 -->
            <!-- loadImg() : 우리가 만들 함수 -->

            <script>
                $(function(){
                    $('#file-area').hide();

                    $('#titleimg').click(function(){
                        $('#file1').click();
                    })
                    $('#contentImg1').click(function(){
                        $('#file2').click();
                    })
                    $('#contentImg2').click(function(){
                        $('#file3').click();
                    })
                    $('#contentImg3').click(function(){
                        $('#file4').click();
                    })

                })


                function loadImg(inputFile, num){

                    // inputFile : 현재 변화가 생긴 <input type="file"> 요소객체
                    // num : 몇 번째 input요소인지 확인 후 해당 영역에 미리보기를 하기 위해서 받아줌

                    //console.log(inputFile.files.length);
                    // inputFile.files.length : 파일을 첨부 1, 파일 선택취소 0
                    // => 파일의 존재 유무를 알 수 있다. inputFile.files[0]에 선택된 파일이 담겨있음

                    // files속성 : 업로드된 파일의 정보들을 배열형식으로 여러개 묶어서 반환

                    if(inputFile.files.length == 1){ // 파일이 첨부!

                        // 선택된 파일을 읽어서 영역에 맞는 미리보기

                        // 파일을 읽어들일 FileReader객체 생성
                        let reader = new FileReader();

                        //console.log(inputFile.files[0]);
                        // FileReader객체로부터 파일을 읽어들이는 메소드를 호출
                        // 인자값으로 전달해줌
                        reader.readAsDataURL(inputFile.files[0]);
                        // 해당 파일을 읽어들이는 순간 파일만의 고유한 겁나긴 url이 부여됨
                        // 해당 url을 가지고 src속성의 값으로 부여할 것(attr)
                        
                        // 파일 읽기가 완료되면 실행할 함수를 정의
                        reader.onload = function(e){
                            // e의 target = e.target => 이벤트 당한놈

                            //console.log(e.target);

                            // e.target.result에 각 파일의 url이 담긴다

                            // 각 영역에 맞춰서 이미지 미리보기
                            switch(num){
                                case 1 : $('#titleimg').attr('src', e.target.result); break;
                                case 2 : $('#contentImg1').attr('src', e.target.result); break;
                                case 3 : $('#contentImg2').attr('src', e.target.result); break;
                                case 4 : $('#contentImg3').attr('src', e.target.result); break;
                            }
                        }
                    }
                    else {
                        switch(num){
                                case 1 : $('#titleimg').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU'); break;
                                case 2 : $('#contentImg1').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU'); break;
                                case 3 : $('#contentImg2').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU'); break;
                                case 4 : $('#contentImg3').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAL3RD7eG2uJrloqOi45dou7A0pylx6lVuMA&usqp=CAU'); break;
                            }
                    }

                }
            </script>

            

            <br>
            <div align="center">
                <button type="submin">작성하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>


        <br><br><br>
    </div>






















</body>
</html>
