<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.map { width:700px; height:800px; border: 1px solid #777; }

/*
	강사님 지도 css 가져옴 map7
	
.marker-info { cursor: pointer; font-size: 11px; font-weight: 600; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif; line-height: 1.5; padding: 5px; }
.overlaybox { position: absolute; left: 0; bottom: 40px; width: 300px; height: 130px; margin-left: -144px;text-align: left; overflow: hidden; font-size: 12px; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif; line-height: 1.5; }
.overlaybox * { padding: 0;margin: 0; }
.overlaybox .overlay-info { width: 298px; height: 118px; border-radius: 5px; border-bottom: 2px solid #ccc; border-right: 1px solid #ccc; overflow: hidden; background: #fff; }
.overlaybox .overlay-info:nth-child(1) { border: 0; box-shadow: 0px 1px 2px #888; }
.overlay-info .overlay-title { padding: 5px 0 0 10px; height: 30px; background: #f8f9fa; border-bottom: 1px solid #ddd; font-size: 13px; font-weight: bold; }
.overlay-info .close { position: absolute; top: 10px; right: 10px; color: #888; width: 17px; height: 17px; background: url('${pageContext.request.contextPath}/resources/images/close_icon.png'); background-repeat: no-repeat; }
.overlay-info .close:hover { cursor: pointer; }
.overlay-info .overlay-body { position: relative; overflow: hidden; }
.overlay-info .desc { position: relative; margin: 13px 0 0 90px; height: 75px; }
.desc div { padding 3px; }
.desc .ellipsis { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.desc .other { font-size: 11px; color: #888; margin-top: -2px; }
.overlay-info .img { position: absolute; top: 6px; left: 5px; width: 73px; height: 71px; border: 1px solid #ddd; color: #888; overflow: hidden; }
.overlay-info:after { content: '';position: absolute; margin-left: -16px; left: 50%; bottom: 0; width: 22px; height: 12px; background: url('${pageContext.request.contextPath}/resources/images/vertex_white.png'); }
.overlay-info .link { color: #333; }
.overlay-info .link:hover { color: #5085BB; }
*/

.course_all{
	width: 300px; 
	height: 400px; 
	position: relative;
	z-index: 10; 
	top: 100px;
	transition: transform 0.3s ease-in-out;
}

.course_all.hidden {
    transform: translateX(-100%);
}

.course_all_top{
	 height: 150px; 
	 background: #82ae46;  
	 padding: 15px;
}

.pad{
	padding: 10px;
	font-weight: bold;
	padding-left: 15px;
}

a{
	color: white;
}


.btn_close {
    position: relative;
    width: 20px;
    height: 60px;
    background: #fff;
    opacity: .9;
    box-shadow: 2px 1px 4px rgb(0 0 0 / 40%);
    border: none;
    font-size: 8px;
    color: #82ae46;
    left: 300px;
    bottom: 270px;
    transition: transform 0.3s ease-in-out;
}
   
.btn_close.flipped {
    transform: rotate(180deg);
}

.searchbtn{
	border: none;
	background: #fcfcfc;
	border-radius: 2px;
}

.choose-filed{
	padding: 15px 0px 15px 25px ; 
	background: white; 
	height: 400px; 
	position: relative;
}

.info-button{
    height: 30px;
    margin-right: 8px;
    line-height: 30px;
    display: inline-block;
    text-align: center;
    background: #d3e7ff;
    font-size: 14px;
    color: #242424;
    border-radius: 5px;
    transition: all .3s;
    border-style: none;
}

.btnSendOk{
	color: #82ae46;
}

.btnSendOk:hover{
	color: #ccc;
}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #82ae46;color: white;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 10px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}


</style>



<script type="text/javascript">
//댕댕여지도 검색
$('.box button.close').click(function() {
        $(this).parents('.box').hide();
    });

    $('.course_all .btn_close').click(function() {
        $('.course_all').animate({
            left: -300
        }, 300);
        $('.course_all').css('box-shadow', 'none');
        $(this).hide();
        $('.course_all .btn_open').show();
    });

    $('.course_all .btn_open').click(function() {
        $('.course_all').animate({
            left: 0
        }, 300);
        $('.course_all').css('box-shadow', '4px 4px 3px rgba(0,0,0,.3)');
        $(this).hide();
        $('.course_all .btn_close').show();
    });
</script>



    <div class="course_all">
			<div class="course_all_top">
			    <h3 style="text-align: center; color: white; font-weight: bold;">
			        Tail&amp;Path 검색
			    </h3>
			    <div id="searchContainer">
			        <input id="search" type="text" placeholder="주소 또는 명칭으로 검색" />
			        <button id="searchBtn" class="searchbtn">검색</button>
			    </div>
			</div>

        <div class="course_all_box choose-filed">
	        <h5>현재 날씨 정보</h5>
	 		<div style="display: inline-block;">
		 		<div id="weather"></div>
		 		<div id="temperatureInfo"></div>
		 		<div id="weatherInfo"></div>
		 	</div>
	 		<div style="display: inline-block;">
	 			<div id="icon"></div>
			</div>		
	          
	        <hr class="hr1" style="width: 85%; margin-top: -40px; margin-bottom: 40px; border: solid 1px #4CAF50;"> 
	          
	        <div style="margin-top: -24px;">
	            <h5>주변 탐색</h5>

            <ul>
                <li>
                    <input type="checkbox" id="tourist_destination" name="partCode" value="반려동반여행" checked>
                    <label for="tourist_destination">관광,체험</label>
                </li>
                <li>
                    <input type="checkbox" id="beverage" name="partCode" value="반려동물식당카페" checked>
                    <label for="beverage">식음료</label>
                </li>
                <li>
                    <input type="checkbox" id="animal_hospital" name="partCode" value="반려의료" checked>
                    <label for="animal_hospital">의료</label>
                </li>
                <li>
                    <input type="checkbox" id="animal_service" name="partCode" value="반려동물 서비스" checked>
                    <label for="animal_service">서비스</label>
                </li>
            </ul>
        </div>
        </div>
		
		<div class="box">
		<button class="btn_close" >◀</button>
		</div>

    </div>


	<div style="min-height: 805px; overflow: hidden; position: relative; margin-top: -400px">
		<div id="map" class="map"></div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a6cbdb90b0a96211438a827b306cefa&libraries=clusterer"></script>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR) {
			// jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	let spec = "https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc";
	let serviceKey = "tIqAqGnvJfyhmAOeOn5P5PzGHZEX4zjxHFZnCnlJ0%2FwiFcQitsZJo42OBNt64sELkY5wCVBvWPDBx7%2BaY2eW0A%3D%3D";
	let query = "serviceKey="+serviceKey;
	
	query += "&perPage=" + 2000;
	query += "&page=" + 1;
	const fn = function(data) {
		printJSON(data);
	};

	ajaxFun(spec, "get", query, "json", fn);
});


