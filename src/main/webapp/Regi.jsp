<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select max(custno)+1 from member_tbl_03";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();

	rs.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="Regiconfirm.jsp" name="form">
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" readonly name="custno"
						value="<%=rs.getString(1)%>"></td>
				</tr>

				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>

				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>

				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>

				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate"></td>
				</tr>

				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade"></td>
				</tr>

				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="등록"
						onclick="fn_submit(); return false;"><a href="List.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
	function fn_submit() {
		var f = document.form;
		
		if(f.custname.value == "") {
			alert("회원성명이 입력되지 않았습니다!");
			f.custname.focus(); return false;
		}
		if(f.phone.value == "") {
			alert("회원전화가 입력되지 않았습니다!");
			f.phone.focus(); return false;
		}
		if(f.address.value == "") {
			alert("회원주소가 입력되지 않았습니다!");
			f.address.focus(); return false;
		}
		if(f.joindate.value == "") {
			alert("가입일자가 입력되지 않았습니다!");
			f.joindate.focus(); return false;
		}
		if(f.grade.value == "") {
			alert("고객등급이 입력되지 않았습니다!");
			f.grade.focus(); return false;
		}
		if(f.city.value == "") {
			alert("도시코드가 입력되지 않았습니다!");
			f.city.focus(); return false;
		}
		f.submit();
	}
	</script>
</body>
</html>