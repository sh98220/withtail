<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}
.body-main {
	width: 960px;
}
</style>


<style type="text/css">
.img-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, 50px);
	grid-gap: 5px;
}

.mainImage-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.img-grid .item {
    object-fit: cover; /* 가로세로 비율은 유지하면서 컨테이너에 꽉 차도록 설정 */
    width: 50px;
    height: 50px;
	cursor: pointer;
	border: 1px solid #c2c2c2;
	border-radius: 10px;
}

.img-box {
	max-width: 600px;
	box-sizing: border-box;
	display: flex; /* 자손요소를 flexbox로 변경 */
	flex-direction: row; /* 정방향 수평나열 */
	flex-wrap: nowrap;
	overflow-x: auto;
}

.img-box img {
	width: 50px; height: 50px;
	margin-right: 5px;
	flex: 0 0 auto;
	cursor: pointer;
	border: 1px solid #c2c2c2;
	border-radius: 10px;
}

</style>

<script type="text/javascript">
/*
<c:if test="${mode=='update'}">
  function deleteFile(fileNum) {
		let url = "${pageContext.request.contextPath}/admin/noticeManage/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
  } 
</c:if>

 */
</script>


<script type="text/javascript">
function check() {
	const f = document.dogmapForm;
	let str, b;
	let mode = "${mode}";
	
	
	f.action = "${pageContext.request.contextPath}/admin/dogMapManage/${mode}";
	return true;
}
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-democrat" ></i> Tail  &amp; Path </h2>
    </div>
    	
		<form name="dogmapForm" method="post" enctype="multipart/form-data">
			<table class="table table-border border-top2 table-form">
				<tr> 
					<td>시설번호</td>
					<td> 
						<input type="text" name="placeNum" maxlength="100" class="form-control" value="${dto.placeNum }">
					</td>
				</tr>
				<tr> 
					<td>시설명</td>
					<td> 
						<input type="text" name="placeName" maxlength="100" class="form-control" value="${dto.placeName}">
					</td>
				</tr>
				
				<tr>
					<td>소개</td>
					<td valign="top"> 
						<textarea name="content" id="ir1" class="form-control">${dto.content }</textarea>
					</td>
				</tr>
				
	            <tr>
					<td class="table-light col-sm-2">대표이미지</td>
					<td>
						<div class="mainImage-viewer"></div>
						<input type="file" name="mainImageFile" accept="image/*" class="form-control" style="display: none;">
					</td>
				</tr>
				
				<tr>
					<td class="table-light col-sm-2">추가이미지</td>
					<td>
						<div class="img-grid">
							<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							<c:forEach var="vo" items="${listPhoto}">
								<img src="${pageContext.request.contextPath}/uploads/dogMap/${vo.photoName}"
									class="item delete-img"
									data-photoNum="${vo.photoNum}"
									data-photoName="${vo.photoName}">
							</c:forEach>
						</div>
						<input type="file" name="addFiles" accept="image/*" multiple="multiple" class="form-control" style="display: none;">
					</td>
				</tr>  
				
				
			</table>
				
			<table class="table">
				<tr> 
					<td align="center">
						<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/dogMapManage/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="placeNum" value="${dto.placeNum}">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="mainImage" value="${dto.mainImage}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		    	
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.mainImage}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/dogMap/"+img;
		$(".mainImage-viewer").empty();
		$(".mainImage-viewer").css("background-image", "url("+img+")");
	}
	
	$(".mainImage-viewer").click(function(){
		$("form[name=dogmapForm] input[name=mainImageFile]").trigger("click");
	});
	
	$("form[name=dogmapForm] input[name=mainImageFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".mainImage-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/dogMap/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".mainImage-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".mainImage-viewer").empty();
			$(".mainImage-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

//수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let photoNum = $img.attr("data-photoNum");
		let photoName = $img.attr("data-photoName");
		let url="${pageContext.request.contextPath}/admin/dogMapManage/deletePhoto";
		$.post(url, {photoNum:photoNum, photoName:photoName}, function(data){
			$img.remove();
		}, "json");
	});
});

//추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".img-add", function(){
		$("form[name=dogmapForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=dogmapForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.dogmapForm.addFiles.files = dt.files;
			
			return false;
		}
		
     for(let file of this.files) {
     	sel_files.push(file);
     	
         const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-photoName", file.name);
         reader.onload = e => {
         	$img.attr("src", e.target.result);
         };
			reader.readAsDataURL(file);
         
         $(".img-grid").append($img);
     }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.dogmapForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-photoName");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.dogmapForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>