var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.4449168, 127.1388684), // 지도의 중심좌표 
    level : 11 // 지도의 확대 레벨 
});

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 8 // 클러스터 할 최소 지도 레벨 
});

//프로토콜을 추가하는 함수
function addProtocol(url) {
    if (!/^https?:\/\//i.test(url)) {
        url = "http://" + url;
    }
    return url;
}

function printJSON(data) {
	 var positions = []
	 
	 var nameData = []
	 
	 for (var i = 0; i < data.data.length; i++) {
		 var item = data.data[i];
		 
		 if(item["시도 명칭"] === "경기도" || item["시도 명칭"] === "서울특별시"){
			 nameData.push(item.시설명);
			 var link = '<a href="#" class="button btnSendOk" ';
			 link += ' data-address="' + item["도로명주소"] + '"';
			 link += ' data-address2="' + item["지번주소"] + '"';
			 link += ' data-facilityName="' + item["시설명"] + '"';
			 link += ' data-withPet="' + item["반려동물 동반 가능정보"] + '"';
			 link += ' data-petInfo="' + item["반려동물 전용 정보"] + '"';
			 link += ' data-petLimit="' + item["반려동물 제한사항"] + '"';
			 link += ' data-petCharge="' + item["애견 동반 추가 요금"] + '"';
			 link += ' data-operTime="' + item["운영시간"] + '"';
			 link += ' data-petSize="' + item["입장 가능 동물 크기"] + '"';
			 link += ' data-charge="' + item["입장(이용료)가격 정보"] + '"';
			 link += ' data-tel="' + item["전화번호"] + '"';
			 link += ' data-parking="' + item["주차 가능여부"] + '"';
			 link += ' data-homepage="' + addProtocol(item["홈페이지"]) + '"';
			 link += ' data-city1="' + item["시도 명칭"] + '"';
			 link += ' data-city2="' + item["시군구 명칭"] + '"';
			 link += ' data-city3="' + item["법정읍면동명칭"] + '"';
			 link += ' data-category="' + item["카테고리3"] + '"';
			 link += ' data-indoor="' + item["장소(실내) 여부"] + '"';
			 link += ' data-outdoor="' + item["장소(실외)여부"] + '"';
			 link += ' data-category2="' + item["카테고리2"] + '"';
			 link += ' data-lat="' + item["위도"] + '"';
			 link += ' data-lng="' + item["경도"] + '"';
			 link += '>상세정보</a>';
			 let obj = {lat:item.위도, lng: item.경도,  category: item.카테고리2, category2: item.카테고리3, facilityName: item.시설명, address: item.도로명주소, address2: item.지번주소,
			 content: '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            item.시설명 + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis mb-3">' + (item.도로명주소 || item.지번주소) + '</div>' + 
	            '                ' + link + ' ' +  		
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>'}
			 positions.push(obj);
		 }
		 
	 }
	 var jsonData = JSON.stringify(nameData);
	 $.ajax({
		  url: '${pageContext.request.contextPath}/tailPath/main',
		  type: 'POST',
		  contentType: 'application/json',
		  data: jsonData,
		  success: function(response) {
		    console.log("success")
		  },
		  error: function(error) {
		    console.log("failed")
		  }
	 });

	 
   var markers = $(positions).map(function(i, position) {
       return new kakao.maps.Marker({
           position : new kakao.maps.LatLng(position.lat, position.lng)
       });
   });
   
   // 클러스터러에 마커들을 추가합니다
   clusterer.addMarkers(markers);	
	// 오버레이를 담을 배열
   var overlays = [];
	
   for (var i = 0; i < positions.length; i++) {
	    // 마커 위에 커스텀오버레이를 표시합니다
	    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	    var overlay = new kakao.maps.CustomOverlay({
	        content: positions[i].content,
	        map: null,
	        position: markers[i].getPosition()
	    });

	    // 클로저(closure)를 사용하여 현재 반복 인덱스(i)를 유지합니다
	    (function (overlay) {
	        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	        kakao.maps.event.addListener(markers[i], 'click', function () {
	            if (!overlay.getMap()) {
	            	closeOverlays();
	                overlay.setMap(map); // 커스텀 오버레이를 맵에 표시
	            } else {
	                overlay.setMap(null); // 커스텀 오버레이를 맵에서 제거
	            }
	        });
	    })(overlay);
	    
	    overlays.push(overlay); // 생성된 오버레이를 배열에 추가합니다
	}

	// 모든 오버레이를 닫는 함수
   function closeOverlays() {
       for (var i = 0; i < positions.length; i++) {
           overlays[i].setMap(null);
       }
   }
	
   function updateCluster() {
       var selectedCodes = [];

       // 선택된 체크박스의 값을 가져옵니다
       $('input[name="partCode"]:checked').each(function() {
    	   if($(this).val() === "반려동반여행"){
    		   selectedCodes.push("반려문화시설")
    	   }
           selectedCodes.push($(this).val());
       });

       var filteredMarkers = markers.filter(function(index, marker) {
           // 선택된 체크박스와 일치하는 값을 가지는 마커만 필터링합니다
           return selectedCodes.includes(positions[index].category);
       });

       // 클러스터러의 마커를 설정합니다
       clusterer.clear();
       clusterer.addMarkers(filteredMarkers.get());
   }

   // 체크박스 변경 이벤트를 감지하여 클러스터 업데이트 함수를 호출합니다
   $('input[name="partCode"]').change(function() {
       updateCluster();
   });

   // 초기 클러스터 표시
   updateCluster();
   
   $(document).ready(function () {
       // 검색 버튼 클릭 이벤트 처리
       $('#searchBtn').click(function (e) {
           e.preventDefault(); // 폼의 서버 전송 동작을 막습니다.
           
           var keyword = $('#search').val(); // 입력된 검색어를 가져옵니다.
           
           // 마커와 클러스터러를 필터링하여 표시하는 함수 호출
           filterMarkers(keyword);
       });
   });
   
	// 마커와 클러스터러를 필터링하여 표시하는 함수
	function filterMarkers(keyword) {
	    // 이벤트 핸들러 일시적으로 비활성화
	    $('input[name="partCode"]').off('change');
	
	    // 선택된 체크박스를 저장할 배열
	    var selectedCheckboxes = [];
	
	    // 모든 체크박스를 체크 상태로 변경하고 선택된 체크박스를 배열에 저장
	    $('input[name="partCode"]').prop('checked', true);
	
	    // 필터링된 마커들을 저장할 배열
	    var filteredMarkers = [];
	
	    for (var i = 0; i < markers.length; i++) {
	        var facilityName = positions[i].facilityName; // 마커의 제목을 소문자로 변환하여 가져옵니다.
	        var address = positions[i].address || ''; // 마커의 주소를 소문자로 변환하여 가져옵니다. 주소가 null인 경우 빈 문자열로 초기화합니다.
	        var address2 = positions[i].address2 || ''; // 마커의 주소2를 소문자로 변환하여 가져옵니다. 주소2가 null인 경우 빈 문자열로 초기화합니다.
	        
	        // 제목, 주소, 주소2 중 하나라도 검색어를 포함하고 있는 경우 해당 마커를 선택합니다.
	        if (facilityName.includes(keyword) || address.includes(keyword) || address2.includes(keyword)) {
	            filteredMarkers.push(markers[i]);
	        }
	    }
	
	    // 클러스터러의 마커를 설정합니다.
	    clusterer.clear();
	    clusterer.addMarkers(filteredMarkers);

	    // 이벤트 핸들러 활성화
	    $('input[name="partCode"]').on('change', function() {
	        updateCluster();
	    });
	}

}

//버튼 클릭 이벤트 핸들러 등록
var closeButton = document.querySelector('.btn_close');
var courseAll = document.querySelector('.course_all');

closeButton.addEventListener('click', function() {
    if (courseAll.classList.contains('hidden')) {
        // 숨겨져 있는 경우
        courseAll.classList.remove('hidden');
        closeButton.classList.remove('flipped');
    } else {
        // 나타나있는 경우
        courseAll.classList.add('hidden');
        closeButton.classList.add('flipped');
    }
});

$(document).ready(function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success, error);
    } else {
        alert("위치정보를 불러올 수 없습니다.");
    }
});

