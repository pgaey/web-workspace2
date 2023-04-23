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
.message-main{
    border: 1px solid red;
    height : 100%;
}
#empty{ /* 위쪽 빈 공간 */
    /* border : 1px solid red; */
    height : 5%;
}
#msgLeftBar{
    border : 1px solid blue;
    float: left;
    height : 750px; 
    width : 15%;
}
#msgLeftBar div{
    text-align: center;
}
#mainMsgSpace{
    border: 1px solid red;
    margin-left : 15%;

}
#mainMsgSpace>div{
    border:1px solid red;
    margin-left : 10px;
    display: inline-block;


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
                <p>쪽지</p>
            </div><!-- head-area 끝 -->
            <div class="message-main">
                <div id="empty"><!-- 위에 빈공간 -->

                </div>
                <div>
                    <div id="msgLeftBar"><!-- 왼쪽 메뉴바 -->
                        <div>
                            <button class="btn btn-info">쪽지쓰기</button>
                        </div>
                        <div><!-- 받은 쪽지, 보낸 쪽지 -->
                            <li>a</li>
                            <li>s</li>
                        </div>
                    </div>

                    <div id="mainMsgSpace"><!-- 메세지 본 공간 -->
                        <div><!-- 메세지 본 공간 위 메뉴바 -->
                            <span>
                                <input type="checkbox">
                                <button class="btn btn-info">읽음</button>
                                <button class="btn btn-danger">삭제</button>
                                <button>안읽음 삭제</button>
                            </span>
                            <div style="display :inline-block; border:1px solid blueviolet; margin-left:200px;">
                                <input type="text" value="dd"> 
                                <select name="" id="">
                                    <option value="1">최신날짜</option>
                                    <option value="2">오래된 날짜</option>
                                    <option value="3">이름 내림차순</option>
                                    <option value="3">이름 오름차순</option>
                                </select>
                            </div>
                        </div>
                        <div><!-- 메세지 나열 되는 공간 -->
                            <table style="margin-top: 20px; border: 1px solid black;">
                                <thead style="background-color : rgb(161, 156, 156);">
                                    <tr> 
                                        <th><input type="checkbox"></th>
                                        <th width="100px;">보낸 사람</th>
                                        <th width="500px;">내용</th>
                                        <th width="50px;">날짜</th>
                                    </tr>
                                </thead>
                                    <!-- 읽지 않은 쪽지는 a태그 밑줄만 지우고
                                         읽었을 경우에는 회색으로 스타일변경 -->
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>한상우</td>
                                        <td>안녕하세요</td>
                                        <td>보낸 날짜</td>
                                    </tr>
                                    


                                </tbody>
                                <tfoot>

                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            
















            </div>
        </div>
</body>
</html>