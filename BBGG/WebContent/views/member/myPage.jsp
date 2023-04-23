<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%
	Attend at = (Attend)request.getAttribute("Attend");
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
    /* border: 1px solid red; */
    margin-top: 10px;
    padding : 30px;
    height : 300px;
}
.user-info-icon{

    /* display: inline-block; */
    width: 30%; 
    height: 100%;
    float: left;
}
.info-detail{
    /* display: inline-block; */

    margin-left: 40px;
    width : 60%;
    height: 100%;
    float: left;
    border-radius: 30%;
    background-color: rgb(161, 157, 157);
}
.detail-nickname{
    margin-top: 20px;
}
.detail-nickname input{
    background-color: aliceblue;

    width: 200px;
    height: 30px;
    
    display:block;
    margin: auto;
    text-align: center;

    font-size: 20px;
    font-weight: bold;
}
.user-info>.info-detail>.user{ /* 테이블 감싸는 div요소 */
    /* border: 1px solid blue; */
    width: 300px;
    padding-top: 30px;
    margin: auto;
}
.wrap-right>.user-attendence{
    /* border: 1px solid red; */
    margin-top: 40px;
    padding : 30px;
    height : 400px;
}
.title-attendence{
    /* border:1px solid red; */
    width:100px;
    margin: auto;
    text-align: center;
}
.img-attendence{
    /* border:1px solid red; */
    float: left;
}
.info-detail table{
    margin :auto;
    background-color: bisque;
}