function success(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;

    var apiKey = "d3ab98ed62e86f1b01cefd84ef3b7f4b";
    var apiUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude + "&lon=" + longitude + "&appid=" + apiKey + "&lang=kr";

    $.ajax({
        url: apiUrl,
        type: "GET",
        dataType: "json",
        success: function(data) {
            var weather = data.weather[0].main;
            var temperature = Math.round(data.main.temp - 273.15);
			var weatherinfo = data.weather[0].description;
			var weathericon = data.weather[0].icon;
            $("#weather").text("날씨: " + weather);
            $("#weatherInfo").text("날씨상세: " + weatherinfo);
            $("#temperatureInfo").text("온도: " + temperature + "°C");
            $("#icon").html("<img src='https://openweathermap.org/img/wn/" + weathericon + "@2x.png' alt='날씨 이미지' style='margin-left: 24px; margin-bottom: 67px; border: solid 1px gray; border-radius: 33px;'>");
        },
        error: function(error) {
            console.log(error);
        }
    });
}

function error() {
    alert("Unable to retrieve your location.");
}
$(function(){
	$("body").on("click", ".btnSendOk", function(){
		const f = document.itemForm;
		
		f.address.value = $(this).attr("data-address");
		f.address2.value = $(this).attr("data-address2");
		f.facilityName.value = $(this).attr("data-facilityName");
		f.withPet.value = $(this).attr("data-withPet");
		f.petInfo.value = $(this).attr("data-petInfo");
		f.petLimit.value = $(this).attr("data-petLimit");
		f.petCharge.value = $(this).attr("data-petCharge");
		f.operTime.value = $(this).attr("data-operTime");
		f.petSize.value = $(this).attr("data-petSize");
		f.charge.value = $(this).attr("data-charge");
		f.tel.value = $(this).attr("data-tel");
		f.parking.value = $(this).attr("data-parking");
		f.homepage.value = $(this).attr("data-homepage");
		f.city1.value = $(this).attr("data-city1");
		f.city2.value = $(this).attr("data-city2");
		f.city3.value = $(this).attr("data-city3");
		f.category.value = $(this).attr("data-category");
		f.indoor.value = $(this).attr("data-indoor");
		f.outdoor.value = $(this).attr("data-outdoor");
		f.category2.value = $(this).attr("data-category2");
		f.lat.value = $(this).attr("data-lat");
		f.lng.value = $(this).attr("data-lng");
		f.action = "${pageContext.request.contextPath}/tailPath/article";
		f.submit();

	});
});
</script>

<form name="itemForm" method="post">
	<input type="hidden" name="address">
	<input type="hidden" name="address2">
	<input type="hidden" name="facilityName">
	<input type="hidden" name="withPet">
	<input type="hidden" name="petInfo">
	<input type="hidden" name="petLimit">
	<input type="hidden" name="petCharge">
	<input type="hidden" name="operTime">
	<input type="hidden" name="petSize">
	<input type="hidden" name="charge">
	<input type="hidden" name="tel">
	<input type="hidden" name="parking">
	<input type="hidden" name="homepage">
	<input type="hidden" name="city1">
	<input type="hidden" name="city2">
	<input type="hidden" name="city3">
	<input type="hidden" name="category">
	<input type="hidden" name="indoor">
	<input type="hidden" name="outdoor">
	<input type="hidden" name="category2">
	<input type="hidden" name="lng">
	<input type="hidden" name="lat">	
</form>
