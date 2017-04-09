var googleMap = document.createElement('script');
googleMap.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyC3ghT6rlpmvTsfb6PtVtyKIMY8dlidCGA&libraries=geometry,places&callback=myMap';
googleMap.charset = 'utf-8';

document.getElementsByTagName('head')[0].appendChild(googleMap);

var _filenames = [];
var _coordinates = new Array(2);

$(document).ready(function() {
	$(window).on('scroll', materialKit.checkScrollForTransparentNavbar);
	
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a05ee4a95a2c2df4b1da1b7e43af8096');
	
	fnGetStatus();
	dropzone();
	datepicker();
});

function dropzone() {
	$('div#image').dropzone({
		url: '/purple/common/uploadImage',
        addRemoveLinks: false,
        maxFiles: 5,
        uploadMultiple: false,
        maxFilesize: 10,
        method: 'post',
        acceptedFiles: 'image/*',
        clickable: true,
        dictDefaultMessage: '이미지를 올려주세요',
        init: function () {
        	this.on('maxfilesexceeded', function(file) {
        		$('#myModal .modal-body').text('최대 업로드 파일 수는 5개 입니다.');
        		$('#myModal').modal('show');
        		this.removeFile(file);
            });
        	this.on('addedfile', function(file) {
        		// Create the remove button
        		var html = '<div style="text-align: center;"><button id="' + file.name.split('.')[0] + '_' + _filenames.length + '" class="btn btn-danger btn-xs" style="cursor: pointer;">Remove file</button></div>';
				var removeButton = Dropzone.createElement(html);
				// Capture the Dropzone instance as closure.
				var _this = this;

				// Listen to the click event
				removeButton.addEventListener('click', function(e) {
					// Make sure the button click doesn't submit the
					// form:
					e.preventDefault();
					e.stopPropagation();
					// Remove the file preview.
					_this.removeFile(file);
					
					// If you want to the delete the file on the server
					// as well,
					// you can do the AJAX request here.
					var url = '/purple/common/removeImage';
					var index = e.target.id.split('_')[1];
					var file_name = _filenames[index];
					var params = { file_name : file_name };
					
					$.post(url, params);
					_filenames.splice(index, 1);
				});

				// Add the button to the file preview element.
				file.previewElement.appendChild(removeButton);
        	});
        	this.on('success', function(file, responseText) {
        		// Handle the responseText here. For example, add the text to
				// the preview element:
        	    //console.log(responseText);
        	    _filenames.push(responseText.filename);
        	});
        	this.on('complete', function(file) {
        		//console.log(data);
        	});
        }
	});
}

function datepicker() {	
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var today = nowTemp.toISOString().substr(0, 10).replace('T', ' ');
	
	$('#date').val(today);
	$('#date').parent('div').removeClass('is-empty');
	
	var date = $('#date').datepicker({
		format: 'yyyy-mm-dd',
		onRender: function(date) {
			return date.valueOf() < now.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function(ev) {
		date.hide();
		$(this).parent('div').removeClass('is-empty');
	}).data('datepicker');
}

function fnDaumEditorInit() {
    $.ajax({
        url : "../resources/daumeditor/editor_frame.html",
        success : function(data) {
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
		if(statusObj.status == 'not_connected') {
			alert('잘못된 접근입니다.');
			location.href = 'http://localhost:8080/purple/main/';
		}
	});	
}

function fnLogout() {
	Kakao.Auth.logout(function() {
		location.href = 'http://localhost:8080/purple/main/';
	});
}

function myMap() {
	var myLatLng = {lat: 36.250943, lng: 127.028344};
	var mapCanvas = document.getElementById('map');
	var mapOptions = {
		zoom: 7,
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
		
		var html = '<div><strong>' + place.name + '</strong><br/>' + place.formatted_address + '</div>';	
		infowindow.setContent(html);
		marker.setVisible(true);
		infowindow.open(map, marker);
		
		
		_coordinates[0] = place.geometry.location.lat();
		_coordinates[1] = place.geometry.location.lng();
	});
}

function openImagePopUp() {
	window.open('../common/image', 'imagePopUp', 'width=350, height=300, left=250, top=65');
}

function setImageUrl(imageUrl) {
	$('#upload_img img').attr('src', imageUrl);
}

function insertParty() {
	validInsertParty();
}

function validInsertParty() {
	if($('#sns_id').val() == '') {
		$('#myModal .modal-body').text('SNS 아이디를 입력해주세요.');
		$('#myModal').modal('show'); 
		return;
	}
	
	if($('#num_people').val() == '') {
		$('#myModal .modal-body').text('인원수를 입력해 주세요.');
		$('#myModal').modal('show'); 
		return;
	}
	
	if($('#title').val() == '') {
		$('#myModal .modal-body').text('제목을 입력해 주세요.');
		$('#myModal').modal('show'); 
		return;
	}
	
	if($('#content').val() == '') {
		$('#myModal .modal-body').text('내용을 입력해 주세요.');
		$('#myModal').modal('show'); 
		return;
	}
	
	insertPartyProc();
}

function insertPartyProc() {
	var coordinates = JSON.stringify(_coordinates);
	var filenames = JSON.stringify(_filenames);
	var params = {
		nick_name : $('#nickname').val(),
		sns_id : $('#sns_id').val(),
		kind : $('#party_kind').val(),
		location : $('#location').val(),
		total_number : $('#num_people').val(),
		title : $('#title').val(),
		contents : $('#contents').val(),
		coordinates : coordinates,
		file_names : filenames
	};
	var url = '/purple/party/insertPartyProc';

	console.log(filenames);
	$.post(url, params, function(data) {
		$('#myModal .modal-body').text('모임 등록이 성공했습니다.');
		$('#myModal').modal('show');
		
		var id = "${userInfo.id}";
		var nickname = "${userInfo.nickname}";
		var url = "${userInfo.url}";
		//location.href = '/purple/main/main?id=' + id + '&nickname=' + nickname + '&url=' + url;
	});
}
