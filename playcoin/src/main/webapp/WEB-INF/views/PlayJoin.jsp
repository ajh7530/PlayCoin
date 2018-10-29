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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".user_id").on("keyup",function(event){
		var userid= $(this).val();
		if(userid.length >= 11){
			event.preventDefault();
			alert("아이디는 10자 이내입니다.");
			$(".user_id").val('');
		}
		if(userid.length != 0){
			event.preventDefault();
			$("#user_id_span").text("");
		}
	})
	
	$(".user_name").on("keyup",function(event){
		var username= $(this).val();
		if(username.length >= 11){
			event.preventDefault();
			alert("이름은 10자 이내입니다.");
			$(".user_name").val('');
		}
		if(username.length != 0){
			event.preventDefault();
			$("#user_name_span").text("");
		}
	})
	
	$(".user_email").on("keyup",function(event){
		var useremail= $(this).val();
		if(useremail.length >= 51){
			event.preventDefault();
			alert("이메일은 50자 이내입니다.");
			$(".user_email").val('');
		}
		if(useremail.length != 0){
			event.preventDefault();
			$("#user_email_span").text("");
		}
	})
	
	$(".PlayJoin").on("click",function(event){
		
		var userid= $(".user_id").val();
		var username = $(".user_name").val();
		var useremail = $(".user_email").val();
		var usernickname = $(".user_nickname").val();
		
		if(userid.length == 0){
			event.preventDefault();
			$("#user_id_span").text("아이디는 필수입니다.");
		}
		if(username.length==0){
			event.preventDefault();
			$("#user_name_span").text("이름은 필수입니다.");
		}
		if(useremail.length==0){
			event.preventDefault();
			$("#user_email_span").text("이메일은 필수입니다.");
		}
		
		$.ajax({
			url : "PlayJoin",
			type : "post",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify({
				user_id : userid,
				user_name : username,
				user_email : useremail,
				user_nickname : usernickname
			}),
			success : function(data, status, xhr) {
				
				if (data == "ID overlap"){
					alert("중복된 ID입니다.");
					$(".user_id").val('');
					event.preventDefault();
				}
				else if(data == "Email overlap") {
					alert("중복된 Email입니다.");
					$(".user_email").val('');
					event.preventDefault();
				}
				else if (data=="possibility"){
					alert("등록 성공");
					location.href="./"
				}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})// end ajax
	})// end PlayJoin click
	
	
	$(".id_check_button").on("click",function(){
		var userid= $(".user_id").val();
		
		$.ajax({
			url : "IDCheckButton",
			type : "post",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify({
				user_id : userid
			}),
			success : function(data, status, xhr) {
				
				if (data == "overlap"){
					alert("중복된 ID입니다.");
					$(".user_id").val('');
				}
				else if (data=="possibility"){
					alert("사용 가능한 ID입니다.");
				}
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})// end ajax
	})// end id_check_button click
	
	$(".email_check_button").on("click",function(){
		console.log("눌럿음");
		var useremail = $(".user_email").val();
		
		$.ajax({
			url : "EMAILCheckButton",
			type : "post",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify({
				user_email : useremail
			}),
			success : function(data, status, xhr) {
				
				if (data == "overlap"){
					alert("중복된 Email 입니다.");
					$(".user_email").val('');
				}
				else if (data=="possibility"){
					alert("사용 가능한 Email 입니다.");
				}
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})// end ajax
	})// end id_check_button click
})
</script>
</head>
<body>
<form>
<h1>사용자 등록</h1>
<h5 style="color:red;">* 은 필수입니다.</h5>
		<hr>
		<br> 
	<span style="color:red;">* </span>아이디 : <input type="text" class="user_id" maxlength="11" placeholder="아이디는 최대 10글자입니다.">
	<span id="user_id_span" style="color:red;"></span>
	<input type="button" class="id_check_button" value="아이디 중복검사">
	
		<br>
		
	<span style="color:red;">* </span>이름 : <input type="text" class="user_name" maxlength="11" placeholder="이름은 최대 10글자입니다.">
	<span id="user_name_span" style="color:red;"></span>
	
		<br>
		
	<span style="color:red;">* </span>이메일 : <input type="email" class="user_email" maxlength="51" placeholder="이메일은 최대 50글자입니다.">
	<span id="user_email_span" style="color:red;"></span>
	<input type="button" class="email_check_button" value="이메일 중복검사">
	
		<br>
		
	<span style="margin-left: 12px;"> 별명 : </span><input type="text" class="user_nickname"><span id="user_nickname_span"></span>
		<br>
		<br>
	<input type="button" value="사용자 등록" class="PlayJoin">
</form>
		<br>
	<a href="./">홈 가기</a>
</body>
</html>