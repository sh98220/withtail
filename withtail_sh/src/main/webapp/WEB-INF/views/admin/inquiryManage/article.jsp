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
.btn{
	border-radius: 0.375rem;
	height: 37px;
}
.btn:hover{background: #6C757D; color: white}


.pointhover:hover{
  background-color: #82ae4654;
 }
.row-flex { display: flex; justify-content: space-between; }
.left-item {
	width:100px; margin-right: 1px;    padding:10px 10px;
	height : 48px;
	color : #fff;
    text-align: center;
	font-weight: bold;
	background: #999999;
	
}
.right-item {
	flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    word-spacing: nowrap;
    box-sizing: border-box;
    padding: 10px 7px;
	font-weight: 600;
	border-top: 1px solid #dee2e6;
	border-right: 1px solid #dee2e6;
	border-bottom: 2px solid #999999;
}
.left-item1 {
	width:100px; margin-right: 1px;    padding:10px 10px;
	height : 48px;
	color : #fff;
    text-align: center;
	font-weight: bold;
	background: #82ae46;
	
}
.right-item1 {
	flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    word-spacing: nowrap;
    box-sizing: border-box;
    padding: 10px 7px;
	font-weight: 600;
	border-top: 1px solid #dee2e6;
	border-right: 1px solid #dee2e6;
	border-bottom: 2px solid #82ae46;
}

.right-question {  text-align: center;}

.right-answer {  text-align: center;}
</style>

<script type="text/javascript">
function deleteInquiry(num) {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryManage/delete?"+query;
		location.href = url;
	}
}

function deleteAnswer(num) {
	if(confirm("답변을 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryManage/deleteAnswer?"+query;
		location.href = url;
	}
}

function sendAnswerOk() {
	const f = document.answerForm;
	if(!f.answer.value.trim()) {
		alert("답변을 입력 하세요");
		f.answer.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/inquiryManage/answer";
	f.submit();
}
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-person-circle-question"></i> 1:1 문의 </h2>
    </div>

		<table class="table table-border table-article">
			<tbody>
				<tr style="border: none;">
					<td colspan="2" style="padding: 10px 0 0 0;">
						<div class="row-flex">
							<div class="left-item left-question"><span>Q</span></div>
							<div class="right-item right-question">[${dto.category}] ${dto.subject}</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="100%" align="right" style="font-weight: bold;">
						작성자 : ${dto.userName}(${dto.userId}) | 문의일자 : ${dto.regDate}
					</td>
				</tr>
				
				<tr>
					<td colspan="2" valign="top" height="120" style=" border-bottom: 1px solid #eee; padding: 20px;">
						${dto.content}
					</td>
				</tr>
			</tbody>
		</table>
		<br><br><br>
		<c:if test="${not empty dto.answer}">
			<table class="table table-border table-article">
				<tbody>
					<tr style="border: none;">
						<td colspan="2" style="padding: 0 0 0 0;">
							<div class="row-flex">
								<div class="left-item1 left-answer1">A</div>
								<div class="right-item1 right-answer">[답변] ${dto.subject}</div>
							</div>
						</td>
					</tr>
					<tr>
						<td width="100%" align="right" style="font-weight: bold;">
							담당자 : ${dto.answerName} | 답변일자 :  ${dto.answerDate}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="120" style=" padding: 20px;">
							${dto.answer}
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>

		<table class="table">
			<tr>
				<td width="50%" align="left">
					<button style="height: 40px;" type="button" class="btn" onclick="deleteInquiry('${dto.num}');">질문삭제</button>
					<c:if test="${not empty dto.answer}">
						<button style="height: 40px;" type="button" class="btn" onclick="deleteAnswer('${dto.num}');">답변삭제</button>
					</c:if>
				</td>
			
				<td align="right">
					<button style="height: 40px;" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryManage/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
		<c:if test="${empty dto.answer}">
			<div class="reply">
				<form name="answerForm" method="post">
					<div class='form-header'>
						<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
					</div>
					
					<table class="table reply-form">
						<tr>
							<td>
								<textarea class='form-control' name='answer'></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn' onclick="sendAnswerOk()">답변 등록</button>
						        <input type="hidden" name="num" value="${dto.num}">
						        <input type="hidden" name="page" value="${page}">
						        <input type="hidden" name="condition" value="${condition}">
						        <input type="hidden" name="keyword" value="${keyword}">
						    </td>
						 </tr>
					</table>
				</form>
			</div>
		</c:if>
			
	</div>
</div>
