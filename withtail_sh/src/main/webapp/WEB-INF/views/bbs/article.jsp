<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	a {
		color: #212529;
	}
	
	img {
		max-width: 100%;
	}
	
	.notice-h3 {
		color: #555;
		font-weight: bold;
		margin-bottom: 1.5rem;
	}
	
	.bold {
		font-weight: bold;
	}
	
	.bp-tit {
		font-weight: 600;
	}
	
	.table-bordered thead th, .table-bordered thead td {
    	border-bottom: none;
	}
	
	.table tbody tr td {
    	padding: 10px;
	}
	
	.bar-span {
		color: #999;
		display: inline-block;
		margin-left: 5px;
		margin-right: 5px;
	}
	
	/* 댓글 */
	.reply { clear: both; padding: 20px 0 10px; line-height: 1.5; }
	.reply .bold { font-weight: 600; }
	
	.reply .form-header { padding-bottom: 7px; color: #212529; }
	.reply-form  tr>td { padding: 2px 0 2px; }
	.reply-form textarea { width: 100%; height: 75px; resize: none; }
	.reply-form button { padding: 8px 25px; }
	
	.reply .reply-info { padding-bottom: 7px; }
	.reply-info .reply-count { color: #000; font-weight: 600; }
	
	.reply .reply-dropdown { cursor: pointer; }
	.reply .reply-dropdown:hover { color: #0d6efd; font-weight: 500; }
	.reply .reply-menu { display: none; position: absolute; width: 80px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999; }
	.reply .reply-menu-item { text-align: center; cursor: pointer; padding: 7px; }
	.reply .reply-menu-item:nth-child(2n+1) { border-bottom: 1px solid #d5d5d5; }
	.reply .reply-menu-item:hover { color: #0d6efd; font-weight: 500; }
	
	.reply-answer { display: none; }
	.reply-answer textarea { width:98%; height: 75px; resize: none; }
	
	
	.reply-tit {
		
	}
	
	.rp-con {
		max-width: 700px;
		display: inline-block;
	}
	
	.reply-writer .icon { font-size: 2.25rem; color: #999; }
	.rp-con { padding: 0 !important; }
	.rp-con .name { font-weight: 600; }
	.td-icon { width: 43px; padding: 0 !important; }
	.td-writer { padding: 0 !important; }
	.td-delete { width: 50px; font-size: 12px; }
	.deleteReply { color: #999; }
	.td-date {color: #999; font-size: 12px;}
	
	.btnReplyAnswerLayout {
		font-size: 12px;
		border-radius: 0.375rem;
		padding: 0px 5px;
		margin-left: 5px;
	}
	
	.btnSendReply {
		background: #82ae46;
		color: #fff;
	}
	.btnSendReply:hover {
		background: #999;
		color: #fff;
	}
	
	.btnSendReplyAnswer {
		background: #82ae46;
		color: #fff;
	}
	.btnSendReplyAnswer:hover {
		background: #999;
		color: #fff;
	}
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId||sessionScope.member.membership>50}">
	function deleteBoard() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
		    let query = "num=${dto.num}&${query}";
		    let url = "${pageContext.request.contextPath}/bbs/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

// 게시글 공감 여부
$(function(){
	$(".btnSendBoardLike").click(function(){
		const $i = $(this).find("i");
		let userLiked = $i.hasClass("bi-hand-thumbs-up-fill");
		let msg = userLiked ? "게시글 공감을 취소하시겠습니까 ? " : "게시글에 공감하십니까 ? ";
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/bbs/insertBoardLike";
		let num = "${dto.num}";
		let query = "num="+num+"&userLiked="+userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				if( userLiked ) {
					$i.removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
				} else {
					$i.removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
				}
				
				var count = data.boardLikeCount;
				$("#boardLikeCount").text(count);
			} else if(state === "liked") {
				alert("게시글 공감은 한번만 가능합니다. !!!");
			} else if(state === "false") {
				alert("게시물 공감 여부 처리가 실패했습니다. !!!");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/bbs/listReply";
	let query = "num=${dto.num}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, "get", query, "html", fn);
	ajaxFun(url, "get", query, "text", fn);
}

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		let num = "${dto.num}";
		const $tb = $(this).closest("table");

		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/bbs/insertReply";
		let query = "num=" + num + "&content=" + content + "&answer=0";
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else if(state === "false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 삭제, 신고 메뉴
$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset(); // 선택한 요소 집합의 첫 번째 요소의 위치를 HTML 문서를 기준으로 반환
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	$("body").on("click", function() {
		if($(event.target.parentNode).hasClass("reply-dropdown")) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/bbs/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=reply";
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


// 댓글별 답글 리스트
function listReplyAnswer(answer) {
	let url = "${pageContext.request.contextPath}/bbs/listReplyAnswer";
	let query = "preNum=" + answer;
	let selector = "#listReplyAnswer" + answer;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

// 댓글별 답글 개수
function countReplyAnswer(answer) {
	let url = "${pageContext.request.contextPath}/bbs/countReplyAnswer";
	let query = "preNum=" + answer;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+answer;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $trReplyAnswer = $(this).closest("tr").next();
		// const $trReplyAnswer = $(this).parent().parent().next();
		// const $answerList = $trReplyAnswer.children().children().eq(0);
		
		let isVisible = $trReplyAnswer.is(':visible');
		let replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            console.log(replyNum);
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});
	
});

// 댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		let num = "${dto.num}";
		let replyNum = $(this).attr("data-replyNum");
		const $td = $(this).closest("td");
		
		let content = $td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/bbs/insertReply";
		let query = "num=" + num + "&content=" + content + "&preNum=" + replyNum;
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			var state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let answer = $(this).attr("data-answer");
		
		let url = "${pageContext.request.contextPath}/bbs/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=answer";
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

</script>

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center notice-h3">커뮤니티</h3>
		
		<table class="table table-bordered mx-auto" style="min-width: 800px !important; max-width: 800px !important;">
			<tbody style="border-top: 2px solid #999;">
				<tr>
					<td colspan="2" style="border-bottom: 1px solid #999 !important;">
						${dto.subject}
					</td>
				</tr>
				<tr>
					<td style="text-align: left !important;">
						작성자 : ${dto.nickname}
					</td>
					<td style="text-align: right !important;">
						작성일 : ${dto.regDate}<span class="bar-span">|</span>조회 : ${dto.hitCount}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important; vertical-align: top; border-bottom: 0 !important;" height="200">
						${dto.content}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom: 20px;">
						<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi bi-hand-thumbs-up"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
					이전글 :
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/bbs/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
					다음글 :
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/bbs/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
					</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="col-md-12 d-flex mx-auto" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<div class="col-md-6 text-start" style="padding-left: 0; padding-right: 0;">
				<c:choose>
					<c:when test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/update?num=${dto.num}&page=${page}';">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" disabled="disabled">수정</button>
					</c:otherwise>
				</c:choose>
		    	
				<c:choose>
		    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
		    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
		    		</c:when>
		    		<c:otherwise>
		    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
		    		</c:otherwise>
		    	</c:choose>
			</div>
			<div class="col-md-6 text-end" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/bbs/list?${query}';">리스트</button>
			</div>
		</div>
		
		<!-- 댓글 등록 -->
		<div class="reply col-md-12 mx-auto mt-3" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<form name="replyForm" method="post">
				<div class='form-header'>
					<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의
						게시를 삼가해 주세요.</span>
				</div>

				<table class="table table-borderless reply-form" style="min-width: 800px !important; max-width: 800px !important;">
					<tr>
						<td style="padding: 0 0 10px 0; border-bottom: 0 !important;">
							<textarea class='form-control' name="content" style="border-radius: 0.375rem;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: right !important; padding: 0; padding-bottom: 10px; border-bottom: 0 !important;">
							<button type='button' class='btn btnSendReply'>댓글 등록</button>
						</td>
					</tr>
				</table>
			</form>

			<div id="listReply" class="col-md-12 mx-auto mt-3" style="max-width: 800px; padding-left: 0; padding-right: 0;">
				
			</div>
		</div>
	</div>
</section>