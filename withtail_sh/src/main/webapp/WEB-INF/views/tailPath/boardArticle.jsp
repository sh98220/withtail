<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	a {
		color: #212529;
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

<<script type="text/javascript">
//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $trReplyAnswer = $(this).closest("tr").next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			//listReplyAnswer(replyNum);
			
			// 답글 개수
			//countReplyAnswer(replyNum);
		}
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
						저희 강아지를 소개합니다.
					</td>
				</tr>
				<tr>
					<td style="text-align: left !important;">
						작성자 : 김자바
					</td>
					<td style="text-align: right !important;">
						작성일 : 2023-06-19 09:00<span class="bar-span">|</span>조회 : 0
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important; vertical-align: top; border-bottom: 0 !important;" height="200">
						저희 강아지 이름은 파이썬입니다.
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-bottom: 20px;">
						<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi bi-hand-thumbs-up"></i>&nbsp;&nbsp;<span id="boardLikeCount">0</span></button>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">파일 : </td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">이전글 : </td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">다음글 : </td>
				</tr>
			</tbody>
		</table>
		
		<div class="col-md-12 d-flex mx-auto" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<div class="col-md-6 text-start" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary">수정</button>
				<button type="button" class="btn btn-outline-secondary">삭제</button>
			</div>
			<div class="col-md-6 text-end" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/tailPath/boardList';">리스트</button>
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

			<div id="listReply col-md-12 mx-auto mt-3" style="max-width: 800px; padding-left: 0; padding-right: 0;">
				<!-- 댓글 리스트. jsp 파일 분리 필요 -->
				<div class='reply-info'>
					<span class='reply-count'>댓글 1개</span>
					<span>[목록, 1/2 페이지]</span>
				</div>
				
				<table class='table table-borderless' style="min-width: 800px !important; max-width: 800px !important;">
						<tr class='reply-tit'>
							<td class="td-icon" style="text-align: left !important; border-bottom: 0 !important;">
								<div class='reply-writer'>
									<div><i class='bi bi-person-circle text-muted icon'></i></div>
								</div>
							</td>
							<td class="td-writer" style="text-align: left !important; max-width: 700px; border-bottom: 0 !important;">
								<div class='col-auto align-self-center rp-con'>
									<div class='name'>김자바</div>
									<p style="margin-bottom: 0;">댓글입니다. 아이우에오 카키쿠케고</p>
								</div>
							</td>
							<td class='align-middle td-delete' style="text-align: right !important; border-bottom: 0 !important;">
								<a class='deleteReply' data-replyNum='11' data-pageNo='1' href="#">삭제</a>
							</td>
						</tr>
						<tr>
							<td class="td-date" colspan='3' style="border-bottom: 0 !important; text-align: left !important; border-bottom: 1px solid #eee !important; padding: 0; padding-bottom: 10px;">
								<span class='date'>2023-06-20 09:00:20</span>
								<button type='button' class='btn btn-outline-secondary btnReplyAnswerLayout' data-replyNum='11'>답글 <span id="answerCount11">1</span></button>
							</td>
						</tr>
					
					    <tr class='reply-answer'>
					        <td colspan='3'>
					        	<div class='border rounded'>
						            <div id='listReplyAnswer11' class='answer-list'>
						            	<!-- 답글 리스트. jsp 분리 필요 -->
										<div class='border-bottom m-1'>
											<div class='row p-1'>
												<div class='col-auto'>
													<div class='reply-writer d-flex'>
														<div class="td-icon" style="width: 45px;"><i class='bi bi-person-circle text-muted icon'></i></div>
														<div class="rp-con" style="text-align: left !important; margin-top: 5px; max-width: 650px;">
															<div class='name'>김자바</div>
															<p style="margin-bottom: 0;">답글 내용입니다.</p>
														</div>
													</div>
												</div>
												<div class='col align-self-center text-end td-delete'>
													<a class='deleteReply' data-replyNum='11' data-pageNo='1' href="#">삭제</a>
												</div>
											</div>
											<div class='td-date mb-2' style="text-align: left !important; padding-left: 13px;">2023-06-20 09:00</div>
										</div>
										<!-- //답글 리스트. jsp 분리 필요 -->
						            </div>
						            <div>
						                <textarea class="form-control m-2"></textarea>
						            </div>
									<div class='text-end pe-2 pb-1'>
										<button type='button' class='btn btnSendReplyAnswer' data-replyNum='11'>답글 등록</button>
						            </div>
					            </div>
							</td>
					    </tr>
				</table>
				<!-- //댓글 리스트. jsp 파일 분리 필요 -->
			</div>
		</div>
		<!-- //댓글 등록 -->
	</div>
</section>