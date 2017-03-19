var googleMap = document.createElement('script');
googleMap.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyC3ghT6rlpmvTsfb6PtVtyKIMY8dlidCGA&libraries=geometry,places&callback=myMap';
googleMap.charset = 'utf-8';

document.getElementsByTagName('head')[0].appendChild(googleMap);

$(document).ready(function () {
	$(window).on('scroll', materialKit.checkScrollForTransparentNavbar);
	
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
	
	fnGetStatus();
	fnDaumEditorInit();
     
    //form submit 버튼 클릭
    $("#save_button").click(function() {
        //다음에디터가 포함된 form submit
        Editor.save();
    })
});

function fnDaumEditorInit() {
    $.ajax({
        url : "../resources/daumeditor/editor_frame.html",
        success : function(data){
            $("#editor_frame").html(data);
            // 에디터UI load
            var config = {
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
                txHost: '', 
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
                txPath: '', 
                /* 수정필요없음. */
                txService: 'sample', 
                /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
                txProject: 'sample',
                /* 대부분의 경우에 빈문자열 */
                initializedId: "", 
                /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
                wrapper: "tx_trex_container",
                /* 등록하기 위한 Form 이름 */
                form: "frm", 
                /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
                txIconPath: "../resources/daumeditor/images/icon/editor/", 
                /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
                txDecoPath: "../resources/daumeditor/images/deco/contents/", 
                canvas: {
                    styles: {
                        /* 기본 글자색 */
                        color: "#123456", 
                        /* 기본 글자체 */
                        fontFamily: "굴림", 
                        /* 기본 글자크기 */
                        fontSize: "10pt", 
                        /*기본 배경색 */
                        backgroundColor: "#fff", 
                        /*기본 줄간격 */
                        lineHeight: "1.5", 
                        /* 위지윅 영역의 여백 */
                        padding: "8px"
                    },
                    showGuideArea: false
                },
                events: {
                    preventUnload: false
                },
                sidebar: {
                    attachbox: {
                        show: true,
                        confirmForDeleteAll: true
                    }
                },
                size: {
                    /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
                    contentWidth: 1120
                }
            };
             
            //에디터내에 환경설정 적용하기
            new Editor(config);
        }
    });	
}

//Editor.save() 호출 한 다음에 validation 검증을 위한 함수 
//validation 체크해줄 입력폼들을 이 함수에 추가 지정해줍니다.
function validForm(editor) {
    var validator = new Trex.Validator();
    var content = editor.getContent();
    
    if (!validator.exists(content)) {
        alert('내용을 입력하세요');
        return false;
    }
    
    return true;
}
  
//validForm 함수까지 true값을 받으면 이어서 form submit을 시켜주는  setForm함수
function setForm(editor) {
    var content = editor.getContent();
    $("#daumeditor").val(content);
    return true;
}

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
	var myLatLng = {lat: 37.250943, lng: 127.028344};
	var mapCanvas = document.getElementById("map");
	var mapOptions = {
		zoom: 10,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	var map = new google.maps.Map(mapCanvas, mapOptions);
	var input = /** @type {HTMLInputElement} */
	(document.getElementById('pac-input'));

	// Create the autocomplete helper, and associate it with
	// an HTML text input box.
	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', map);

	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	var infowindow = new google.maps.InfoWindow();
	var marker = new google.maps.Marker({
		map : map
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});

	// Get the full place details when the user selects a place from the
	// list of suggestions.
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		infowindow.close();
		
		var place = autocomplete.getPlace();
		console.log(place);
		if (!place.geometry) {
			return;
		}

		if (place.geometry.viewport) {
			map.fitBounds(place.geometry.viewport);
		} else {
			map.setCenter(place.geometry.location);
			map.setZoom(17);
		}

		// Set the position of the marker using the place ID and location.
		marker.setPlace(/** @type {!google.maps.Place} */
		({
			placeId : place.place_id,
			location : place.geometry.location
		}));
		
		marker.setVisible(true);

		var html = '<div>';
		
		if(place.photos != undefined) {
			html += place.photos[0].html_attributions[0];
		}
		
		html += '</div>';
		
		console.log(html);
		
		infowindow.setContent(html + '<div><strong>' + place.name + '</strong><br/>' + place.formatted_address + '</div>');
		infowindow.open(map, marker);
	});
}