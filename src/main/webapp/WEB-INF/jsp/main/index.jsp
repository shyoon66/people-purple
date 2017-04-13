<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>people-purple</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<!-- Canonical SEO -->
	<link rel="canonical" href="http://www.creative-tim.com/product/material-kit"/>
	
	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../resources/assets/css/material-kit.css" rel="stylesheet"/>
    
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
</head>

<body class="signup-page">
	<nav class="navbar navbar-transparent navbar-absolute">
    	<div class="container">
        	<!-- Brand and toggle get grouped for better mobile display -->
        	<div class="navbar-header">
        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
            		<span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
        		</button>
        		<span class="navbar-brand">people-purple</span>
        	</div>

<!--         	<div class="collapse navbar-collapse" id="navigation-example">
        		<ul class="nav navbar-nav navbar-right">
					<li>
    					<a href="../components-documentation.html" target="_blank">
    						Components
    					</a>
    				</li>
    				<li>
						<a href="http://www.creative-tim.com/product/material-kit" target="_blank">
							<i class="material-icons">cloud_download</i> Download
						</a>
    				</li>
		            <li>
		                <a href="https://twitter.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-twitter"></i>
						</a>
		            </li>
		            <li>
		                <a href="https://www.facebook.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-facebook-square"></i>
						</a>
		            </li>
					<li>
		                <a href="https://www.instagram.com/CreativeTimOfficial" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-instagram"></i>
						</a>
		            </li>
        		</ul>
        	</div> -->
    	</div>
    </nav>

    <div class="wrapper">
		<div class="header header-filter" style="background-image: url('../resources/assets/img/city.jpg'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<form class="form" method="" action="">
								<div class="header header-primary text-center">
									<h4>로그인</h4>
									<div class="social-line">
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-facebook-square"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-google-plus"></i>
										</a>
									</div>
								</div>
								<div class="content">
									<a id="kakao-login-btn"></a>
									<a href="http://alpha-developers.kakao.com/logout"></a>
								
									<script type='text/javascript'>
										//<![CDATA[
										// 사용할 앱의 JavaScript 키를 설정해 주세요.
										Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
										// 카카오 로그인 버튼을 생성합니다.
										Kakao.Auth.createLoginButton({
											container : '#kakao-login-btn',
											success : function(authObj) {
												Kakao.API.request({
													url: '/v1/user/me',
													success: function(res) {
														var url = '/purple/main/insertUserProc';
														var params = {
															id : res.id,
															nick_name : res.properties.nickname,
															url : res.properties.thumbnail_image
														};
														
														$.post(url, params, function(data) {
															location.href = '/purple/main/main';
														});
														//location.href = '/purple/main/main?id=' + res.id + '&nickname=' + res.properties.nickname + '&url=' + res.properties.thumbnail_image;
													}
												});
											},
											fail : function(err) {
												alert(JSON.stringify(err));
											}
										});
										//]]>
									</script>
								</div>
							<!-- 								<p class="text-divider">Or Be Classical</p>
								<div class="content">

									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">face</i>
										</span>
										<input type="text" class="form-control" placeholder="First Name...">
									</div>

									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">email</i>
										</span>
										<input type="text" class="form-control" placeholder="Email...">
									</div>

									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<input type="password" placeholder="Password..." class="form-control" />
									</div>

									If you want to add a checkbox to this form, uncomment this code

									<div class="checkbox">
										<label>
											<input type="checkbox" name="optionsCheckboxes" checked>
											Subscribe to newsletter
										</label>
									</div>
								</div>
								<div class="footer text-center">
									<a href="#pablo" class="btn btn-simple btn-primary btn-lg">Get Started</a>
								</div> -->
							</form>
						</div>
					</div>
				</div>
			</div>

			<footer class="footer">
		        <div class="container">
<!-- 		            <nav class="pull-left">
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
		            </nav> -->
<!-- 		            <div class="copyright pull-right">
		                &copy; 2016, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com" target="_blank">Creative Tim</a>
		            </div> -->
		        </div>
		    </footer>
		</div>
    </div>
</body>
</html>