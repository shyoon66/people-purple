<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
	
	Kakao.Auth.getStatus(function(statusObj) {
		if(statusObj.status == "not_connected") {
			alert("잘못된 접근입니다.");
			location.href = "http://localhost:8080/purple/main/";
		}
	});
	</script>
	
	<title>people-purple</title>
</head>
<body>
	<div>
		<h1>모임 만들기</h1><br/>
		<button onclick="fnLogout();">로그아웃</button>
		
		<script type='text/javascript'>
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
	    	Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
		
			function fnLogout() {
				Kakao.Auth.logout(function() {
					location.href = "http://localhost:8080/purple/main/";
				});
			}
		</script>
	</div>
</body>
</html>
