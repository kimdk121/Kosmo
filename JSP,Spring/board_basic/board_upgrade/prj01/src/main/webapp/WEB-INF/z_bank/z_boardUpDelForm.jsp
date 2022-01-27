

<!-- ****************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ****************************************************** -->
	<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고,이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함 -->
	<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다 -->
	<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
	<!-- 모든 JSP 페이지 상단에 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ****************************************************** -->
<!-- 현재 JSP 페이지에서 사용할 클래스 수입하기 -->
<!-- ****************************************************** -->
<%@ page import="com.naver.erp.BoardDTO"%>

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
		})
		//*******************************************
		// [게시판 등록 화면]에 입력된 데이터의 유효성 체크 함수 선언
		//*******************************************
		function checkBoardUpDelForm( upDel ){	
			//------------------------------------------------
			// 매개변수로 들어온 upDel 에 "up" 이 저장되었으면
			// 즉, 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
			//------------------------------------------------
			if(upDel=='up'){
				if(confirm("정말 수정하시겠습니까?")==false) {return;}
				$("[name=upDel]").val("up");
			}
			//------------------------------------------------
			// 매개변수로 들어온 upDel 에 "del" 이 저장되었으면
			// 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
			//------------------------------------------------
			else if(upDel=='del'){
				if(confirm("정말 삭제하시겠습니까?")==false) {return;}
				$("[name=upDel]").val("del");
			}

					alert( $("[name=boardUpDelForm]").serialize()  )
						return;
			//------------------------------------------------
			// 현재 화면에서 페이지 이동 없이 
			// 서버쪽 "/boardUpDelProc.do" 로 접속해서 수정 또는 삭제하기
			//------------------------------------------------
			$.ajax({
					//-------------------------------
					// 서버 쪽 호출 URL 주소 지정
					//-------------------------------
					url : "/boardUpDelProc.do"
					//-------------------------------
					// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
					//-------------------------------
					, type : "post"
					//-------------------------------
					// 웹서버로 보낼 파라미터명과 파라미터명값을 지정
					//-------------------------------
					, data : $("[name=boardUpDelForm]").serialize()
					//-------------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
					// 즉 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
					// 응답메시지 안의 html 소스는 boardUpDelProc.jsp 의 실행 결과물이다.
					//------------------------------- 

					, success : function(responseHtml){
							//----------------------------------
							var msg = $(responseHtml).filter(".msg").text();
							var boardUpDelCnt = $(responseHtml).filter(".boardUpDelCnt").text();
							//----------------------------------
							if( upDel=="up"){
								msg = $.trim(msg);
								if( msg!="" ){
									alert( msg );
									return;
								}
								if( boardUpDelCnt==-1 ){
									alert( "게시판 글이 삭제 되었습니다." );
									location.replace("/boardList.do")
								}
								else if( boardUpDelCnt==-2 ){
									alert( "암호가 틀립니다" );
									$("[name=pwd]").val("");
								}
								else if( boardUpDelCnt==1 ){
									alert( "수정 성공" );
									if(confirm("목록 화면으로 이동할까요?")==true){
										location.replace("/boardList.do")
									}
								}
								else{
									alert( "서버 에러발생! 관리자에게 문의 바람" );
								}
							}
							else if( upDel=="del"){
								if( boardUpDelCnt==1 ){
									alert( "삭제 성공" );
									location.replace("/boardList.do")
								}
								else if( boardUpDelCnt==-1 ){
									alert( "게시판 글이 삭제 되었습니다." );
									location.replace("/boardList.do")
								}
								else if( boardUpDelCnt==-2 ){
									alert( "암호가 틀립니다" );
									$("[name=pwd]").val("");
								}
								else if( boardUpDelCnt==-3 ){
									alert( "댓글이 있어 삭제가 불가능합니다" );
								}
								else{
									alert( "서버 에러발생! 관리자에게 문의 바람" );
								}
							}
					}
					//-----------------------------------------------------
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
	<%
	BoardDTO boardDTO = (BoardDTO)request.getAttribute("boardDTO");
	int b_no = 0;
	if( boardDTO!=null){
		b_no = boardDTO.getB_no();
		String subject = boardDTO.getSubject();
		String content = boardDTO.getContent();
		String writer = boardDTO.getWriter();
		String reg_date = boardDTO.getReg_date();
		int readcount = boardDTO.getReadcount();
		String email = boardDTO.getEmail();
	%>
	<!--**********************************************************-->
	<!-- [게시판 글쓰기] 화면을 출력하는 form 태그 선언 -->
	<!--**********************************************************-->
	<form name="boardUpDelForm">
		
		<input type="hidden" name="b_no" value="<%=b_no%>">
		<input type="hidden" name="upDel">

		<table border=1>
			<caption>게시판 수정/삭제</caption>
			<tr>
				<th bgcolor="lightgray">이 름</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" size="10" name="writer" class="writer" maxlength=10 value="<%=writer%>">
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">제 목</th>
				<td>
				<!--------------------------------------------------------> 
				<input type="text" size="40" name="subject" class="subject" maxlength=30 value="<%=subject%>">
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">이메일</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="email" class="email" size="40" maxlength='30' value="<%=email%>">
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th bgcolor="lightgray">내 용</th>
				<td>
				<!-------------------------------------------------------->
				<textarea name="content"  class="content" rows="13" cols="40"  maxlength=300><%=content%></textarea>
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
		<input type="button" value="수정" onClick="checkBoardUpDelForm('up')">
		<input type="button" value="삭제" onClick="checkBoardUpDelForm('del')">
		<input type="button" value="목록보기" onClick="location.replace('/boardList.do');">
	</form>
	<%
	} 
	else{
		out.print("<script>alert('삭제된 글입니다'); location.replace('/boardList.do');</script>");
	}
	%>
</body>
</html>