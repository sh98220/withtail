<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class='table table-borderless' style="min-width: auto !important;">
	<c:forEach var="vo" items="${listReply}">
		<tr class='reply-tit'>
			<td class="td-icon" style="text-align: left !important; border-bottom: 0 !important;">
				<div class='reply-writer'>
					<div><i class='bi bi-person-circle text-muted icon'></i></div>
				</div>
			</td>
			<td class="td-writer" style="text-align: left !important; max-width: 700px; border-bottom: 0 !important;">
				<div class='col-auto align-self-center rp-con'>
					<div class='name'>${vo.nickname}</div>
					<p style="margin-bottom: 0;">${vo.content}</p>
				</div>
			</td>
			<td class='align-middle td-delete' style="text-align: right !important; border-bottom: 0 !important;">
				<a class='deleteReply' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo }' href="#">삭제</a>
			</td>
		</tr>
		<tr>
			<td class="td-date" colspan='3' style="border-bottom: 0 !important; text-align: left !important; border-bottom: 1px solid #eee !important; padding: 0; padding-bottom: 10px;">
				<span class='date'>${vo.regDate}</span>
				<button type='button' class='btn btn-outline-secondary btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
			</td>
		</tr>

	
	    <tr class='reply-answer'>
	        <td colspan='3'>
	        	<div class='border rounded'>
		            <div id='listReplyAnswer${vo.replyNum}' class='answer-list'></div>
		            <div>
		                <textarea class="form-control m-2"></textarea>
		            </div>
					<div class='text-end pe-2 pb-1'>
						<button type='button' class='btn btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
		            </div>
	            </div>
			</td>
	    </tr>
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>			
