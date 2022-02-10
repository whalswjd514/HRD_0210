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
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String studno=request.getParameter("studno");
	
	try{
		String sql="select * from stud0210 where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString(2);
			String dept=rs.getString(3);
			String position=rs.getString(4);
			String address=rs.getString(5);
			String phone=rs.getString(6);
			String hobby=rs.getString(7);
			String arr[]=hobby.split(",");
%>
<form name="form" method="post" action="studUpdate_Process.jsp">
<h1>학사정보 수정</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">학번</th>
		<td><input type="text" name="studno" value="<%=studno %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" value="<%=name %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">학과</th>
		<td>
			<select name="dept">
				<option value="1" <%if(dept.equals("1")){%>selected<%}%>>컴퓨터공학과</option>
				<option value="2" <%if(dept.equals("2")){%>selected<%}%>>기계공학과</option>
				<option value="3" <%if(dept.equals("3")){%>selected<%}%>>전자과</option>
				<option value="4" <%if(dept.equals("4")){%>selected<%}%>>영문학과</option>
				<option value="5" <%if(dept.equals("5")){%>selected<%}%>>일어과</option>
				<option value="6" <%if(dept.equals("6")){%>selected<%}%>>경영학과</option>
				<option value="7" <%if(dept.equals("7")){%>selected<%}%>>무역학과</option>
				<option value="8" <%if(dept.equals("8")){%>selected<%}%>>교육학과</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">학년</th>
		<td>
			<input type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%>>1학년
			<input type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%>>2학년
			<input type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%>>3학년
			<input type="radio" name="position" value="4" <%if(position.equals("4")){%>checked<%}%>>4학년
		</td>
	</tr>
	<tr>
		<th id="th1">취미</th>
		<td>
			<input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<arr.length;i++)if("프로그램".equals(arr[i])) out.print("checked"); %>>프로그램
			<input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<arr.length;i++)if("독서".equals(arr[i])) out.print("checked"); %>>독서
			<input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<arr.length;i++)if("등산".equals(arr[i])) out.print("checked"); %>>등산
			<input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<arr.length;i++)if("여행".equals(arr[i])) out.print("checked"); %>>여행
			<input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<arr.length;i++)if("낚시".equals(arr[i])) out.print("checked"); %>>낚시
			<input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<arr.length;i++)if("영화보기".equals(arr[i])) out.print("checked"); %>>영화보기
			<input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<arr.length;i++)if("잠자기".equals(arr[i])) out.print("checked"); %>>잠자기
			<input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<arr.length;i++)if("멍때리기".equals(arr[i])) out.print("checked"); %>>멍때리기
		</td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" value="<%=address %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" value="<%=phone %>" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="수정" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 읽기 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>