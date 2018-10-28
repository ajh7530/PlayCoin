<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<form>
		<h1>유져 상세 정보</h1>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>별명</th>
				<th>등록일시</th>
			</tr>


			<c:forEach var="pl" items="${list}">
				<tr>
					<td>${pl.user_id}</td>
					<td>${pl.user_name}</td>
					<td>${pl.user_email}</td>
					<td>${pl.user_nickname}</td>
					<td>${pl.user_register_date}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
		<a href="./">홈 가기</a>
</body>
</html>