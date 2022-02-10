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
		String sql="update stud0210 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(7, studno);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, hobby);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="studSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("수정이 실패되었습니다.");
			history.back(-1);
		</script>
</body>
</html>