<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	try{
		String sql="insert into lecturer0210 values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.setString(2, name);
		pstmt.setString(3, major);
		pstmt.setString(4, field);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다!");
			location.href="lectSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("등록이 실패되었습니다!");
			history.back(-1);
		</script>
</body>
</html>