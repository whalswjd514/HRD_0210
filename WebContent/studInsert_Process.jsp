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
	String studno=request.getParameter("studno");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String []val=request.getParameterValues("hobby");
	String hobby="";
	for(int i=0;i<val.length;i++){
		if(i==(val.length-1)){
			hobby+=val[i];
		}else{
			hobby+=val[i]+",";
		}
	}
	
	try{
		String sql="insert into stud0210 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, hobby);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href="studSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("등록이 실패되었습니다.");
			history.back(-1);
		</script>
</body>
</html>