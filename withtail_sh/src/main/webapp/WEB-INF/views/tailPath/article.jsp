<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.container-body{
    line-height: 1;
    font-family: 'Noto Sans KR', sans-serif;
    letter-spacing: -1px;
}

.imgbox {
     height: 500px;
     padding: 10px;
     margin: 10px 20px;
     margin: 30px 30px;
}

img {
    overflow-clip-margin: content-box;
    overflow: clip;
}


h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.container {
    max-width: 1200px;
    width: 100%;
    margin: 0 auto;
    /* background: rgba(0,0,0,.5); */
}

div {
    display: block;
}

.contents_wrap .tit_box {
    height: 113px;
    line-height: 113px;
    text-align: center;
    border-bottom: 1px solid #dadada;
}

.contents_wrap .tit {
    height: 99px;
    line-height: 99px;
    text-align: center;
    display: none;
}

a, a:hover, a:link, a:visited, a:active {
    text-decoration: none;
    color: #1b1b1b;
    word-wrap: break-word;
}

.hidden_txt, .blind {
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
}

.skip, .blind {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: 0;
    padding: 0;
    background: none;
    font-size: 3px;
    color: transparent;
    line-height: 0;
}

.contents_wrap .tit_box {
    height: 113px;
    line-height: 113px;
    text-align: center;
    border-bottom: 1px solid #dadada;
    padding-top: 30px;
}

.detail_img {
    width: 500px;
    display: inline-block;
}
.detail_text {
    display: inline-block;
    width: 500px;
    margin: 10px 20px;
}

.contents_wrap .contents .detail_box .detail_img {
    position: relative;
    float: left;
    width: 55%;
    /* width: 660px; */
}

.contents_wrap .contents .detail_box .detail_img img {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    height: 100%;
    margin: auto;
    object-fit: cover;
}

.contents_wrap .contents .detail_box .detail_text .keyword span {
    display: inline-block;
    margin: 0 8px 4px 0;
    padding: 5px 7px 5px 8px;
    font-size: 14px;
    color: #555;
    border: 1px solid #d3d3d3;
    border-radius: 2px;
}

.contents_wrap .contents .detail_box .detail_text strong {
    display: block;
    margin: 0 0 11px 9px;
    font-size: 14px;
    font-weight: 500;
    color: #242424;
}

.contents_wrap .contents .detail_box .detail_text .keyword {
    margin: 0 0 32px 7px;
    font-size: 0;
}

.contents_wrap .contents .detail_box .detail_text .info_text {
    position: relative;
    margin-bottom: 10px;
    padding: 27px 10px 26px 19px;
    /* max-width: 489px; */
    min-height: 200px;
    background: #e7eff8;
    border-radius: 10px;
}

.contents_wrap .contents .detail_box .detail_text .info_text .bbs {
    position: absolute;
    top: -20px;
    right: 15px;
}

.contents_wrap .contents .detail_box .detail_text .info_text .bbs .btnn {
    width: 40px;
    height: 40px;
    transition: all .3s;
    border: none;
}

/*
.contents_wrap .contents .detail_box .detail_text .info_text .bbs button.btn03 {
    background: url(${pageContext.request.contextPath}/resources/images/btn01.png)no-repeat;
}
*/


.contents_wrap .contents .detail_box .detail_text .info_text {
    position: relative;
    margin-bottom: 10px;
    padding: 27px 10px 26px 19px;
    /* max-width: 489px; */
    min-height: 200px;
    background: #e7eff8;
    border-radius: 10px;
}

.contents_wrap .contents .detail_box .detail_text .info_text dl {
    margin-bottom: 20px;
    overflow: hidden;
    line-height: 19px;
}

.contents_wrap .contents .detail_box .detail_text .info_text .bbs {
    position: absolute;
    top: 20px;
    right: 35px;
    
}


dt {
    display: block;
}


.contents_wrap .contents .detail_box .detail_text .info_text dl dt {
    position: relative;
    float: left;
    width: 98px;
    padding-left: 25px;
    font-weight: 500;
    color: #000;
}

button {
    display: inline-block;
    background: transparent;
    font-size: inherit;
    font-weight: normal;
    font-family: inherit;
    color: inherit;
    cursor: pointer;
}

.bbs:not(:disabled):not(.disabled) {
    cursor: pointer;
}

.contents_wrap .contents .detail_box .detail_text .info_text dl dt::before {
    content: "";
    width: 16px;
    height: 16px;
    position: absolute;
    top: 4px;
    left:0;
}

