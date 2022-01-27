

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
<%@include file="common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> "
<head>
	<script>
		$(document).ready(function(){
				$(".pwd").val(1234);
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

			//------------------------------------
			// form 태그에 파일업로드 전송 관련 설정하기
			//------------------------------------
			document.boardUpDelForm.enctype="multipart/form-data";
			
			//------------------------------------------------
			// 현재 화면에서 페이지 이동 없이 
			// 서버쪽 "/boardUpDelProc.do" 로 접속해서 수정 또는 삭제하기
			//------------------------------------------------
			$.ajax({
					//-------------------------------
					// 서버 쪽 호출 URL 주소 지정
					//-------------------------------
					url : "/${requestScope.naverPath}boardUpDelProc.do"
					//-------------------------------
					// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
					//-------------------------------
					, type : "post"

					//-------------------------------
					// 파일업로드를 위한 설정
					//-------------------------------
					//-------
					// 서버로 보내는 데이터에 파일이 있으므로
					// 전송하는 파라미터명, 파라미터값을 serialize를 하여 Query String으로 변경하지 않케 설정하기.
					// 서버로 보내는 데이터에 파일이 없으면  processData: false 을 생략한다.
					//-------
					,processData:false
					//-------
					// 서버로 보내는 데이터에 파일이 있으므로
					// 현재 form 태그에 설정된 enctype 속성값을 Content-Type 으로 사용하도록 설정하기.
					// 이게 없으면 현재 form 태그에 설정된 enctype 속성값과 관계없이 무조건 enctype 이 application/x-www-form-urlencoded 로 설정된다.
					// 서버로 보내는 데이터에 파일이 없으면  ,contentType: false  을 생략한다.
					//-------
					,contentType:false 
					//-------
					// 서버로 보내는 데이터  설정하기.
					// 서버로 보내는 데이터에 파일이 있으므로 FormData 객체 설정.
					//-------
					,data:new FormData(  $("[name=boardUpDelForm]").get(0)  )			
					
					
					
					
					//-------------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수에는 서버가 보내온 Map<String,String>  객체가 JSON 객체로 바뀌어 들어온다
					//------------------------------- 
					, success : function(json){
							//----------------------------------
							// JSON 객체에서 유효성체크 문자열 꺼내기
							// JSON 객체에서 수정/삭제 성공 행의 개수 꺼내기
							//----------------------------------
							var msg = json.msg;
							var boardUpDelCnt = json.boardUpDelCnt;
							//----------------------------------
							if( upDel=="up"){
								msg = $.trim(msg);
								if( msg!="" ){
									alert( msg );
									return;
								}
								if( boardUpDelCnt==-1 ){
									alert( "게시판 글이 삭제 되었습니다." );
									location.replace("/${requestScope.naverPath}boardList.do")
								}
								else if( boardUpDelCnt==-2 ){
									alert( "암호가 틀립니다" );
									$("[name=pwd]").val("");
								}
								else if( boardUpDelCnt==1 ){
									alert( "수정 성공" );
									if(confirm("목록 화면으로 이동할까요?")==true){
										location.replace("/${requestScope.naverPath}boardList.do")
									}
								}
								else{
									alert( "서버 에러발생! 관리자에게 문의 바람" );
								}
							}
							else if( upDel=="del"){
								if( boardUpDelCnt==1 ){
									alert( "삭제 성공" );
									location.replace("/${requestScope.naverPath}boardList.do")
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
	<c:if test="${!empty boardDTO}">
			<!--**********************************************************-->
			<!-- [게시판 글쓰기] 화면을 출력하는 form 태그 선언 -->
			<!--**********************************************************-->
			<form name="boardUpDelForm">
				
				<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
				<input type="hidden" name="upDel">

				<table border=1  class="tbcss2" cellpadding="${requestScope.cellpadding}">
					<caption>게시판 수정/삭제</caption>
					<tr>
						<th bgcolor="${thBgcolor}">이 름</th>
						<td>
						<!-------------------------------------------------------->
						<input type="text" size="10" name="writer" class="writer" maxlength=10 value="${requestScope.boardDTO.writer}">
						<!-------------------------------------------------------->
						</td>
					</tr>
					<tr>
						<th bgcolor="${thBgcolor}">제 목</th>
						<td>
						<!--------------------------------------------------------> 
						<input type="text" size="40" name="subject" class="subject" maxlength=30 value="${requestScope.boardDTO.subject}">
						<!-------------------------------------------------------->
						</td>
					</tr>
					<tr>
						<th bgcolor="${thBgcolor}">이메일</th>
						<td>
						<!-------------------------------------------------------->
						<input type="text" name="email" class="email" size="40" maxlength='30' value="${requestScope.boardDTO.email}">
						<!-------------------------------------------------------->
						</td>
					</tr>
					<tr>
						<th bgcolor="${thBgcolor}">내 용</th>
						<td>
						<!-------------------------------------------------------->
						<textarea name="content"  class="content" rows="13" cols="40" maxlength=300>${requestScope.boardDTO.content}</textarea>
						<!-------------------------------------------------------->
						</td>
					</tr>
					
					
					<tr>
						<th bgcolor="${thBgcolor}">이미지</th>
						<td>
					
						<!-------------------------------------------------------->
						<input type="file" name="img" class="img">
						<!-------------------------------------------------------->
						<c:if test="${!empty requestScope.boardDTO.pic}">
							<div style="height:3pt"></div>
							<img src="/resources/img/${requestScope.boardDTO.pic}" width="${requestScope.boardImgRate1}">
							<input type="checkbox" name="is_del" class="is_del" value="yes">삭제
						</c:if>
					
					<tr>
						<th bgcolor="${thBgcolor}">비밀번호</th>
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
				<input type="button" value="목록보기" onClick="location.replace('/${requestScope.naverPath}boardList.do');">
			</form>
	</c:if>
	<c:if test="${empty boardDTO}">
		<script>
			alert('삭제된 글입니다'); 
			location.replace('/${requestScope.naverPath}boardList.do');
		</script>
	</c:if><br>
	[현재 게시판 총개수 : ${requestScope.totCnt}]
		<div>${sessionScope.msg}</div>
</body>
</html>