var script = document.createElement('script');
script.src = 'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js';
script.type = 'text/javascript';
var googleMap = document.createElement('script');
googleMap.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyC3ghT6rlpmvTsfb6PtVtyKIMY8dlidCGA&callback=myMap';
document.getElementsByTagName('head')[0].appendChild(script).appendChild(googleMap);

$(document).ready(function () {
	$(window).on('scroll', materialKit.checkScrollForTransparentNavbar);
	
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
	
	fnGetStatus();
});

function fnGetStatus() {
	Kakao.Auth.getStatus(function(statusObj) {
		if(statusObj.status == "not_connected") {
			alert("잘못된 접근입니다.");
			location.href = "http://localhost:8080/purple/main/";
		}
	});	
}

function fnLogout() {
	Kakao.Auth.logout(function() {
		location.href = "http://localhost:8080/purple/main/";
	});
}

function myMap() {
  var mapCanvas = document.getElementById("map");
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.2), zoom: 10
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
}