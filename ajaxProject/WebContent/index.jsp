<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운걸 또 배우는 날이다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>

	<h1>AJAX개요</h1>

	<p>
		Asynchronus JavaScript And XML의 약자로 <br>
		서버로부터  데이터를 가져와서 전체페이지를 새로 고치지 않고 
		일부만 로드해 내용물만 바꿀 수 있는 기법 <br><br>
		
		
		참고로, 우리가 기존에 a태그를 이용해서 요청 및 form태그를 이용해서 요청한 방식은 동기식 요청! <br>
		=> 응답페이지가 돌아와야 그 결과를 볼 수 있었다(== 페이지 화면이 한 번 깜빡거린다) <br><br>
	
		비동기식 요청을 보내기 위해서는 AJAX라는 기술이 필요함 <br><br>
		* 동기식 / 비동기식 요청 차이 <br>
		- 동기식 : 요청 처리 후 해당하는 응답 HTML데이터가 돌아와야만 그 다음 작업이 가능 <br>
				 만약 서버에서 응답페이지를 돌려주는 시간이 지연되면 무작정 기아려야 함 <br>
				 전체 페에지가 리로드됨(새로고침, 페이지가 기본적으로 한 번 깜빡거리면서 넘어감)<br><br>
		- 비동기식 : 현재페이지는 그대로 유지하면서 중간중간마다 추가적인 요청을 보내줄 수 있고 <br>
				    요청을 한다고 해서 다른 페이지로 넘어가지 않음 (현재 페이지 그대로 유지) <br>
				    요청을 보내놓고 그에 해당하는 응답이 돌아올 때까지 현재 페이지에서 다른 작업을 할 수 있음(페이지가 깜빡거리지 않음) <br>
		예 ) NAVER 아이디 중복체크 기능, 댓글, 검색어 자동환성 등 <br><br>
	
		* 비동기식 단점 <br>
		- 페이지 내 복잡도가 기하급수적으로 증가 => 에러 발생 시 디버깅이 어려움 <br>
		- 요청 후 돌아온 응답데이터를 가지고 현재 페이지에서 새로운 요소를 동적으로 만들어서 뿌려줘야함
		=> DOM요소를 새롭게 만들어내는 구문을 잘 익혀둬야함 <br><br>
		
		* AJAX구현방식 : JavaScript방식 / jQuery방식 <br>
		=> jQuery가 코드가 간결하고 사용하기 쉬움 <br><br>
	</p>
	
	<pre>
	
	
		* jQuery에서의 AJAX통신
		
		[ 표현법 ]
		$.ajax({
			속성명 : 속성값,
			속성명 : 속성값,
			속성명 : 속성값,
			...
		});

		* 주요속성
		- url : 요청할 url(필수로 작성) => form태그의 action속성
		- type : 요청 전송방식(GET/POST 생략 시 기본값은 GET) => form태그의 method속성 
		- data : 요청 시 전달할 값({키:밸류, 키:밸류}...) => form태그의 input태그에 입력한 값
		- success : AJAX통신 성공 시 실행할 함수를 정의
		
		
		- error : AJAX통신 실패 시 실행할 함수를 정의
		- complete : AJAX통신을 성공하든 실패든간에 무조건 끝나면 실행할 함수를 정의
		- async : 서버와의 비동기 처리 방식 설정 여부 (기본값 true)
	</pre>
	
	<hr>
	
	<h1>jQuery방식을 이용한 AJAX테스트</h1>
	
	<h3>1. 버튼 클릭 시 get방식으로 서버에 데이터 전송 및 응답</h3>

	입력 : <input type="text" id="input1">
	<button id="btn1">전송</button>
	<br>
	
	응답 : <label id="output1">현재 응답 없음</label>

	<script>
		$(function(){
		
			$('#btn1').click(function(){
				
				// 동기식 요청 : location.href = "요청url?쿼리스트링";
			
				// 비동기식 요청 : 
				$.ajax({
					url : 'jqAjax1.do',
					data : {input : $('#input1').val()},
					type : 'get',
					success : function(result){
						console.log("AJAX통신 성공 ! ");
						console.log(result);
						$('#output1').text(result);
					},
					error : function(){
						alert("AJAX통신 실패 ㅜㅜ");
					},
					complete : function(){   // 성공이든 실패든...
						console.log("sdfsdf");
					}
					
				});
				
				
				
				
			});
			
					
			
			
			
		});
	</script>
























	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>