.contents_wrap .contents .detail_box .detail_text .info_text dl dt.address::before {
    background: url(${pageContext.request.contextPath}/resources/images/address2.png) no-repeat;
}
.contents_wrap .contents .detail_box .detail_text .info_text dl dt.inquiries::before {
    background: url(${pageContext.request.contextPath}/resources/images/inquiries.png) no-repeat;
}
.contents_wrap .contents .detail_box .detail_text .info_text dl dt.time::before {
    background: url(${pageContext.request.contextPath}/resources/images/time.png) no-repeat;
}
.contents_wrap .contents .detail_box .detail_text .info_text dl dt.site::before {
    background: url(${pageContext.request.contextPath}/resources/images/site.png) no-repeat;
}

.contents_wrap .contents .detail_box .detail_text .info_text dl dt {
    position: relative;
    float: left;
    width: 98px;
    padding-left: 25px;
    font-weight: 500;
    color: #000;
}
.contents_wrap .contents .detail_box .detail_text .info_text dl dd {
    float: left;
    width: calc(100% - 98px);
    color: #505050;
    font-weight: 350;
}

.slick-slider .slick-list .slick-track {
    display: block;
    position: relative;
    top: 0;
    left: 0;
}

.slick-slider.slick-initialized .slick-list .slick-track .slick-slide {
    display: block;
}

.slick-slider .slick-list .slick-track .slick-slide {
    display: none;
    float: left;
}

.slick-slider .slick-list .slick-track:before, .slick-slider .slick-list .slick-track:after {
    display: table;
    content: '';
}

ol, ul {
    list-style-type: none;
}

