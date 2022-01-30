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
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>

<!-- ****************************************************** -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 -->
<!--								common.jsp 파일 내의 소스를 삽입하기 -->	
<!-- ****************************************************** -->
<%@include file="common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<script>
		//**********************************************
		// body 태그 안의 내용을 모두 읽어들인 이후 실행할 자스 코드 설정하기
		//**********************************************
		$(document).ready(function(){
			changeBgColor(  );
			//----------------------------------------
			reg_date_sort();
			//----------------------------------------
		});


		//**********************************************
		// 헤더 중에 등록일 문자열에 클릭했을 때 일어나는 일 설정하기
		//**********************************************
		function reg_date_sort(){
			// class=reg_date 를 가진 태그에 마우스 대면 손모양 보이게 하기
			$(".reg_date").css("cursor","pointer");
			// class=reg_date 를 가진 태그에 클릭하면 hidden 태그에 [정렬 기준 문자열] 삽입하기
			$(".reg_date").click(function(){
				// 클릭한 태그를 관리하는 JQuery 객체 메위주 얻기
				var obj = $(this);
				// 클릭한 태그가 안고 있는 문자열 얻기
				var text = obj.text();
				// 문자열에서 공백 제거하고 얻기
				text = $.trim(text);
				// 만약 문자열에 ▲ 가 있으면
				if( text.indexOf("▲")>=0 ){
					// class=sort 를 가진 태그에 value 값으로 ""를 삽입하기
					$(".sort").val("");
				}
				// 만약 문자열에 ▼ 가 있으면
				else if( text.indexOf("▼")>=0 ){
					// class=sort 를 가진 태그에 value 값으로 "reg_date asc"를 삽입하기
					$(".sort").val("reg_date asc");
				}
				// 만약 문자열에 ▼도 없고 ▲ 도 없으면
				else{  //else if( text.indexOf("▲")<0 && text.indexOf("▼")<0 ){
					// class=sort 를 가진 태그에 value 값으로 "reg_date desc"를 삽입하기
					$(".sort").val("reg_date desc");
				}
				// search 함수호출하기
				search( );
			});
		}


		//**********************************************
		// [페이지 번호]를 클릭하면 호출되는 함수 선언
		//**********************************************
		function search_with_changePageNo( selectPageNo ){
			//------------------------------------
			// class=selectPageNo 를 가진 입력양식에 
			// 클릭한(=선택한) 페이지 번호를 value 값으로 삽입하기
			// 왜? 서버에로 보낼려고!
			//------------------------------------
			$(".selectPageNo").val(selectPageNo);
			//------------------------------------
			// search 함수 호출하기
			//------------------------------------
			search();
		}

		//**********************************************
		// 새글쓰기 클릭하면 호출되는 함수 선언
		//**********************************************  
		function goBoardRegForm( ){
			// Location 객체의 replace 메소드 호출로 
			// [새글쓰기 화면]으로 이동하기.
			// 이 이동방법은 form 태그를 이용한 웹서버 접속 방법이 아니므로
			// 파라미터값을 가지고 가려면 URL 주소 뒤 부분에 ?파명=파값 를 붙여야만 한다.
			// 즉 get 방식으로 웹서버 접속하는 방법이다.
			location.replace('/${requestScope.naverPath}boardRegForm.do');
		}

		//**********************************************
		// 게시판 목록에서 행을 클릭할 경우 호출되는 함수 선언.
		// 매개변수로 클릭한 행의 PK 값 즉 b_no 컬럼값이 전달된다.
		//**********************************************  
		function goBoardContentForm( b_no ){
			// ---------------------------------
			// name=boardContentForm 가진 form 태그 내부의 name=b_no 가진 입력 양식에 
			// 클릭한 행의 게시판 번호 저장하기
			// ---------------------------------
			$("[name=boardContentForm] [name=b_no]").val(b_no);
				//$("[name=boardContentForm]").find("[name=b_no]").val(b_no);
			// ---------------------------------
			// name=boardContentForm 가진 form 태그 내부의 action 값의 URL 주소로 서버에 접속하기
			// 즉 상세보기 화면으로 이동하기
			// ---------------------------------
			document.boardContentForm.submit();
		}

		//**********************************************
		// [검색] 버튼 클릭하면 호출되는 함수선언
		//**********************************************
		function search( ){
			//-----------------------------------
			// 입력한 키워드 얻어오기
			// 만약 키워드가 비어있거나 공백으로 되어 있으면  "" 로 대체하기
			// 입력한 키워드의 앞뒤 공백제거하고 다시 입력 양식에 넣어주기
			//-----------------------------------
			var keyword1 = $(".keyword1").val();
			if( keyword1==null || keyword1.split(" ").join("")=="" ){
				keyword1 = ""; 
			}
			$(".keyword1").val(   $.trim(keyword1) );

			//-----------------------------------
			// 입력한 키워드 얻어오기
			// 만약 키워드가 비어있거나 공백으로 되어 있으면  "" 로 대체하기
			// 입력한 키워드의 앞뒤 공백제거하고 다시 입력 양식에 넣어주기
			//-----------------------------------
			var keyword2 = $(".keyword2").val();
			if( keyword2==null || keyword2.split(" ").join("")=="" ){
				keyword2 = ""; 
			}
			$(".keyword2").val(   $.trim(keyword2) );

			//-----------------------------------
			// 비동기 방식으로 웹서버에 접속하는 searchExe() 함수 호출하기
			//-----------------------------------
			searchExe();
		}

		//**********************************************
		// [모두 검색] 버튼 클릭하면 호출되는 함수선언
		//**********************************************
		function searchAll( ){
			//-----------------------------------
			// 키워드1 입력 양식에 "" 넣어주기
			// 키워드2 입력 양식에 "" 넣어주기
			// class=day 를 가진 입력 양식의 체크 풀기
			//-----------------------------------
			$(".keyword1").val("");
			$(".keyword2").val("");
			$(".day").prop("checked", false);
			//-----------------------------------
			// 비동기 방식으로 웹서버에 접속하는 searchExe() 함수 호출하기
			//-----------------------------------
			searchExe( );
		}

		//**********************************************
		// 비동기 방식으로 웹서버에 접속하는 searchExe() 함수 선언하기
		//**********************************************
		function searchExe( ){
			//--------------------------------------
			// 현재 화면에서 페이지 이동 없이(=비동기 방식으로)
			// 서버쪽   /boardList.do   로 접속하여 html 을 응답받아 현 화면에 반영하기
			//--------------------------------------
			$.ajax({
					//----------------------------------------------------------
					// 서버 쪽 호출 URL 주소 지정
					//----------------------------------------------------------
					url : "/${requestScope.naverPath}boardList.do"
					//----------------------------------------------------------
					// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
					//----------------------------------------------------------
					, type : "post"
					//----------------------------------------------------------
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					//----------------------------------------------------------
					, data : $("[name=boardListForm]").serialize()
					//----------------------------------------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
					// 즉 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
					// 응답메시지 안의 html 소스는     boardList.jsp       의 실행 결과물이다.
					//----------------------------------------------------------
					, success : function(responseHtml){
						//-----------------------------------------------
						// 매개변수 responseHtml 로 들어온 검색 결과물 html 소스 문자열에서 
						// class=searchResult 를 가진 태그 내부의 [검색 결과물 html 소스]를 얻어서 
						// 아래 현 화면의 html 소스중에 class=searchResult 를 가진 태그 내부에 덮어씌우기
						//-----------------------------------------------
						$(".searchResult").html(
							$(responseHtml).find(".searchResult").html()
						);
						//-----------------------------------------------
						// 매개변수 responseHtml 로 들어온 검색 결과물 html 소스 문자열에서 
						// class=boardListAllCnt 를 가진 태그 내부의 [총개수 문자열]를 얻어서 
						// 아래 현 화면의 html 소스중에 class=boardListAllCnt 를 가진 태그 내부에 덮어씌우기
						//-----------------------------------------------
						$(".boardListAllCnt").text(
							$(responseHtml).find(".boardListAllCnt").text()
						);
						//-----------------------------------------------
						// 매개변수 responseHtml 로 들어온 검색 결과물 html 소스 문자열에서 
						// class=pageNo 를 가진 태그 내부의 [총개수 문자열]를 얻어서 
						// 아래 현 화면의 html 소스중에 class=pageNo 를 가진 태그 내부에 덮어씌우기
						//-----------------------------------------------
						$(".pageNo").html(
							$(responseHtml).find(".pageNo").html()
						);
						//-----------------------------------------------
						// changeBgColor(  ) 함수 호출로 짝수행,홀수행,헤더에 배경색 주기
						//-----------------------------------------------
						changeBgColor(  );
						//-----------------------------------------------
						// reg_date_sort(  ) 함수 호출로 등록일 클릭했을 때 일 설정하기
						//-----------------------------------------------
						reg_date_sort();
						//-----------------------------------------------
						// class=sort 가진 태그의 현재 value  값 얻기
						//-----------------------------------------------
						var sort = $(".sort").val();
						//-----------------------------------------------
						// 만약에 class=sort 가진 태그의 value  값이 "reg_date asc" 면
						// class=reg_date 가진 태그의 내부의 마지막에 ▲ 추가하기
						//-----------------------------------------------
						if(sort=="reg_date asc"){
							$(".reg_date").append("▲");
						}
						//-----------------------------------------------
						// 만약에 class=sort 가진 태그의 value  값이 "reg_date desc" 면
						// class=reg_date 가진 태그의 내부의 마지막에 ▼ 추가하기
						//-----------------------------------------------
						else if(sort=="reg_date desc"){
							$(".reg_date").append("▼");
						}
						//-----------------------------------------------
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

<!------------------------------------------------------------->
<!--body 태그 선언하기-->
<!--body 태그에 keydown 이벤트를 걸면 특정 태그에 가는 포커스 상관없이 무조건 화면에서 키보드 누르면 자스 코드를 실행하게 할수 있다.-->
<!------------------------------------------------------------->
<body onKeydown="if(event.keyCode==13) {search();}"><center>

		<!--**********************************************************-->
		<!-- [게시판 검색 조건 입력 양식] 내포한 form 태그 선언 -->
		<!--********************************************************** -->
		<form name="boardListForm" method="post" onSubmit="return false;">   
				[키워드] : 
				<!------------------------------------------------->
				<!--- 키워드 데이터 저장할  입력양식 선언--->
				<!-------------------------------------------------> 
				<input type="text" name="keyword1" class="keyword1"  >
				<select name="orAnd" class="orAnd">
					<option value="or">or
					<option value="and">and
				</select>
				<input type="text" name="keyword2" class="keyword2">
				<!------------------------------------------------->
				<div style="height:1pt"></div>
				<!------------------------------------------------->
				<input type="checkbox" name="day" class="day" value="오늘" >오늘
				<input type="checkbox" name="day" class="day" value="어제" >어제
				<input type="checkbox" name="day" class="day" value="그제" >그제
				<!------------------------------------------------->
				<!--- 선택한 클릭한 페이지번호를 저장할 hidden 입력양식 선언.페이징 처리 관련 데이터이다.--->
				<!--- 등록일 정렬 관련 데이터를 저장할 hidden 입력양식 선언..--->
				<!------------------------------------------------->
				<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">  
				<input type="hidden" name="sort" class="sort" value="">  
				<!------------------------------------------------->
				<!-- div 태그를 이용하여 위아래 공백 주기-->
				<!------------------------------------------------->
				<div style="height:3pt"></div>
				<!------------------------------------------------->
				<!-- 검색 버튼 입력 양식 선언-->
				<!-- 모두 검색 버튼 입력 양식 선언-->
				<!-- 새글쓰기 글씨에 링크 걸기. 클릭 시 goBoardRegForm( ) 함수 호출하기-->
				<!------------------------------------------------->
				<input type="button" value="  검색  " class="boardSearch" onClick="search( );">&nbsp;
				<input type="button" value="모두검색" class="boardSearchAll" onClick="searchAll( );">&nbsp;
				<a href="javascript:goBoardRegForm( );" >[새글쓰기]</a>
				<!------------------------------------------------->
				<!-- div 태그를 이용하여 위아래 공백 주기-->
				<!------------------------------------------------->
				<div style="height:10pt"></div><br>

				<!--**********************************************************-->
				<!--검색된 목록의 총개수 출력하기-->
				<!--**********************************************************-->
				<!-- EL(=Expression Language)을 사용하여 HttpServletRequest 객체에 -->
				<!-- setAttribute 메소드로 저장된 키값 "boardListAllCnt" 로 저장된 데이터를 꺼내서 표현하기-->
				<!-- <참고> EL 은 JSP 페이지에서 사용가능한 언어이다. -->
				<!--        즉 EL 은 JSP 기술의 한 종류이다. -->
				<!--**********************************************************-->
				검색 총 개수 => <span class="boardListAllCnt">${requestScope.boardListAllCnt}</span> / ${requestScope.totCnt} 개
				<!------------------------------------------------->
				<!--- 한 화면에 보여줄 검색 결과물 행의 개수 관련 입력양식 선언--->
				<!--- 페이징 처리 관련 데이터이다.--->
				<!------------------------------------------------->
				<select name="rowCntPerPage" class="rowCntPerPage" onChange="search();">
					<option value="10">10
					<option value="15">15
					<option value="20" selected>20
					<option value="25">25
					<option value="30">30
					<option value="35">25
					<option value="40">30
					<option value="100">100
				</select> 행보기
		</form>

		<!--**********************************************************-->
		<!-- 페이지 번호 출력하기-->
		<!--**********************************************************-->
		<div class="pageNo">			
			<%--
			********************************************************************
			JSTL 이란 커스텀태그 중에 C코어 태그 중에 if 조건문을 사용하여
			만약에 게시판 검색 개수가 0보다 크면
			---------------------------------------------------------------
				--------------------------------
				C코어 태그 중에 if 조건문 형식
				--------------------------------
					<c:if test="${EL조건식}">
		
					</c:> 
				--------------------------------
			********************************************************************
			--%>
			<c:if test="${requestScope.boardListAllCnt>0}">
					<!------------------------------------------------>
					<!--선택한 페이지 번호가 1보다 크면 [처음], [이전] 글씨 보이기. 단 클릭하면 함수 호출하도록 이벤트 걸기-->
					<!------------------------------------------------->
					<c:if test="${requestScope.selectPageNo>1}">
						<span style='cursor:pointer' onClick='search_with_changePageNo(1);'>[처음]</span>
						<span style='cursor:pointer' onClick='search_with_changePageNo(${requestScope.selectPageNo}-1);'>[이전]</span>
					</c:if>
					<!------------------------------------------------>
					<!-- 선택한 페이지 번호가 1면 [처음], [이전] 글씨 보이기. 단 클릭하면 함수 호출하는 이벤트 걸지 말기-->
					<!------------------------------------------------->
					<c:if test="${requestScope.selectPageNo<=1}">
						<span>[처음]</span>
						<span>[이전]</span>
						&nbsp;&nbsp;
					</c:if>

					<%--********************************************************************
					JSTL 이란 커스텀 태그 중에 C코어 태그 중에 forEach 반복문을 사용하여
					[최소 페이지번호] 부터 [최대 페이지 번호]를 표현하기
					********************************************************************
						----------------------------------------------------------------
						C코어 태그 중에 forEach 반복문 형식1
						----------------------------------------------------------------
							<c:forEach var="반복문안에서사용할지역변수" begin="시작번호" end="끝번호" step="증감정수">
								HTML 코딩
							</c:forEach> 
						----------------------------------------------------------------
						C코어 태그 중에 forEach 반복문 형식2
						----------------------------------------------------------------
							<c:forEach var="반복문안에서사용할지역변수" items="EL로표현되는ArrayList객체" varStatus="LoopTagStatus객체저장변수명">
								HTML 코딩
							</c:forEach> 
					********************************************************************--%>
					<c:forEach  var="no"  begin="${requestScope.min_pageNo}"  end="${requestScope.max_pageNo}" step="1"> 
						<!------------------------------------------------->
						<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하면 그냥 번호만 표현하기-->
						<!------------------------------------------------->
						<c:if test="${no==requestScope.selectPageNo}">
							<span>${no}</span>
						</c:if>
						<!------------------------------------------------->
						<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하지 않으면 클릭하면 함수호출하도록 클릭 이벤트 걸기-->
						<!------------------------------------------------->
						<c:if test="${no!=requestScope.selectPageNo}">
							<span style='cursor:pointer' onClick='search_with_changePageNo(${no});'>[${no}]</span>
						</c:if>
					</c:forEach>

					<!----------------------------------------------->
					<!-- 선택한 페이지 번호가 마지막 페이지 번호보다 작으면 [다음][마지막] 문자 표현하기-->
					<!-- 단 클릭하면 함수 호출하도록 클릭 이벤트 걸기-->
					<!------------------------------------------------->
					<c:if test="${requestScope.selectPageNo<requestScope.last_pageNo}">
						&nbsp;&nbsp;
						<span style='cursor:pointer' onClick='search_with_changePageNo(${requestScope.selectPageNo}+1);'>[다음]</span>
						<span style='cursor:pointer' onClick='search_with_changePageNo(${requestScope.last_pageNo});'>[마지막]</span>
					</c:if>
					<!----------------------------------------------->
					<!-- 선택한 페이지 번호가 마지막 페이지 번호보다 크거나 같으면 [다음][마지막] 문자만 표현하기-->
					<!-- 단 클릭하면 함수 호출하는 이벤트는 걸지 않기-->
					<!------------------------------------------------->
					<c:if test="${requestScope.selectPageNo>=requestScope.last_pageNo}">
						&nbsp;&nbsp;
						<span>[다음]</span>
						<span>[마지막]</span> 
					</c:if>
			</c:if>
		</div>

		<!--**********************************************************-->
		<!-- div 태그를 이용하여 위아래 컨텐츠의 사이 여백주기-->
		<!--**********************************************************-->
		<div style="height:10pt"></div>

		<!--**********************************************************-->
		<!--검색된 목록 출력하기-->
		<!--**********************************************************-->
		<div class="searchResult">

			<table border=1 class="tbcss0" cellpadding="3">
			<tr bgcolor="gray">
				<th>번호<th>제목<th>작성자<th>조회수<th><span  class="reg_date">등록일</span>
			<!--**********************************************************-->
			<!-- ArrayList 객체에 저장된 다량의 HashMap 객체를 하나씩 꺼내서 , 그안에 데이터를 꺼내서 th,td 태그 안에 삽입하기-->
			<!--**********************************************************-->
			<c:forEach var="board" items="${requestScope.boardList}" varStatus="loopTagStatus">
				<tr  
					<%--bgcolor="${loopTagStatus.index%2==0?'white':'lightgray'}"--%>
					style="cursor:pointer" 
					onClick="goBoardContentForm(${board.b_no});">
					<td>
							<!--**********************************************************-->
							<!-- 역순 일련번호 또는 정순 일련번호 표현하기 -->
							<!--**********************************************************-->
							<%-- ${requestScope.boardListAllCnt-(requestScope.selectPageNo*requestScope.rowCntPerPage-requestScope.rowCntPerPage+1)+1-loopTagStatus.index} --%>

							${requestScope.selectPageNo*requestScope.rowCntPerPage-requestScope.rowCntPerPage+1+loopTagStatus.index} 
					<td>
							<!--**********************************************************-->
							<!-- 들여 쓰기 레벨 단계에 맞추어 들여쓰기 여백 만들기. 그리고  ㄴ  넣어주기 -->
							<!--**********************************************************-->
							<c:if test="${board.print_level>0}">
								<c:forEach begin="1" end="${board.print_level}">
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								ㄴ
							</c:if>
							${board.subject}
					<td>${board.writer}
					<td>${board.readcount}
					<td>${board.reg_date}
				</tr>
			</c:forEach>
			<!--**********************************************************-->
			<!--**********************************************************-->
			
			</table>
		</div>

		<!--************************************************************-->
		<!--게시판 상세 보기 화면 이동하는 form 태그 선언하기-->
		<!--************************************************************-->
		<form name="boardContentForm" method="post" action="/${requestScope.naverPath}boardContentForm.do">
			<!-------------------------------------------------------------->
			<!-- [클릭한 게시판 글의 고유번호]가 저장되는 [hidden 입력 양식] 선언.
			<!-------------------------------------------------------------->
			<input type="hidden" name="b_no">
		</form>
		
		
		<!--************************************************************-->
		<!-- HttpSession 객체에 msg 라는 키워드로 저장된 데이터를 EL 문법으로 꺼내서 표현하기-->
		<!-- LoginController 클래스 내부에   /loginProc.do 주소에 대응하는 메소드 내부에서 저장했었다.-->
		<!--************************************************************-->
		<div>${sessionScope.msg}</div>
		
</body>

</html>









<!--

mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
공식 => [페이지 당 보여줄 행의 개수], [선택페이지번호], [총개수]로
        검색 결과물의 [시작행 번호]과 검색 결과물의 [끝행 번호]를 구하는 공식
		단 변수는 아래와 같다.
------------------------------------------------------------------
			totCnt        => 검색된 총 결과물 개수
			rowCntPerPage => 페이지 당 보여줄 행의 개수
			selectPageNo  => 선택한 페이지 번호
			beginRowNo    => 검색된 총 결과물에서 가져올 범위의 시작행
			endRowNo      => 검색된 총 결과물에서 가져올 범위의 끝행
mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
if( totCnt>0){
	int endRowNo = selectPageNo * rowCntPerPage;
	int beginRowNo = endRowNo - rowCntPerPage + 1;
	if( endRowNo>totCnt ){
		endRowNo = totCnt;
	}
}
---------------------------------
if( totCnt>0){
	int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1;
	int endRowNo = selectPageNo * rowCntPerPage;
	if( endRowNo>totCnt ){
		endRowNo = totCnt;
	}
}

mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
공식 => [총개수], [페이지 당 보여줄 행의 개수],[선택된페이지번호]
        [한 화면에 보여지는 페이지 번호 개수]로
        [현재 화면에 보여지는 페이지 번호의 최소 번호]과 
        [현재 화면에 보여지는 페이지 번호의 최대 번호]를 구하는 공식
		단 변수는 아래와 같다.
------------------------------------------------------------------
			totCnt            => 검색된 총 결과물 개수
			rowCntPerPage     => 페이지 당 보여줄 행의 개수
			selectPageNo      => 선택한 페이지 번호
			pageNoCntPerPage  => 페이지 당 보여줄 페이지 번호의 개수
			last_pageNo       => 마지막 페이지 번호
			min_pageNo        => 현재 화면에 보여지는 페이지 번호의 최소 페이지 번호
			max_pageNo        => 현재 화면에 보여지는 페이지 번호의 최대 페이지 번호
mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
if( totCnt>0 ){
	int last_pageNo = totCnt/rowCntPerPage;
		if( totCnt%rowCntPerPage>0 ) { last_pageNo++; }
	int min_pageNo = (selectPageNo-1)/pageNoCntPerPage * pageNoCntPerPage +1;
	int max_pageNo = min_pageNo + pageNoCntPerPage -1;
		if( max_pageNo>last_pageNo ) {max_pageNo = last_pageNo; }
}
mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

-->

































