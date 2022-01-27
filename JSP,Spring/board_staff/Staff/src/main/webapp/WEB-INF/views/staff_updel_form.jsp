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
<%@include file="common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<head>
	<script>
		//**********************************************************
		// body 태그 안의 소스를 모두 실행한 후에 실행할 자스 코드 설정
		//**********************************************************
		$(document).ready(function(){
			
		});

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
		// [검색] 버튼 클릭하면 호출되는 함수선언
		//**********************************************
		function search( ){
			//-----------------------------------
			// 입력한 키워드 얻어오기
			// 만약 키워드가 비어있거나 공백으로 되어 있으면  "" 로 대체하기
			// 입력한 키워드의 앞뒤 공백제거하고 다시 입력 양식에 넣어주기
			//-----------------------------------
			var staff_name = $(".staff_name").val();
			if( staff_name==null || staff_name.split(" ").join("")=="" ){
				staff_name = ""; 
			}
			$(".staff_name").val(   $.trim(staff_name) );
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
			$(".staff_name").val("");
			$(".gender").prop("checked", false);
			$(".code_school").prop("checked", false);
			$(".skill_code").prop("checked", false);
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
					url : "/${requestScope.naverPath}staff_search_form.do"
					//----------------------------------------------------------
					// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
					//----------------------------------------------------------
					, type : "post"
					//----------------------------------------------------------
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					//----------------------------------------------------------
					, data : $("[name=staff_search_form]").serialize()
					//----------------------------------------------------------
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
					// 즉 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
					// 응답메시지 안의 html 소스는 boardList.jsp 의 실행 결과물이다.
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
<body onKeydown="if(event.keyCode==13) {search();}">
	<center>
	<!--**********************************************************-->
	<!-- [로그인 정보 입력 양식] 내포한 form 태그 선언 -->
	<!--**********************************************************-->
	<form name="staff_search_form" method="post">
		<table border="2" align="center" style="border-collapse:collapse;" height = "100" width ="900">
			<tr align="center">
				<td colspan="6" bgcolor="${requestScope.headerTrColor}">사원 정보 검색</td>
			</tr>
			<tr align="center">
				<td width ="100" bgcolor="${requestScope.headerTrColor}">이름</td>
				<td>
					<input type="text" name="staff_name" class="staff_name">
				</td>
				<td width ="100" bgcolor="${requestScope.headerTrColor}">성별</td>
				<td>
					<input type="checkbox" name="gender" class="gender" value="1" >남
					<input type="checkbox" name="gender" class="gender" value="2" >여
				</td>
				<td width ="100" bgcolor="${requestScope.headerTrColor}">종교</td>
				<td>
					<select name="religion_code" class="religion_code">
						<option value="">
						<option value="1">기독교
						<option value="2">천주교
						<option value="3">불교
						<option value="4">이슬람
						<option value="5">무교
					</select>
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="${requestScope.headerTrColor}">학력</td>
				<td>
					<input type="checkbox" name="code_school" class="code_school" value="1" >고졸
					<input type="checkbox" name="code_school" class="code_school" value="2" >전문대졸
					<input type="checkbox" name="code_school" class="code_school" value="3" >일반대졸
				</td>
				<td bgcolor="${requestScope.headerTrColor}">기술</td>
				<td colspan="3">
					<input type="checkbox" name="skill_code" class="skill_code" value="1" >Java
					<input type="checkbox" name="skill_code" class="skill_code" value="2" >JSP
					<input type="checkbox" name="skill_code" class="skill_code" value="3" >ASP
					<input type="checkbox" name="skill_code" class="skill_code" value="4" >PHP
					<input type="checkbox" name="skill_code" class="skill_code" value="5" >Delphi
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="${requestScope.headerTrColor}">졸업일</td>
				<td colspan="5">
					<select name="graduate_year_1">
							<option value=" "></option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
						</select>
						년
						<select name="graduate_month_1">
							<option value=" "></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
						<select name="graduate_day_1">
							<option value=" "></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						일 ~
						<select name="graduate_year_2">
							<option value=" "></option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
						</select>
						년
						<select name="graduate_month_2">
							<option value=" "></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
						<select name="graduate_day_2">
							<option value=" "></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						일
				</td>
			</tr>
		</table>
		
		<div style="height:5pt"></div>
		
		<!------------------------------------------------->
		<!--- 선택한 클릭한 페이지번호를 저장할 hidden 입력양식 선언--->
		<!--- 페이징 처리 관련 데이터이다.--->
		<!------------------------------------------------->
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">  
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="5">
		<input type="button" name="search" class="boardSearch" value="검색" onClick="search();">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="search" class="boardSearchAll" value="전부검색" onclick="searchAll();">
		<input type="reset" name="reset" class="reset" value="초기화">
		<input type="button" name="search" class="" value="등록">

	</form>
	
	<!--**********************************************************-->
	<!-- 페이지 번호 출력하기-->
	<!--**********************************************************-->
	<div class="pageNo">			
		<%--
		********************************************************************
		JSTL 이란 커스텀태그 중에 C코어 태그 중에 if 조건문을 사용하여
		만약에 게시판 검색 개수가 0보다 크면
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
	<!--검색된 목록 출력하기-->
	<!--**********************************************************-->
	<div class="searchResult">

		<table border="2" align="center" style="border-collapse:collapse;"  width ="900">
		<tr bgcolor="${requestScope.headerTrColor}">
			<th width ="10%">번호<th width ="20%">이름<th  width ="10%">성별<th width ="20%">종교<th width ="25%">졸업일<th width ="15%">
		<c:forEach var="staff" items="${requestScope.boardList}" varStatus="loopTagStatus">
			<tr>
				<td>${requestScope.selectPageNo*requestScope.rowCntPerPage-requestScope.rowCntPerPage+1+loopTagStatus.index} 
				<td>${staff.staff_name}
				<td>${staff.jumin_no}
				<td>${staff.religion_name}
				<td>${staff.graduate_day}
			</tr>
		</c:forEach>
		</table>
	</div>
	</center>
</body>



</html>