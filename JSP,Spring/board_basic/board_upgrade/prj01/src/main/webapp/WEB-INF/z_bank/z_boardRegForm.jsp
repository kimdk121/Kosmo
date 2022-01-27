<!-- ****************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ****************************************************** -->
	<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고,이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함 -->
	<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다 -->
	<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
	<!-- 모든 JSP 페이지 상단에 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ****************************************************** -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 -->
<!--								common.jsp 파일 내의 소스를 삽입하기 -->	
<!-- ****************************************************** -->
<%-- <%@include file="common.jsp" %> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<script>
		$(document).ready(function(){
			$(".writer").val("사오정");
			$(".subject").val("취업 빨리해야지....");
			$(".email").val("abc@naver.com");
			$(".content").val("어쩌구 저쩌구...");
			$(".pwd").val("1234");
		})
		//*******************************************
		// [게시판 등록 화면]에 입력된 데이터의 유효성 체크를 자스로 하지 않고
		// 비동기 방식으로 서버에 "/boardRegProc.do" 로 접속하는 함수 선언
		//*******************************************
		function checkBoardRegForm(){	
			// 유효성 체크
			//------------------------------------
			// "정말 등록 하시겠습니까?" 라고 물어보기
			//------------------------------------
			if(confirm("정말 등록 하시겠습니까??")==false) {return;}

			//alert(  $("[name=boardRegForm]").serialize()   );
			//return;
			//--------------------------------------
			// 현재 화면에서 페이지 이동 없이(=비동기 방식으로)
			// 서버쪽 boardRegProc.do 로 접속하여 게시판 글쓰기를 하고 
			// 글쓰기 성공 여부를 알려주기
			//--------------------------------------
			$.ajax({
					//-------------------------------
					// 서버 쪽 호출 URL 주소 지정
					//-------------------------------
					url : "/boardRegProc.do"
					//-------------------------------
					// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
					//-------------------------------
					, type : "post"
					//-------------------------------
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					//-------------------------------
					, data : $("[name=boardRegForm]").serialize()
					//----------------------------------------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
					// 즉 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
					// 응답메시지 안의 html 소스는 boardRegProc.jsp 의 실행 결과물이다.
					//----------------------------------------------------------
					, success : function(responseHtml){

						var msg = $(responseHtml).filter(".msg").text();
						msg = $.trim(msg);

						if( msg!=null && msg.length>0 ){
							alert(msg);
							return;
						}
						//---------------------------------
						// 매개변수로 들어온 html 소스에서 class="boardRegCnt" 가진 태그가 끌어안고 있는 숫자 꺼내기
						// 게시판 글 입력 성공 행의 개수 꺼내기.
						// 꺼낸 개수의 앞뒤 공백 제거하기
						//---------------------------------
						var boardRegCnt = $(responseHtml).filter(".boardRegCnt").text();
						boardRegCnt = $.trim(boardRegCnt);
						boardRegCnt  = parseInt(boardRegCnt,10);
						//---------------------------------
						// 게시판 글 입력 성공 행의 개수가 1이면, 즉 입력이 성공했으면
						//---------------------------------
						if( boardRegCnt==1 ){
							<% if( request.getParameter("b_no")==null ) {%>
								alert("새글쓰기 성공")
							<% }else{ %>
								alert("댓글쓰기 성공")
							<% } %>
							//location.replace("/boardList.do")
						}
						//---------------------------------
						// 그렇치 않고, 즉 입력이 실패했으면
						//---------------------------------
						else{
							<% if( request.getParameter("b_no")==null ) {%>
								alert("새글쓰기 실패!")
							<% }else{ %>
								alert("댓글쓰기 실패!")
							<% } %>
						}
					}
					//----------------------------------------------------------
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					//----------------------------------------------------------
					, error : function(){
						alert("서버 접속 실패");
					}
			});
		}
	</script>
</head>

<body><center>

	<!--**********************************************************-->
	<!-- [게시판 글쓰기] 화면을 출력하는 form 태그 선언 -->
	<!--**********************************************************-->
	<form name="boardRegForm" method="post" action="/boardRegProc.do">
		
		<table border=1>
			<% if( request.getParameter("b_no")==null ) {%>

				<caption>새글쓰기</caption>

			<% }else{ %>

				<caption>댓글쓰기</caption>

			<% } %>

			<tr>
				<th bgcolor="lightgray">이 름</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" size="10" name="writer" class="writer" maxlength=10>
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">제 목</th>
				<td>
				<!--------------------------------------------------------> 
				<input type="text" size="40" name="subject" class="subject" maxlength=30>
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">이메일</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="email" class="email" size="40" maxlength='30' >
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">내 용</th>
				<td>
				<!-------------------------------------------------------->
				<textarea name="content"  class="content" rows="13" cols="40"  maxlength=300></textarea>
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">비밀번호</th>
				<td>
				<!-------------------------------------------------------->
				<input type="password" name="pwd" class="pwd"  size="8"  maxlength=4>
				<!-------------------------------------------------------->
				</td>
			</tr>
		</table>
		<div style="height:6px"></div>
		<input type="button" value="저장" onClick="checkBoardRegForm()">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" onClick="location.replace('/boardList.do')">

		<!-------------------------------------------------------->
		<!-- 만약 파명 b_no 의 파값이 null 이면 name="b_no" 를 가진 hiddden 태그의 value 에 0 입력하기->
		<!-- 만약 파명 b_no 의 파값이 null 아니면 name="b_no" 를 가진 hiddden 태그의 value 에 파값을 입력하기->
		<!-------------------------------------------------------->
		<% if( request.getParameter("b_no")==null ) {%>
				<input type="hidden" name="b_no" value="0">
		<% }else{ %>
				<input type="hidden" name="b_no" value="<%=request.getParameter("b_no")%>">
		<% } %>

		<div class=logout></div>
	</form>
</body>
</html>