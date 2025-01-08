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
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>
<br>
<section style="display: flex; justify-content: center;">
<form action="EditConfirm.jsp">
<table border="1" style="border-spacing: 0px;">
<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" readonly name="custno" value="<%=custno%>"></td>
				</tr>

				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=custname%>"></td>
				</tr>

				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=phone%>"></td>
				</tr>

				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>

				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=joindate.substring(0, 10)%>"></td>
				</tr>

				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade" value="<%=grade%>"></td>
				</tr>

				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=city%>"></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="수정"
						onclick="fn_submit(); retrun false;"><a href="List.jsp">조회</a></td>
				</tr>
</table>
</form>
</section>
</body>
</html>