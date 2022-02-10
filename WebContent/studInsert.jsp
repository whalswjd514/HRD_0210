<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		cnt=0;
		var position=document.getElementsByName("position");
		for(var i=0;i<position.length;i++){
			if(position[i].checked==true){
				cnt++;
				break;
			}
		}
		
		if(document.form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			document.form.studno.focus();
		}else if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.dept.value==""){
			alert("학과가 입력되지 않았습니다.");
			document.form.dept.focus();
		}else if(cnt==0){
			alert("학년이 입력되지 않았습니다.");
			document.form.position.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="studInsert_Process.jsp">
<h1>학사 정보 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">학번</th>
		<td><input type="text" name="studno" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">학과</th>
		<td>
			<select name="dept">
				<option value="1">컴퓨터공학과</option>
				<option value="2">기계공학과</option>
				<option value="3">전자과</option>
				<option value="4">영문학과</option>
				<option value="5">일어과</option>
				<option value="6">경영학과</option>
				<option value="7">무역학과</option>
				<option value="8">교육학과</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">학년</th>
		<td>
			<input type="radio" name="position" value="1" checked>1학년
			<input type="radio" name="position" value="2">2학년
			<input type="radio" name="position" value="3">3학년
			<input type="radio" name="position" value="4">4학년
		</td>
	</tr>
	<tr>
		<th id="th1">취미</th>
		<td>
			<input type="checkbox" name="hobby" value="프로그램">프로그램
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="여행">여행
			<input type="checkbox" name="hobby" value="낚시">낚시
			<input type="checkbox" name="hobby" value="영화보기">영화보기
			<input type="checkbox" name="hobby" value="잠자기">잠자기
			<input type="checkbox" name="hobby" value="멍때리기">멍때리기
		</td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>