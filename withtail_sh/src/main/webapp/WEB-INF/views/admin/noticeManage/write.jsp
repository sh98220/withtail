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

.table-form tr>td:first-child {
    width: 110px;
    text-align: center;
    background: #eee;
}

.table-border tbody > tr {
    border-bottom: 1px solid #dee2e6;
}
.btn{
	border-radius: 0.375rem;
	width: 80px;
	height: 37px;
}
.btn:hover{background: #6C757D; color: white}

</style>

<script type="text/javascript">

<c:if test="${mode=='update'}">
  function deleteFile(fileNum) {
		let url = "${pageContext.request.contextPath}/admin/noticeManage/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
  } 
</c:if>

 
</script>

<script type="text/javascript">
    function check() {
        const f = document.noticeForm;

    	let str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
    	if( !str || str === "<p><br></p>" ) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	f.action="${pageContext.request.contextPath}/admin/noticeManage/${mode}";

        return true;
    }
</script>

<div class="out">
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-circle-exclamation"></i> 공지사항 </h2>
    </div>
    
    	
		<form name="noticeForm" method="post" enctype="multipart/form-data">
			<table class="table table-border border-top2 table-form">
				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input style="border: 1px solid #ced4da;" type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject }">
					</td>
				</tr>
			
				<tr> 
					<td>공지여부</td>
					<td> 
						<input type="checkbox" name="alarm" id="notice" class="form-check-input" value="1" ${dto.alarm==1 ? "checked='checked' ":"" }>
						<label for="notice" class="form-check-label">공지</label>
					</td>
				</tr>

				<tr> 
					<td>출력여부</td>
					<td> 
						<input type="checkbox" name="enabled" id="showNotice" class="form-check-input" value="1" ${mode=="write" || dto.enabled==1 ? "checked='checked' ":"" }>
						<label for="showNotice" class="form-check-label">표시</label>
					</td>
				</tr>
			  
				<tr> 
					<td>작성자</td>
					<td> 
						<p class="form-control-plaintext">${sessionScope.member.userName}</p>
					</td>
				</tr>
			
				<tr> 
					<td valign="top" >내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"> 
						<textarea style="border: 1px solid #ced4da;" name="content" id="ir1" class="form-control">${dto.content}</textarea>
					</td>
				</tr>
			  
				<tr>
					<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
						<input style="border: 1px solid #ced4da;" type="file" name="selectFile" class="form-control" multiple="multiple">
					</td>
				</tr>
	              
				<c:if test="${mode=='update'}">
					<c:forEach var="vo" items="${listFile}">
						<tr id="f${vo.fileNum}"> 
							<td>첨부된파일</td>
							<td> 
								<a href="javascript:deleteFile('${vo.fileNum}');"><i class="fa-solid fa-trash-can"></i></a> 
								${vo.originalName}
							</td>
						  </tr>
					</c:forEach>
				</c:if>
			</table>
				
			<table class="table">
				<tr> 
					<td align="center">
						<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
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