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




<!------------------------------------------------------------->
<!--body 태그 선언하기-->
<!--body 태그에 keydown 이벤트를 걸면 특정 태그에 가는 포커스 상관없이 무조건 화면에서 키보드 누르면 자스 코드를 실행하게 할수 있다.-->
<!------------------------------------------------------------->
<body>
	<center>
	<!--**********************************************************-->
	<!-- [로그인 정보 입력 양식] 내포한 form 태그 선언 -->
	<!--**********************************************************-->
	<form name="staffSearchForm" id="staffSearchForm">
		<table border="2" align="center" style="border-collapse:collapse;" height = "100" width ="1000">
			<tr align="center">
				<td colspan="6">사원 정보 검색</td>
			</tr>
			<tr align="center">
				<td width ="100">이름</td>
				<td>
					<input type="text" name="staff_name" class="staff_name">
				</td>
				<td width ="100">성별</td>
				<td>
					<input type="checkbox" name="gender" class="gender" value="1" >남
					<input type="checkbox" name="gender" class="gender" value="2" >여
					<input type="hidden" name="gender_list" id="gender_list" value="">
				</td>
				<td width ="100">종교</td>
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
				<td>학력</td>
				<td>
					<input type="radio" name="school_code" class="school_code" value="1" >고졸
					<input type="radio" name="school_code" class="school_code" value="2" >전문대졸
					<input type="radio" name="school_code" class="school_code" value="3" >일반대졸
				</td>
				<td>기술</td>
				<td colspan="3">
					<input type="checkbox" name="skill_code" class="skill_code" value="1" >Java
					<input type="checkbox" name="skill_code" class="skill_code" value="2" >JSP
					<input type="checkbox" name="skill_code" class="skill_code" value="3" >ASP
					<input type="checkbox" name="skill_code" class="skill_code" value="4" >PHP
					<input type="checkbox" name="skill_code" class="skill_code" value="5" >Delphi
					<input type="hidden" name="skill_codeList" id="skill_codeList" value="">
				</td>
			</tr>
			<tr align="center">
				<td>졸업일</td>
				<td colspan="5">
					<select name="graduate_year_1">
							<option value=""></option>
							<%for(int i =1980; i<2022; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
							
						</select>
						년
						<select name="graduate_month_1">
							<option value=""></option>
							<%for(int i =1; i<13; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
						월
						<select name="graduate_day_1">
							<option value=""></option>
							<%for(int i =1; i<32; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
						일 ~
						<select name="graduate_year_2">
							<option value=""></option>
							<%for(int i =1980; i<2022; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
						년
						<select name="graduate_month_2">
							<option value=""></option>
							<%for(int i =1; i<13; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
						월
						<select name="graduate_day_2">
							<option value=""></option>
							<%for(int i =1; i<32; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
						일
				</td>
			</tr>
		</table>
		
		<div style="height:5pt"></div>
		
		<input type="button" name="boardSearch" class="boardSearch" value="검색" onClick="ajaxSearch();">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="boardSearchAll" class="boardSearchAll" value="전부검색" onclick="searchAll();">
		<input type="reset" name="reset" class="reset" value="초기화">
		<input type="button" name="save" class="save" value="등록" onclick="goInputPage()">
	</form>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>종교</th>
				<th>졸업일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody id="staffData">
		
		</tbody>
		
	</table>
	</center>
</body>

<head>
	<script>
		//**********************************************************
		// body 태그 안의 소스를 모두 실행한 후에 실행할 자스 코드 설정
		//**********************************************************
		$(document).ready(function(){
			ajaxSearch();
		});

		function goInputPage() {
			location.href = "/staff/staffInputForm.do";
		}
		
		function goUpdelPage(staff_no){
			
			
			location.href = "/staff/staffUpdelForm.do?staff_no="+staff_no;
		}
		
		function ajaxSearch() {
			
			// Skill_list 관련
	        var skillArray = new Array(); // 배열 선언
	        $('input:checkbox[name=skill_code]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	        	skillArray.push(this.value);
	        });
	        $('#skill_codeList').val(skillArray); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.
	    	// gender_list 관련
	        var genderArray = new Array(); // 배열 선언
	        $('input:checkbox[name=gender]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	        	genderArray.push(this.value);
	        });
	        $('#gender_list').val(genderArray); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.
			
	        // ajax 전송
		    var form1 = $("#staffSearchForm").serialize();
			var url = "/staff/ajaxSearchList.do";
			var contentTypeString = 'application/x-www-form-urlencoded';
			$.ajax({
				url : url,
				type : 'post',
				data : form1 ,
				contentType : contentTypeString,
				success : function(result) {
					if (result) {
						var staffList = result.staff;
						ajaxList(staffList);
					}
					 else {
						alert('오류가 발생했습니다.');
					}
				},
				error : function() {
					alert('서버 에러 발생');
				}
			});
		}
		
		function ajaxList(staffList) {
			var html = '';
			for(var i=0; i<staffList.length; i++) {
				html += '<tr>'
				html += '	<td>'+staffList[i].staff_no+'</td>'
				html += '	<td>'+staffList[i].staff_name+'</td>'
				html += '	<td>'+staffList[i].gender+'</td>'	
				html += '	<td>'+staffList[i].religion_name+'</td>'	
				html += '	<td>'+staffList[i].graduate_day+'</td>'	
				html += '	<td><button onclick="goUpdelPage('+staffList[i].staff_no+')">수정</button></td>'	
				html += '</tr>'
			}
				$('#staffData').empty();
				$('#staffData').append(html);
		}
				
	</script>
</head>


</html>