</style>
</head>
<body>

    <div class="wrap">
        <div class="wrap-left">
            <%@ include file="/views/common/userBar.jsp" %>
        </div>
        <div class="wrap-right">
            <div class="head-area" align="center"><!-- 마이페이지 제목 -->
                마이페이지
            </div><!-- head-area 끝 -->
            <div class="user-info"><!-- 아이콘, 사용자 정보 -->
                <div class="user-info-icon"><!-- 아이콘 -->
                    <img id="icon" src="" alt="">
                </div>
                <div class="info-detail"><!-- 사용자 정보 -->
                    <div class="detail-nickname"><!-- 닉네임 -->
                        <input type="text" value="닉네임">
                    </div>
                    <div class="user"><!-- 사용자 정보 -->
                        <table>
                            <tr>
                                <th>빵BTI : </th>
                                <% if(Integer.parseInt(loginUser.getbBti()) == 0) { %>
                                    <td>등록전</td>
                                <% } else {%>
                                    <td><%= loginUser.getbBti() %> </td>
                                <% } %>
                            </tr>
                            <tr>
                                <th>내 게시글 : </th>
                                <td id="myBoard"></td>
                            </tr>
                            <tr>
                                <th>내 리뷰 : </th>
                                <td id="myReview"></td>
                            </tr>
                            <tr>
                                <th>안 읽은 쪽지 : </th>
                                <td id="UnReadMsg">&nbsp;&nbsp;정보</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="user-attendence"><!-- 출석정보 -->

                <!-- 로그인한 사용자 고유번호 -->
            	<input type="hidden" id="userNum" name="userNum" value="<%= loginUser.getMemNo() %>">
                
                <div><!-- 출석상태 -->
                    <div class="title-attendence">
                        <h4>???</h4>
                    </div>
                    <div class="img-attendence">

						
						<!-- 결과값이 같을 때  -->    
						<% if(String.valueOf(at.getAttendDate()).equals(String.valueOf(LocalDate.now()))){ %>
                       		<img id="ttabong" src="data:image/jpeg;base64,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" alt="">
						
						<% } else { %>
						
						<!-- 결과값이 다를 때  -->
                        	<img id="ttabong" src="data:image/png;base64,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" alt="">
						<% } %>
						                
						
                    
                    </div>
                    <div>
                        <table style="margin-top : 50px;">
                            <tr>
                                <th>출석상태 : </th>
                                <% if(String.valueOf(at.getAttendDate()).equals(String.valueOf(LocalDate.now()))){ %>
                                <td id="statusAtt">출석완료</td>
                                <% } else { %>
                                <td id="statusAtt">출석완료</td>
                                <% } %>
                            </tr>
                            <tr>
                                <th>출석일 : </th>
                                <td id="dayAtt"><%= at.getAttend() %>일</td>
                            </tr>
                            <tr>
                                <th>쿠폰까지 : </th>
                                <td id="toCoupon"><%= 15 - at.getAttend() %>일</td>
                            </tr>
                            <tr>
                                <td colspan="2" id=""><progress id="progress" value="50" min="0" max="15"></progress></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <button onclick="attend();">출석체크</button>
                </div>
            </div>
            <div id="file-area">
                <!-- 이미지 : id="icon" -->
                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
            </div>

        </div><!-- wrap-right 끝 -->
    </div><!-- wrap 끝 -->

    <script>
        $(function(){ 
            /* 등록 전 이미지 고정 */
            $('#icon').attr('src', icon);
            // $('#ttabong').attr('src', icon);

            /* 파일 창 숨김 */
            $('#file-area').hide();

            /* 이미지 클릭하면 file이 클릭되도록 */
            $('#icon').click(function(){
                $('#file1').click();
            })

            // attendence();
            myboard();
        }) /* $(function()) 끝 */


        // function attendence(){
        //     // --------------------------------------- 출석 관련 ------------------------------
        //     /* 출석일 */
        //     $.ajax({
        //         url : 'countAtt.do',
        //         data : {input : $('#userNum').val()},
        //     	type : 'post',
        //     	success : function(result){
        //             $('#dayAtt').text(result);
        //             $('#toCoupon').text(15 - result);
        //     	},
        //     	error : function(){
        //             alert("출석일 수정해야함");
        //     	}
        //     }); /* 출석일 끝 */
        // }
        
        
        function myboard(){
            //-------------------------------------------------------- 마이페이지 메인 게시물 개수 조회------------------------------------------------
            /* 내 게시글 */
            $.ajax({
                url : 'myBoard.do',
                data : {input : $('#userNum').val()},
                type : 'post',
                success : function(result){
                	if(result == -1){
                        alert("고객센터에 문의바랍니다.");
                		$('#myBoard').text(0 + "개");
                	} else{
						$('#myBoard').text(result + "개");
                	}
                },
                error : function(){
                	alert("myBoard 오류");
                }
            })

            /* 내 리뷰 */
            $.ajax({
            	url : 'myReview.do',
            	data : {input : $('#userNum').val()},
            	type : 'post',
            	success : function(result){
            		if(result == -1){
                        alert("고객센터 문의");
                        $('#myReview').text(0 + "개"); 
                    } else {
                        $('#myReview').text(result + "개");
                    }
            	},
                error : function(){
                    alert("myReview 오류");
                }
            })

            /* 내 쪽지 */
			$.ajax({
            	url : 'countUnreadMsg.do',
            	data : {input : $('#userNum').val()},
            	type : 'post',
            	success : function(result){
            		if(result == -1){
                        alert("고객센터 문의");
                        $('#UnReadMsg').text(0 + "개");
                    } else{
                        $('#UnReadMsg').text(result + "개");
                    }
            	},
                error : function(){
                    alert("countUnReadMsg 오류")
                }
            })
        }








        /* 출석 버튼 클릭하면 */
        function attend(){

            if($('#ttabong').attr('src') == ttabong){
                alert("오늘은 이미 출석하셨습니다 ~ ");
            }
            else {
				$.ajax({
					url : 'afterAtt.do',
					data : {input : $('#userNum').val()},
					type : 'post',
                    async : false,
					success :function(result){
						if(result == "success"){
							$('#ttabong').attr('src', ttabong);
                            $('#statusAtt').text('출석 완료');
						} else {
							$('#ttabong').attr('src', icon);
                            $('#statusAtt').text('아직 출석 안함 ~ ');
						}
					},
					error : function(){
						console.log("버튼 출석 오류 ")
					},
				})
                /* 출석일 수 */
                $.ajax({
                    url : 'countAtt.do',
                    data : {input : $('#userNum').val()},
                    type : 'post',
                    success : function(result){
                        if(result == 15){
                            $.ajax({
                                url : 'coupon.do',
                                data : {input : $('#userNum').val()},
                                type : 'post',
                                success : function(result1){
                                    switch(result1){
                                        case 'success' : alert("쿠폰이 발행되었습니다 ~ "); break;
                                        // case 'half' : alert("고객센터 h ~ "); break;
                                        case 'fail' : alert("고객센터 f ~ "); break;
                                    }
                                },
                                error : function(){
                                    alert("출석일 수정해야함");
                                }
                            });
                            $('#dayAtt').text(0);
                            $('#toCoupon').text(15);
                        }
                        else{
                            $('#dayAtt').text(result);
                            $('#toCoupon').text(15 - result);
                        }
                    },
                    error : function(){
                        alert("출석일 수정해야함");
                    }
                });
            }
        }/* attend() 끝 */


        function loadImg(inputFile){
            if(inputFile.files.length == 1){
                let reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                   $('#icon').attr('src', e.target.result);
                }
            } else {
                $('#icon').attr('src', icon);
            }
        }

        /* 404아이콘 이미지 주소 */
        let icon = 'data:image/png;base64,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';

        /* 따봉이미지 주소 */
        let ttabong = 'data:image/jpeg;base64,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';

    </script>

    
</body>
</html>