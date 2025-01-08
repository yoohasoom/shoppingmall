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
</style>
</head>
<body>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select mem.custno, mem.custname, mem.grade, sum(mon.amount * mon.pcost) as total "
				+ "from member_tbl_03 mem, money_tbl_03 mon "
				+ "where mem.custno = mon.custno "
				+ "group by mem.custno, mem.custname, mem.grade "
				+ "order by mem.custno";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">회원정보조회</h2>
	<br>
	<section style="display: flex; justify-content: center;">
	<table border="1" style="border-spacing: 0px;">
	<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
	</tr>
	
	<%
	while(rs.next()) {
	%>
	<tr>
	<td><%= rs.getString(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	</tr>
	<%
	}
	%>
	</table>
	</section>
</body>
</html>