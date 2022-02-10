<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){	
		if(document.form.name.value==""){
			alert("강사명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.major.value==""){
			alert("전공이 입력되지 않았습니다.");
			document.form.major.focus();
		}else if(document.form.field.value==""){
			alert("세부전공이 입력되지 않았습니다.");
			document.form.field.focus();
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
	String idx=request.getParameter("idx");
	
	try{
		String sql="select * from lecturer0210 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString(2);
			String major=rs.getString(3);
			String field=rs.getString(4);	
%>
<form name="form" method="post" action="lectUpdate_Process.jsp">
<h1>강사 수정</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">강사 ID</th>
		<td><input type="text" name="idx" value="<%=idx %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">강 사 명</th>
		<td><input type="text" name="name" value="<%=name %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">전 공</th>
		<td><input type="text" name="major" value="<%=major %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">세부 전공</th>
		<td><input type="text" name="field" value="<%=field %>" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" onclick="location.href='lectSelect.jsp'" id="btn1">
			<input type="button" value="수정" onclick="check()" id="btn1">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>