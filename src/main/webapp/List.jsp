<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
text-align: center;
}
a {
color: black;
text-decoration: none;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_03";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();

	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">회원목록조회/수정</h2>
	<br>
	<section style="display: flex; justify-content: center;">
	<table border="1" style="border-spacing: 0px;">
	<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>고객등급</th>
	<th>거주지역</th>
	</tr>
	
	<%
	while(rs.next()) { 
	%>
	<tr>
	<td><a href="Edit.jsp?custno=<%= rs.getString(1) %>&custname=<%= rs.getString(2) %>&phone=<%= rs.getString(3) %>&address=<%= rs.getString(4) %>&joindate=<%= rs.getString(5) %>&grade=<%= rs.getString(6) %>&city=<%= rs.getString(7) %>"><%= rs.getString(1) %></a></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5).substring(0, 10) %></td>
	<td><%= rs.getString(6) %></td>
	<td><%= rs.getString(7) %></td>
	</tr>
	<%
	}
	%>
	</table>
	</section>
</body>
</html>