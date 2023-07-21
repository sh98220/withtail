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
	
	.notice-h3 > a {
		color: #555;
	}
	.notice-h3 > a:hover {
		color: #555 !important;
	}
	
	.event_img {
		width: 100%;
		display: block;
	}
	
	.ev-tit {
		font-weight: 600;
		font-size: 18px;
	}
	
	.ing-span {
		background: #82ae46;
		color: #fff;
		padding: 3px 10px;
		display: inline-block;
		border-radius: 0.375rem;
		font-size: 14px;
		vertical-align: middle;
		font-weight: normal;
	}
	
	.exit-span {
		background: #999;
		color: #fff;
		padding: 3px 10px;
		display: inline-block;
		border-radius: 0.375rem;
		font-size: 14px;
		vertical-align: middle;
		font-weight: normal;
	}
	
	.va-m {
		vertical-align: middle;
	}
	
	.name-span {
		font-weight: 600;
	}
	
	.num-span {
		font-weight: 600;
		color: red;
	}
	
	/* 당첨자 모달 */
	.winner-div {
		display: inline-block;
		padding: 5px 10px;
	}
	
	img {
		max-width: 100%;
	}
	
</style>

<script>
$(function() {
	   $('.btnEventApply').click(function() {
	     
	      let num = ${dto.num}
	      
	      console.log(num);
	      
	      insertEventApply(num);
	      
	   });
	   
	   function insertEventApply(num) {
	      $.ajax({
	            url: "${pageContext.request.contextPath}/event/insertApply",
	            type: "POST", 
	            data: { num:num },
	            dataType: "JSON",
	            success: function(data) {
	              console.log("입력 성공");
	              alert("지원했습니다");
	           	  window.location.reload();
	            },
	            error: function(xhr, status, error) {
	             
	              console.error("실패");
	            
	            }
	          });
	   }
	   
	});

</script>

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center notice-h3">
			<a href="${pageContext.request.contextPath}/event/list">이벤트</a>
		</h3>
		
		<table class="table table-bordered mx-auto" style="min-width: 800px !important; max-width: 800px !important;">
			<tbody style="border-top: 2px solid #999;">
				<tr>
					<td colspan="2" class="ev-tit" style="border-bottom: 1px solid #999 !important;">
					<c:if test="${category=='progress'}">
						<span class="ing-span mr-2">진행중</span>
					</c:if>
					<c:if test="${category!='progress'}">
						<span class="exit-span mr-2">종료</span>
					</c:if>
						
						<span class="va-m">구매후기 이벤트</span>
					</td>
				</tr>
				<tr>
					<td style="text-align: left !important;">
						이벤트 기간 : ${dto.startDate} ~ ${dto.endDate}
					</td>
					<td style="text-align: right !important;">
						작성자 : 관리자<span class="bar-span">|</span>조회 : ${dto.hitCount}
					</td>
				</tr>
				<tr>
					<td style="text-align: left !important;">
						종료일자 : ${dto.winningDate}
					</td>
					<td style="text-align: right !important;">
						추첨인원 : ${dto.maxCount}명
					</td>
				</tr>
				<!--  
				<tr>
					<td colspan="2">
						<p style="margin: 0; padding: 1rem 0; font-size: 16px;">
							축하합니다. <span class="name-span">김자바</span>님은 이벤트에 <span class="num-span">1등</span>으로 당첨되었습니다.
						</p>
					</td>
				</tr>
				-->
				<tr>
					<td colspan="2" style="text-align: left !important; vertical-align: top;">
						<img alt="이벤트 배너" src="${pageContext.request.contextPath}/uploads/event/${dto.imageFileName}" class="event_img mb-2">
						${dto.content}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 20px 0;">
						  <c:if test="${category == 'progress'}">
						  	<c:if test="${result == 0}">
	                     		<button type="button" class="btn btn-outline-secondary btnEventApply">
									참여하기
								</button>
							</c:if>
							<c:if test="${result != 0}">
	                     		<button type="button" class="btn btn-outline-secondary btnEventApply" disabled="disabled">
									참여불가
								</button>
							</c:if>
		                  </c:if>
		                  <c:if test="${category == 'ended' || category == 'winner'}">
		                     <button type="button" class="btn btn-outline-secondary btnEventWinnerList">
								이벤트 당첨자 확인
							</button>
		                  </c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
						이전글 :
						<c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/event/article?category=${category}&num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
					
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
						다음글 :
						<c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/event/article?category=${category}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="col-md-12 d-flex mx-auto" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<div class="col-md-6 text-start" style="padding-left: 0; padding-right: 0;">
				<!--<button type="button" class="btn btn-outline-secondary">삭제</button>-->
			</div>
			<div class="col-md-6 text-end" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list';">리스트</button>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
	<script type="text/javascript">
		$(function(){
			$(".btnEventWinnerList").click(function(){
				$("#eventWinnerModal").modal("show");	
			});
		});
	</script>
	
	<div class="modal fade" id="eventWinnerModal" tabindex="-1" aria-labelledby="eventWinnerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventWinnerModalLabel">이벤트 당첨자 리스트</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
	                 <div class="row row-cols-4 g-1">
	                 		<div class="col">
	                 			<div class="border winner-div">
	                 				
	                 				<c:forEach var="dto" items="${list}">
		                 				<c:if test="${dto.rank != 0}">
		                 					<span>
												${dto.rank}등 :
											</span>
											<span style="font-weight: 500;">
												${dto.nickName}(${dto.userId})
											</span>
											<br>
										</c:if>
										<c:if test="${dto.rank == 0}">
											<span style="font-weight: 500;">
												${dto.nickName}(${dto.userId})
												<br>
											</span>
										</c:if>
	                 				</c:forEach>
									
								</div>
	                 		</div>
	                 </div>
				</div>
			</div>
		</div>
	</div>
	<!-- //모달 -->
</section>
