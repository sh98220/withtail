<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}

.img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#tab-${category}').addClass('active');
	
		$('ul.tabs li').click(function() {
			let category = $(this).attr('data-category');
			
			location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
		});
	});

	function isValidDateFormat(data){
		if(data.length !== 8 && data.length !== 10) return false;
			
		let p = /(\.)|(\-)|(\/)/g;
		data = data.replace(p, "");
		if(data.length !== 8) return false;
		
		let format = /^[12][0-9]{7}$/;
		if(! format.test(data)) return false;
	    
		let y = parseInt(data.substr(0, 4));
		let m = parseInt(data.substr(4, 2));
		let d = parseInt(data.substr(6));
	
		if(m<1 || m>12) return false;
		let lastDay = (new Date(y, m, 0)).getDate();
		if(d<1 || d>lastDay) return false;
		
		return true;
	}

    function check() {
        const f = document.eventForm;
        let mode = "${mode}";

    	let str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	if(! isValidDateFormat(f.startDay.value)) {
    		alert("날짜를 입력하세요.");
    		f.startDay.focus();
    		return false;
    	}
    	
    	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.startTime.value)) {
    		alert("시간을 입력하세요.");
    		f.startTime.focus();
    		return false;
    	}


    	if(! isValidDateFormat(f.endDay.value)) {
    		alert("날짜를 입력하세요.");
    		f.endDay.focus();
    		return false;
    	}
    	
    	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.endTime.value)) {
    		alert("시간을 입력하세요.");
    		f.endTime.focus();
    		return false;
    	}
    	
    	let sd = new Date(f.startDay.value + " " + f.startTime.value);
    	let ed = new Date(f.endDay.value + " " + f.endTime.value);
    	
    	if( sd.getTime() >= ed.getTime() ) {
    		alert("시작날짜는 종료날짜보다 크거나 같을 수 없습니다.");
    		f.startDay.focus();
    		return false;
    	}

    	if( mode === "write" && new Date().getTime() > ed.getTime() ) {
    		alert("종료날짜는 현재 시간보다 작을수 없습니다.");
    		f.endDay.focus();
    		return false;
    	}
    	
    	if(!/^(\d)+$/.test(f.maxCount.value)) {
    		alert("당첨인원을 입력 하세요.");
    		f.maxCount.focus();
    		return false;
    	}
    	
    	if(f.maxCount.value !== "0") {
        	if(! isValidDateFormat(f.winningDay.value)) {
        		alert("날짜를 입력하세요.");
        		f.winningDay.focus();
        		return false;
        	}
        	
        	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.winningTime.value)) {
        		alert("시간을 입력하세요.");
        		f.winningTime.focus();
        		return false;
        	}
        	
    		let wd = new Date(f.winningDay.value + " " + f.winningTime.value);
    		
        	if( wd.getTime() < ed.getTime() ) {
        		alert("당첨일자는 종료날짜보다 작을수 없습니다.");
        		f.winningDay.focus();
        		return false;
        	}    		
    	}
        
    	str = f.content.value;
    	if( !str || str === "<p><br></p>" ) {
            alert("내용을 입력하세요.");
            f.content.focus();
            return false;
        }

    	if( (mode === "write") && (!f.selectFile.value) ) {
    	        alert("이미지 파일을 추가 하세요. ");
    	        f.selectFile.focus();
    	        return;
         }    

        f.action = "${pageContext.request.contextPath}/admin/eventManage/${category}/${mode}";
        return true;

    }
    
$(function() {
    	let img = "${dto.imageFilename}";
    	if( img ) { // 수정인 경우
    		img = "${pageContext.request.contextPath}/uploads/photo/" + img;
    		$(".img-viewer").empty();
    		$(".img-viewer").css("background-image", "url("+img+")");
    	}
    	
    	$(".img-viewer").click(function(){
    		$("form[name=eventForm] input[name=selectFile]").trigger("click"); 
    	});
    	
    	$("form[name=eventForm] input[name=selectFile]").change(function(){
    		let file = this.files[0];
    		if(! file) {
    			$(".img-viewer").empty();
    			if( img ) {
    				img = "${pageContext.request.contextPath}/uploads/photo/" + img;
    			} else {
    				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
    			}
    			$(".img-viewer").css("background-image", "url("+img+")");
    			
    			return false;
    		}
    		
    		if(! file.type.match("image.*")) {
    			this.focus();
    			return false;
    		}
    		
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			$(".img-viewer").empty();
    			$(".img-viewer").css("background-image", "url("+e.target.result+")");
    		}
    		reader.readAsDataURL(file);
    	});
});
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-regular fa-calendar"></i> 이벤트 </h2>
    </div>
		<div>
			<ul class="tabs">
				<li id="tab-all" data-category="all">전체 이벤트</li>
				<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
				<li id="tab-winner" data-category="winner">당첨자 발표</li>
				<li id="tab-ended" data-category="ended">종료된 이벤트</li>
				<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
			<form name="eventForm" method="post" enctype="multipart/form-data">
				<table class="table table-border border-top2 table-form">
					<tr> 
						<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td> 
							<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
						</td>
					</tr>
	
					<tr>
						<td>시작일자</td>
						<td> 
							<input type="date" name="startDay" class="form-control" value="${dto.startDay}">
							<input type="time" name="startTime" class="form-control" value="${dto.startTime}">
						</td>
					</tr>
	
					<tr>
						<td>종료일자</td>
						<td> 
							<input type="date" name="endDay" class="form-control" value="${dto.endDay}">
							<input type="time" name="endTime" class="form-control" value="${dto.endTime}">
						</td>
					</tr>
	
					<tr>
						<td>당첨인원</td>
						<td> 
							<p> <input type="number" name="maxCount" class="form-control" value="${dto.maxCount}"> </p>
							<p class="help-block">당첨 인원이 0이면 당첨자가 없습니다.</p>
						</td>
					</tr>
					<tr>
						<td>발표일자</td>
						<td>
							<p> 
								<input type="date" name="winningDay" class="form-control" value="${dto.winningDay}">
								<input type="time" name="winningTime" class="form-control" value="${dto.winningTime}">
							</p>
							<p class="help-block">당첨 인원이 0이면 발표일자는 저장되지 않습니다.</p>
						</td>
					</tr>
					
					<tr> 
						<td>출력여부</td>
						<td> 
							<input type="checkbox" name="enabled" id="enabled" class="form-check-input" value="0" ${mode=="write" || dto.enabled==0 ? "checked='checked' ":"" }>
							<label for="enable" class="form-check-label">표시</label>
						</td>
					</tr>
				
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top"> 
							<textarea name="content" id="ir1" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
				   <tr>
						<td class="table-light col-sm-2" scope="row">이미지</td>
						<td>
							<div class="img-viewer"></div>
							<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
				  
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>		
		    	
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