ul {
    list-style-type: disc;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.contents_wrap .contents .detail_box .detail_text ul.list li {
    float: left;
    padding-top: 65px;
    width: 86px;
    height: 86px;
    margin-right: 12px;
    border: 1px solid #c1c1c1;
    border-radius: 2px;
    text-align: center;
}

.contents_wrap .contents .detail_box .detail_text ul.list li.petcompanion {
    background: url(${pageContext.request.contextPath}/resources/images/pet_companion.png)no-repeat center 17px;
    background-size: 46px 35px;
}

.contents_wrap .contents .detail_box .detail_text ul.list li.parking {
    background: url(${pageContext.request.contextPath}/resources/images/parking.png)no-repeat center 10px;
    background-size: 53px 43px;
}

.contents_wrap .contents .detail_box .detail_text ul.list li.outdoor {
    background: url(${pageContext.request.contextPath}/resources/images/outdoor.png)no-repeat center 17px;
    background-size: 34px 32px;
}

.contents_wrap .contents .detail_box .detail_text ul.list li.indoor {
    background: url(${pageContext.request.contextPath}/resources/images/fixtures.png)no-repeat center 17px;
    background-size: 34px 32px;
}

.contents_wrap .contents .detail_box .detail_text ul.list li.medical {
    background: url(${pageContext.request.contextPath}/resources/images/firstaid.png)no-repeat center 17px;
    background-size: 34px 32px;
}

.contents_wrap .contents .detail_box .detail_text ul.list li span {
    display: block;
    font-size: 14px;
    color: #2b2b2b;
}

.container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl, .container-xxl {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-right: auto;
    margin-left: auto;
}

.contents_wrap .contents .text_box {
    margin-bottom: 41px;
    line-height: 25px;
    font-weight: 300;
    color: #555;
}

.contents_wrap .contents .text_box h4.title {
    position: relative;
    margin-bottom: 15px;
    padding: 0 0 15px 37px;
    font-size: 20px;
    font-weight: 500;
    color: #000;
    border-bottom: 1px solid #c1c1c1;
}

.contents_wrap .contents .text_box h4.title::before {
    content: "";
    position: absolute;
    top: -1px;
    left: 0;
    width: 29px;
    height: 28px;
    background: url(${pageContext.request.contextPath}/resources/images/tit.png)no-repeat;
}

.bbscontainer {
    font-size: 30px;
    background: #ffff;
    border-radius: 50px;
    width: 40px;
    height: 40px;
    text-align: center;
    color: pink;
}

.contents_wrap .contents .text_box h4.title {
    position: relative;
    margin-bottom: 15px;
    padding: 0 0 15px 37px;
    font-size: 20px;
    font-weight: 500;
    color: #000;
    border-bottom: 1px solid #c1c1c1;
}

.contents_wrap .contents .text_box {
    margin-bottom: 41px;
    line-height: 25px;
    font-weight: 300;
    color: #555;
}

.contents_wrap .contents .text_box h4.title::before {
    content: "";
    position: absolute;
    top: -1px;
    left: 0;
    width: 29px;
    height: 28px;
    background: url(${pageContext.request.contextPath}/resources/images/tit.png)no-repeat;
}

.contents_wrap .contents .detail_box .detail_text .list_slick .control {
    position: absolute;
    top: 94px;
    right: 8px;
    font-size: 0;
}

.contents_wrap .contents .detail_box .detail_text .list_slick {
    position: relative;
}

.clearfix {
    display: block;
}

.contents_wrap .contents .detail_box .detail_text .list_slick .control button.prev {
    width: 5px;
    height: 10px;
    border: none;
    background: url(${pageContext.request.contextPath}/resources/images/prev.png)no-repeat;
}

.contents_wrap .contents .detail_box .detail_text .list_slick .control button.pause {
    margin: 0 11px;
    width: 5px;
    height: 8px;
    border: none;
    background: url(${pageContext.request.contextPath}/resources/images/pause.png)no-repeat;
    background-position: center;
}


.contents_wrap .contents .detail_box .detail_text .list_slick .control button.next {
    width: 5px;
    height: 10px;
    border: none;
    background: url(${pageContext.request.contextPath}/resources/images/prev.png)no-repeat;
    transform: rotate(180deg);
}

.pop {
    z-index: 10000;
    display: none;
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    max-width: 352px;
    width: 100%;
    height: 146px;
    box-shadow: 0 0 7px rgba(0,0,0,.3);
}


.pop .pop_text {
    position: relative;
    padding: 28.5px 10px;
    background: #fff;
    border: 1px solid #c1c1c1;
    border-width: 1px 1px 0 1px;
}

.pop .pop_text p {
    text-align: center;
    color: #000;
    line-height: 22px;
}

.pop.type2 button.pop_btn2 {
    width: 100%;
}

.pop button.pop_btn2 {
    background: #98B2C7;
    border: 1px solid #798D9E;
    color: #fff;
}

.pop button {
    float: left;
    width: 50%;
    height: 44px;
    line-height: 44px;
    text-align: center;
}

@media (max-width: 1199px)
.container {
    padding: 0 10px;
}

@media (max-width: 1024px)
.contents_wrap .contents .detail_box .detail_text .info_text .bbs {
    transform: scale(0.8);
}

@media (max-width: 1199px)
.contents_wrap .contents .detail_box .detail_text .info_text dl {
    font-size: 15px;
    line-height: 20px;
}

@media (max-width: 1199px)
.contents_wrap .contents .detail_box .detail_text .info_text .bbs {
    transform: scale(0.9);
}

@media (max-width: 1199px)
.pop {
    width: 92%;
}


</style>

<script>
function fnMessagePopup(_message) {
    $(".popup-alert p").html(_message);
    $(".popup-alert").show();
}

function fnMessagePopupClose() {
    $(".popup-alert").hide();
    $(".popup-alert p").empty();
}

</script>

<div class="container-body">
<div class="contents_wrap">
	<div class="container">
		<div class="contents_box">
			<div class="tit_box">
				<h2>
					상세정보
				</h2>
			</div>

				<div>
					<!-- subForm contents starts -->

<div class="contents" style="padding: 0 0 21px;">
    <!-- intro -->
    <p></p>
    <div class="detail_box clearfix d-flex align-items-center">
        <!-- file list -->
        <div class="detail_img">
            <div >
                 <div class="imgbox" style="background:url(${pageContext.request.contextPath}/resources/images/image-test.jpg); background-size:cover;"></div>
            </div>
            <!-- 
            <div class="control">
                <button class="pause"><span class="blind">일시정지</span></button>
                <button class="play"><span class="blind">재생</span></button>
                <button class="prev slick-arrow" style=""><span class="blind">이전버튼</span></button>
                <button class="next slick-arrow" style=""><span class="blind">다음버튼</span></button>
                <p class="count"><em>9</em>9</p>
            </div>
            -->

        </div>
        
        <!-- //detail_img1 -->

        <div class="detail_text">
            <strong>연관키워드</strong>
            <div class="keyword">
            
                        <span>#${item.city1}</span>
                        <span>#${item.city2}</span>
                        <span>#${item.city3}</span>
                        <span>#${item.category}</span>
                        
            </div>
            <!-- //keyword -->

            <div class="info_text">
                <dl>
                    <dt class="tour-title" style="padding-left: 0px; font-size: 20px; width: 100%;">${item.facilityName}</dt>
                </dl>
                <dl>
                    <dt class="address">주소</dt>
                    <dd>
                        <span id="copy-address">${not empty item.address ? item.address2 : item.address}</span>&nbsp;
                        <a href="#;" class="btn-copy-address">
                            <img src="${pageContext.request.contextPath}/resources/images/icon8.png" title="주소 복사하기" style="width: 18px; vertical-align: middle;">
                        </a>
                    </dd>
                </dl>
                <dl>
                    <dt class="inquiries">문의처</dt>
                    <dd>${item.tel}</dd>
                </dl>
                <dl class="not-pc05">
                    <dt class="time">이용시간</dt>
                    <dd>${item.operTime}</dd>
                </dl>
                <dl>
                    <dt class="site">홈페이지</dt>
                    <dd>
                        <a href="${item.homepage}" target="_blank">${item.homepage}</a>
                    </dd>
                </dl>
                <div class="bbs bbscontainer" style="font-size: 20px;">
                    <button class="btn03 jjimbtn btn-content-favorite btnn" data-state="true" title="찜하기"><i class="fa-regular fa-heart"></i></button>
                </div>
            </div>
            <!-- //info_text -->

            <!-- icon list -->
            <div class="list_slick clearfix">


                <ul class="list slick slick-initialized slick-slider">
                    
                        <div aria-live="polite" class="slick-list draggable">
                        	<div class="slick-track" style="opacity: 1; width: 15000px; transform: translate3d(0px, 0px, 0px);">
		                        <li class="petcompanion slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false">
		                            <span>펫동반 식당</span>
		                        </li>
		                        <li class="parking slick-slide slick-active" data-slick-index="1" aria-hidden="false">
		                            <span>${item.parking}</span>
		                        </li>
		                        <li class="outdoor slick-slide slick-active" data-slick-index="2" aria-hidden="false">
		                            <span>${item.outdoor}</span>
		                        </li>
		                        <li class="indoor slick-slide slick-active" data-slick-index="3" aria-hidden="false">
		                            <span>${item.indoor}</span>
		                        </li>
		                        <li class="medical slick-slide slick-active" data-slick-index="4" aria-hidden="false">
		                            <span>의료시설</span>
		                        </li>
                        	</div>
                        </div>

                </ul>
                <!-- //list -->

            </div>
            <!-- //list_slick -->

        </div>
        <!-- //detail_text -->

    </div>
    <!-- //detail_box -->

    <div class="text_box not-pc05">
        <h4 class="title">소개</h4>
        <div>
           설명
덕수궁미술관은 우리나라 근대미술의 형성과 전개과정을 체계화하여 근대미술에 나타난 미의식과 역사관을 정립함으로써 궁극적으로 우리 민족의 문화적 정체성을 구현하기 위한 목적으로 설립되었다.
덕수궁미술관은 근대미술 전문기관으로서 근대미술의 조사, 연구, 근대미술 관련 기획전 및 소장품 전시, 각종 교육프로그램의 개발과 운영, 학술활동과 출판, 근대미술 관련 정보의 국제적 교류 등 다양한 사업을 추진하고 있다.
미술관이 자리한 덕수궁의 석조전 서관은 1938년에 완공된 우리나라 근대 건축양식을 대표하는 건물이다. 4개의 전시실과 휴게공간, 아트숍 등을 갖추고 있다
        </div>
    </div>
    <!-- //text_box -->

    <div class="text_box not-pc05">
        <h4 class="title">이용요금</h4>
        <p>
			-입장가격정보: ${item.charge}
		<br>-반려동물 동반 추가 요금: ${item.petCharge}
		<br>
		<br>* 입장가격정보를 확인할 수 없으면 시설 홈페이지에서 직접 확인해주세요.
		
        </p>
    </div>
    <!-- //text_box -->

    <div class="text_box not-pc05">
        <h4 class="title">애견 정책 및 주의사항</h4>
        <p>
            - 반려동물 제한사항: ${item.petLimit}
<br>- 크기제한: ${item.petSize}
<br>- 전용여부: ${item.petInfo}
<br>
<br>- 3차 예방접종을 마친 반려견만 입장가능합니다.
<br>- 마킹 또는 마운팅을 하는 반려견들에게는 매너벨트 또는 기저귀를 착용부탁드립니다.
<br>- 반려견의 배변은 견주님이 직접 치워주세요.
<br>- 반려견이 공격적인 성향이 강하거나 많이 예민한 경우 입장이 제한될 수 있습니다.
<br>
<br>* 반려견 동반 운영 정책은 현지 사정에 따라 변동될 수 있습니다.
        </p>
    </div>
    <!-- //text_box -->

    <div class="text_box map">
        <h4 class="title">지도보기</h4>
        <p>
            주소 : ${not empty item.address ? item.address2 : item.address}
        </p>
        <div class="map-box">
            <div id="map" style="width:100%;height:350px;"></div>
        </div>
    </div>
    <!-- //text_box -->

</div>

<form name="pageForm" method="post">
    <input type="hidden" name="_csrf" value="72d71c15-8b8a-4937-8ed0-06e5536d7c0f">
    <input type="hidden" name="pageIndex" value="1">
    <input type="hidden" name="searchKeyword" value="">
    <input type="hidden" name="searchCondition" value="">
    <input type="hidden" name="returnUrl" value="/pet/tour/drink">
</form>


<form id="commentForm" method="get">
    <input type="hidden" name="pageIndex" value="1">
    <input type="hidden" name="contentSeq" value="601">
</form>

<form name="writeForm" method="get">
    <input type="hidden" name="pageIndex" value="1">
    <input type="hidden" name="returnUrl" value="/pet/tour/drink">
    <input type="hidden" name="content" value="">
</form>

<form name="deleteForm" method="post">
    <input type="hidden" name="_csrf" value="72d71c15-8b8a-4937-8ed0-06e5536d7c0f">
    <input type="hidden" name="pageIndex" value="1">
    <input type="hidden" name="returnUrl" value="/pet/tour/drink">
    <input type="hidden" name="contentSeq" value="601">
</form>
									

			</div>
		</div>
	</div>

</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a6cbdb90b0a96211438a827b306cefa"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${item.lat}, ${item.lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${item.lat}, ${item.lng}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
 
</script>
<script>
$(document).ready(function () {
	
	 // address copy
    $(".btn-copy-address").click(function (event) {
        // div 내부 텍스트 취득
        var content = document.getElementById("copy-address").innerText;
        // textarea 생성
        var textArea = document.createElement('textarea');
        // textarea 추가
        document.body.appendChild(textArea);
        // textara의 value값으로 div내부 텍스트값 설정
        textArea.value = content;
        // textarea 선택 및 복사
        textArea.select();
        document.execCommand('copy');
        // textarea 제거
        document.body.removeChild(textArea);

        fnMessagePopup("주소를 복사하였습니다.<br />Ctrl + V로 붙혀넣기 하십시오.");
    });
});
</script>


<div class="pop type2 popup-alert">
		<div class="pop_text">
			<p>주소를 복사하였습니다.<br>Ctrl + V로 붙혀넣기 하십시오.</p>
		</div>
		<!-- //pop_text -->

		<button class="pop_btn2" onclick="fnMessagePopupClose();">확인</button>
</div>


<script type="text/javascript">
var category2Value = "${item.category2}";
var listItem = document.querySelector('.petcompanion');
var listItem2 = document.querySelector('.medical');
if (category2Value === "반려동물식당카페") {
  // Show the list item
  listItem.style.display = 'block';
  listItem.setAttribute('aria-hidden', 'false');
} else {
  // Hide the list item
  listItem.style.display = 'none';
  listItem.setAttribute('aria-hidden', 'true');
}

if (category2Value === "반려의료") {
	  // Show the list item
	  listItem2.style.display = 'block';
	  listItem2.setAttribute('aria-hidden', 'false');
	} else {
	  // Hide the list item
	  listItem2.style.display = 'none';
	  listItem2.setAttribute('aria-hidden', 'true');
	}

$(function() {
            $(".jjimbtn").click(function() {
            	const state = $(this).attr("data-state");
            	
            	if(state === "true") {
            		document.querySelector(".jjimbtn").innerHTML = '<i class="fa-solid fa-heart"></i>';
            		$(this).attr("data-state", "false");
            	} else {
            		document.querySelector(".jjimbtn").innerHTML = '<i class="fa-regular fa-heart"></i>';
            		$(this).attr("data-state", "true");
            	}
            	
            	
            	
            	
                

               
            });
});

    </script>