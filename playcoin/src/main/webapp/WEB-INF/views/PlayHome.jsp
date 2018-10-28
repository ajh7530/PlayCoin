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

// $(document).ready(function(){
	
// 	$(".user_name_cl").on("click",function(){
// 		username = $(this).attr("value");
// 		console.log(username);
		
// 		$.ajax({
// 			url : "UserDetail",
// 			type : "post",
// 			dataType : "text",
// 			contentType : "application/json",
// 			data : JSON.stringify({
// 				user_name : username
// 			}),
// 			success : function(data, status, xhr) {
// 				console.log("유져 상세 정보");
// 			},
// 			error : function(xhr, status, error) {
// 				console.log(error);
// 			}
// 		})// end ajax
// 		location.href="UserDetail"
// 	})
// })

</script>
</head>
<body>
<body>
<form>
<h1>유져 목록</h1>
<hr>
<a href="PlayJoin_page">사용자 등록</a>
<br><br>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>
			<c:forEach var="pl" items="${list}">
			<tr>
				<td>${pl.user_id}</td>
				<td><a href="UserDetail?user_name=${pl.user_name}&&user_id=${pl.user_id}">${pl.user_name}</a></td>
			</tr>
			</c:forEach>
	</table>
</form>
<!-- <br><br> -->
</body>
</html>