<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.submenu-layout {
	box-sizing: content-box;
	background-color: #f8f8f8;
	border-radius: 75px;
	display: flex;
	align-items: center;
	width: 22%;
	max-width: 800px;
	margin-top: 80px;
	overflow-x: auto;
}

.submenu-layout ul {
	display: flex;
	list-style-type: none;
	padding: 0;
}

.submenu {
	cursor: pointer;
	border-radius: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex: 1;
	min-width: 80px;
	height: 32px;
}

.submenu.active {
	background-color: #82ae46;
	color: white;
}

a {
	color: #8b8b8b;
}

.submenu.active {
	background-color: #82ae46;
	color: white;
}

.-min {
	min-height: 550px;
}

.mypet-edit-detail-container{
    align-items: center;
    align-self: stretch;
    background-color: white;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 100% !important;
    border: 1px solid rgb(219 219 219);
    margin-top: 26px;
    margin-bottom: 40px;
}

.mypet-edit-detail-wrap {
    align-items: center;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 20px;
    position: relative;
    width: 600px;
    padding: 30px 0;
    margin: 0 auto;
}

.mypet-edit-detail-container .pet-image-mypet-edit-detail-wrap {
    padding-bottom: 10px;
}

.button-label {
    width: 100%;
    display: inherit;
    align-items: inherit;
    justify-content: inherit;
}

img {
    max-width: 100%;
}

.plus-button {
   	position: absolute;
    bottom: 462px;
    right: 260px;
    z-index: 2;
}

