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

<style>
	.controls {
	  margin-top: 10px;
	  border: 1px solid transparent;
	  border-radius: 2px 0 0 2px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  height: 32px;
	  outline: none;
	  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	}

	#pac-input {
	  background-color: #fff;
	  font-family: Roboto;
	  font-size: 15px;
	  font-weight: 300;
	  margin-left: 12px;
	  padding: 0 11px 0 13px;
	  text-overflow: ellipsis;
	  width: 300px;
	}
	
	#pac-input:focus {
	  border-color: #4d90fe;
	}
	
	.pac-container {
	  font-family: Roboto;
	}
	
	#type-selector {
	  color: #fff;
	  background-color: #4d90fe;
	  padding: 5px 11px 0px 11px;
	}
	
	#type-selector label {
	  font-family: Roboto;
	  font-size: 13px;
	  font-weight: 300;
	}
	
	.image-container {
		border: 1px solid;
/* 		width: 400px;
		height: 400px; */
		cursor: pointer;
		float: left;
		width: 33%;
	}
	
	.google-map {
		width: 1140px;
		height: 400px;
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	.datepicker {
		z-index: 1151 !important;
	}
</style>

<!--     Fonts and icons     -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/assets/css/material-kit.css" rel="stylesheet"/>

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="../resources/assets/css/demo.css" rel="stylesheet" />

<!-- CSS dropzone -->
<link href="../resources/dropzone/css/dropzone.css" rel="stylesheet" />

<!-- daumeditor CSS -->
<link rel="stylesheet" href="../resources/daumeditor/css/editor.css" type="text/css"/>

<!-- CSS Datepicker -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" rel="stylesheet" /> -->
<!-- <link href="../resources/assets/css/bootstrap-datepicker.css" rel="stylesheet" /> -->

<!--   Core JS Files   -->
<script src="../resources/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="../resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../resources/assets/js/material.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="../resources/daumeditor/js/editor_loader.js" type="text/javascript"></script>

<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="../resources/assets/js/nouislider.min.js" type="text/javascript"></script>

<!--  Plugin for the Datepicker -->
<script src="../resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.ko.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script> -->

<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
<script src="../resources/assets/js/material-kit.js" type="text/javascript"></script>

<script src="../resources/js/party/partyInsert.js"></script>

<!-- dropzone -->
<script src="../resources/dropzone/js/dropzone.js" type="text/javascript"></script>
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
				<img src="${userInfo.url}" alt="Creative Tim Logo">
			</div>
			<div class="brand">
			    ${userInfo.nickname}
			</div>
			<button class="btn btn-primary" onclick="fnLogout();">로그아웃</button>
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
					<h1 class="title text-center">people-purple</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="main main-raised">
		<!-- <div class="section"> -->
	        <div class="container">
	        	<div class="content">
					<form id="frm" name="frm" class="contact-form">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">닉네임</label>
									<input type="text" id="nickname" name="nickname" class="form-control" value="${userInfo.nickname}" readonly="readonly" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">이메일 주소</label>
									<input type="text" id="email" name="email" class="form-control" value="yoosh2002@hanmail.net" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">모임날짜</label>
									<input type="text" id="date" name="date" class="form-control" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">모임종류</label>
									<select id="party_kind" name="party_kind" class="form-control">
										<option value="tour">여행</option>
										<option value="exercise">운동</option>
										<option value="reading">독서</option>
										<option value="food">맛집투어</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">인원수</label>
									<input type="number" id="num_people" name="num_people" class="form-control" min="2" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group label-floating">
									<label class="control-label">지역</label>
									<select id="party_kind" name="party_kind" class="form-control">
										<option value="seoul">서울</option>
										<option value="incheon">인천</option>
										<option value="daejeon">대전</option>
										<option value="gwangju">광주</option>
										<option value="daegu">대구</option>
										<option value="ulsan">울산</option>
										<option value="busan">부산</option>
										<option value="gyeonggi">경기도</option>
										<option value="gangwon">강원도</option>
										<option value="chungcheongbuk">충청북도</option>
										<option value="chungcheongnam">충청남도</option>
										<option value="jeollabuk">전라북도</option>
										<option value="jeollanam">전라남도</option>
										<option value="gyeongsangbuk">경상북도</option>
										<option value="gyeongsangnam">경상남도</option>
										<option value="jeju">제주도</option>
										<option value="overseas">해외</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group label-floating">
									<label class="control-label">제목</label>
									<input type="text" id="title" name="title" value="test입니다." class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group label-floating">
									<label class="control-label">사진</label>
									<div id="image" class="dropzone needsclick dz-clickable dz-message"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group label-floating">
									<label class="control-label">내용</label>
									<textarea id="contents" name="contents" class="form-control" rows="10" cols="100">테스트입니다.</textarea>
								</div>
							</div>
						</div>
						<input id="pac-input" class="controls" type="text" placeholder="Search Box">
						<div id="map" class="google-map"></div>
						<div>
							<input type="button" id="save_button" class="btn btn-primary" value="저장" onclick="insertParty();"/>
							<input type="button" id="cancle_btn" class="btn btn-primary" value="취소"/>
						</div>
					</form>
				</div>
		    <!-- </div> -->
		</div>
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

<!-- Modal Core -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">경고창</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>