<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>people-purple</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../resources/assets/css/material-kit.css" rel="stylesheet"/>

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="../resources/assets/css/demo.css" rel="stylesheet" />
	
	<!--   Core JS Files   -->
	<script src="../resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="../resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../resources/assets/js/material.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../resources/assets/js/nouislider.min.js" type="text/javascript"></script>

	<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
	<script src="../resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>

	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="../resources/assets/js/material-kit.js" type="text/javascript"></script>
	
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
</head>

<body class="tutorial-page">

<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll" role="navigation">
	<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
		<button id="menu-toggle" type="button" class="navbar-toggle">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar bar1"></span>
			<span class="icon-bar bar2"></span>
			<span class="icon-bar bar3"></span>
		</button>
		<div class="logo-container">
			<div class="logo">
				<img src="../resources/assets/img/logo.png" alt="Creative Tim Logo">
			</div>
			<div class="brand">
			    ${userInfo.nickname}
			</div>
			<button class="btn btn-primary" onclick="fnLogout();">로그아웃</button>
			<script type='text/javascript'>
				function fnLogout() {
					Kakao.Auth.logout(function() {
						location.href = "http://localhost:8080/purple/main/";
					});
				}
			</script>
		</div>
	</div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
<!-- 		<ul  class="nav navbar-nav navbar-right">
			<li>
				<a href="index.html">Back to Kit</a>
			</li>
			<li>
                <a href="https://github.com/timcreative/material-kit/issues">Have an issue?</a>
            </li>
    	</ul> -->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="wrapper">
	<div class="header header-filter" style="background-image: url('https://images.unsplash.com/photo-1423655156442-ccc11daa4e99?crop=entropy&dpr=2&fit=crop&fm=jpg&h=750&ixjsv=2.1.0&ixlib=rb-0.3.5&q=50&w=1450');">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<h1 class="title text-center">Tutorial</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="main main-raised">
		<!-- <div class="section"> -->
	        <div class="container">
	        	<div class="content">
					<form class="contact-form">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">닉네임</label>
									<input type="text" id="nickname" name="nickname" class="form-control" value="${userInfo.nickname}" readonly="readonly" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">Your Email</label>
									<input type="email" class="form-control">
								</div>
							</div>
						</div>

						<div class="form-group label-floating">
							<label class="control-label">Your Messge</label>
							<textarea class="form-control" rows="4"></textarea>
						</div>
					</form>
				</div>
		    </div>
	<!-- 	</div> -->
	</div>
</div>

<footer class="footer footer-transparent">
    <div class="container">
        <nav class="pull-left">
            <ul>
				<li>
					<a href="http://www.creative-tim.com">
						Creative Tim
					</a>
				</li>
				<li>
					<a href="http://presentation.creative-tim.com">
					   About Us
					</a>
				</li>
				<li>
					<a href="http://blog.creative-tim.com">
					   Blog
					</a>
				</li>
				<li>
					<a href="http://www.creative-tim.com/license">
						Licenses
					</a>
				</li>
            </ul>
        </nav>
        <div class="social-area pull-right">
            <a class="btn btn-social btn-twitter btn-just-icon" href="https://twitter.com/CreativeTim">
                <i class="fa fa-twitter"></i>
            </a>
            <a class="btn btn-social btn-facebook btn-just-icon" href="https://www.facebook.com/CreativeTim">
                <i class="fa fa-facebook-square"></i>
            </a>
            <a class="btn btn-social btn-google btn-just-icon" href="https://plus.google.com/+CreativetimPage">
                <i class="fa fa-google-plus"></i>
            </a>
        </div>
        <div class="copyright">
            &copy; 2016 Creative Tim, made with love
        </div>
    </div>
</footer>

</body>
	<script>
		$().ready(function(){
			$(window).on('scroll', materialKit.checkScrollForTransparentNavbar);
		});
</script>
</html>