.mypet-edit-check {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.gird-item {
	gap: 10px;
    height: 45px;
    display: flex!important;
	justify-content: flex-start!important;
	flex-grow: 0;
    max-width: 100%;
    flex-basis: 100%;
    margin: 0;
    box-sizing: border-box;
}

.btn15 {
	color: rgb(91 91 91);
    border: 1px solid rgb(219 219 219);
    background-color: white;
    border-radius: 5px;
    width: 300px;
}

.btn15:hover{
	background-color: rgb(245 243 243);
}

.mud-input {
    position: relative;
    color: #424242;
    cursor: text;
    display: inline-flex;
    font-size: 1rem;
    box-sizing: border-box;
    align-items: center;
    font-weight: 400;
    line-height: 1.1876em;
    letter-spacing: .00938em;
}

.mypet-edit-box {
	gap: 10px;
    height: 45px;
    display: flex;
    justify-content: center;
	flex-direction: column;
	flex-grow: 0;
    max-width: 100%;
    flex-basis: 100%;
    margin: 0;
    box-sizing: border-box;
    width: 100%;
}

.mypet-edit-detail-btn {
    align-items: stretch;
    align-self: stretch;
    display: flex;
    gap: 10px;
    padding: 10px 0px 0px;   
    justify-content: center;
}

.input1 {
    height: 46px;
    width: 100%;
    border-radius: 5px;
    border: solid 1px rgb(219 219 219);
}

input:hover {
	border: solid 1px #82ae46;
}


.btn16 {
	color: rgb(91 91 91);
    border: 1px solid rgb(154 154 154);
    background-color: white;
    border-radius: 5px;
    width: 300px;
    height: 63px;
}

.btn17 {
	color: white;
    border: 1px solid rgb(154 154 154);
    background-color: #82ae46;
    border-radius: 5px;
    width: 300px;
    height: 63px;
}

.btn17:hover {
	 background-color: #658b31;
}

.input-content {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 11px;
    justify-content: center;
    width: 400px;
    margin-bottom: 10px;
}

.img-viewer {
    cursor: pointer;
    width: 80px;
    height: 80px;
    border-radius: 45px;
    position: relative;
    background-repeat: no-repeat;
    background-size: cover;
}

input:focus {
	outline : solid 1px #82ae46;
}

.mud-input {
  position: relative;
}

.input1-unit {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  color: #82ae46;
}




</style>
<script>
$(function() {
	let img = "${dto.petsImageFilename}";
	let whichPet = "${dto.whichPet}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/pets/" + img;
		$(".input-content .img-viewer").empty();
		$(".input-content .img-viewer").css("background-image", "url("+img+")");
	} else {
		if(whichPet == "강아지") {
			img = "${pageContext.request.contextPath}/resources/images/icon/dog1.png"
			$(".input-content .img-viewer").empty();
			$(".input-content .img-viewer").css("background-image", "url("+img+")");
		} else {
			img = "${pageContext.request.contextPath}/resources/images/icon/cat2.png"
			$(".input-content .img-viewer").empty();
			$(".input-content .img-viewer").css("background-image", "url("+img+")");
		}
	}
	
	$(".input-content .img-viewer").click(function(){
		$("form[name=petEditForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=petEditForm] input[name=selectFile]").change(function(){
		let file = this.files[0];
		if(! file) {
			$(".input-content .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/pets/" + img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".input-content .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$(".input-content .img-viewer").empty();
			$(".input-content .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});

$(function() {
	  // 버튼 클릭 시 이벤트 처리
	  $(".mypet-edit-check .btn15").click(function() {
	    // 선택한 버튼의 텍스트 가져오기
	    var selectedText = $(this).text();
	    
	    // 선택한 값을 input 태그에 표시
	    $("form[name=petEditForm] input[name=gender]").val(selectedText);
	  });
	});
	
function sendOk() {
	const f = document.petEditForm;
	f.action = "${pageContext.request.contextPath}/myPage/petEdit";
	f.submit();
}

//버튼 요소들을 선택합니다.
function changeBackgroundColor(button) {
  const buttons = document.querySelectorAll('.btn15');
  
  buttons.forEach(btn => {
    btn.style.backgroundColor = '';
  });
  
  button.style.backgroundColor = 'rgb(245 251 255)';
}
</script>


<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	
	
		<div class="mypet-edit-detail-container">
			<form name="petEditForm" method="post" enctype="multipart/form-data">
			<div class="mypet-edit-detail-wrap">
				<div class="input-content" style="align-items: center;">
						<div class="img-viewer"></div>
						<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">					
						<img alt="" src="${pageContext.request.contextPath}/resources/images/icon/plusicon.png" width="20" height="20" class="plus-button">
				</div>	
				<div class="mypet-edit-check">
					<div class="gird-item">
						<button class="btn15" type="button" onclick="changeBackgroundColor(this)">남자</button>
						<button class="btn15" type="button" onclick="changeBackgroundColor(this)">여자</button>
						<input class="input1" type="hidden" name="gender" readonly="readonly" value="${dto.gender}">
					</div>
				</div>
				<!-- 이름 -->
				<div class="mypet-edit-box ">
					<div class="mud-input">
						<input class="input1" type="text" name="petName" value="${dto.petName}">
					</div>
				</div>
				<!-- 몸무겐 -->
				<div class="mypet-edit-box ">
					<div class="mud-input">
						<input class="input1" name="weight" type="text" value="${dto.weight}">
						<span class="input1-unit">kg</span>
					</div>
				</div>
				<!-- 종 -->
				<div class="mypet-edit-box ">
					<div class="mud-input">
						<input class="input1" type="text" name="breed" id="tags1" value="${dto.breed}">
					</div>
				</div>
				<!-- 생일 -->
				<div class="mypet-edit-box ">
					<div class="mud-input">
						<input class="input1" type="date" name="birth" value="${dto.birth2}">
					</div>
				</div>
				<div class="mypet-edit-detail-btn">
					<button class="btn16" type="button">취소하기</button>
					<button class="btn17" type="button" onclick="sendOk();">수정하기</button>
					<input type="hidden" name="num" value="${dto.num}">
					<input type="hidden" name="petsImageFilename" value="${dto.petsImageFilename}">
				</div>
			</div>
			</form>
		</div>

</div>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dogs.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cats.js"></script>