<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-md-12">
					<div class="rv-tit d-flex align-items-center gap-2 pb-2">
						<div style="font-weight: 600; color: #333; font-size: 24px;">리뷰</div>
						<div class="rv-count" style="color: #999; vertical-align: middle; font-size: 18px; font-weight: 600;">${dataCount}</div>
					</div>
					
					<div class="rv-tit-score d-flex align-items-center container-fluid mb-3" style="border-bottom: 1px solid rgb(201, 207, 214);">
						<div class="d-flex align-items-center justify-content-center" style="width: 40%; height: 200px; flex-direction: column;">
							<div class="d-flex gap-2 align-items-center justify-content-center">
								<h2 style="color: #82ae46;">★</h2>
								<h2 class="rv-star-avg" style="font-weight: 600;">${avgStar}</h2>
							</div>
							<div class="text-center">
								<div class="rv-count-div">
									${dataCount}개의 리뷰
								</div>
							</div>
						</div>
						<div class="hr" style="width: 1px;"></div>
						<div class="d-flex justify-content-center" style="height: 200px; width: 60%; flex-direction: column; padding: 0 70px;">
							<h2 style="color: #82ae46;">★★★★★</h2>
							<div style="font-weight: 600; font-size: 16px; color: rgb(23, 24, 26);">구매자의 100%가 이 상품에 만족했어요 !</div>
						</div>
					</div>
					
					<!-- 리뷰 foreach -->
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="rv-container">
							<ul class="rv-cont container-fluid d-flex" style="padding-left: 0 !important; padding-right: 0 !important;">
								<li class="rv-user-li col-md-3 d-flex gap-3">
									<div class="rv-user-tit">
										<span style="float: left; color: #000; font-weight: 600;">${dto.nickName}</span>
										<span style="float: right;">${dto.regDate}</span>
									</div>
									<c:if test="${dto.option2Num == null && dto.option2Num2 == null}">
										<div class="rv-op-div d-flex gap-3">
											<span style="color: rgb(123, 132, 141);">구매옵션</span>
											<span style="color: rgb(23, 24, 26);">
												${dto.option2Name}<c:if test="${not empty dto.option2Name2}"> / ${dto.option2Name2}</c:if>
											</span>
										</div>
									</c:if>
								</li>
								<li class="rv-cont-li col-md-9 d-flex gap-3">
									<div style="color: #82ae46;">
										<c:choose>
											<c:when test="${dto.star==1}">
												★☆☆☆☆
											</c:when>
											<c:when test="${dto.star==2}">
												★★☆☆☆
											</c:when>
											<c:when test="${dto.star==3}">
												★★★☆☆
											</c:when>
											<c:when test="${dto.star==4}">
												★★★★☆
											</c:when>
											<c:when test="${dto.star==5}">
												★★★★★
											</c:when>
										</c:choose>
									</div>
									<ul class="d-flex gap-2" style="overflow: hidden;">
										<!-- 이미지 출력 foreach -->
										<c:if test="${not empty dto.saveName}">
											<c:forEach var="vo" items="${fn:split(dto.saveName, ',') }">
												<li style="width: 100px; height: 100px;">
													<a href="${pageContext.request.contextPath}/uploads/review/${vo}" class="image-popup" target="_blank">
														<img src="${pageContext.request.contextPath}/uploads/review/${vo}" class="img-fluid">
													</a>
												</li>
											</c:forEach>
										</c:if>
										<!-- //이미지 출력 foreach -->
									</ul>
									<div>
										${dto.rvContent}
									</div>
									<div class="rv-like-div">
										<a class="rv-thumb" data-num="${dto.rvNum}" data-like="1">
											<i class="bi bi-hand-thumbs-up"></i> 유용해요 <span>${dto.rvLikeCount}</span>
										</a>
										<a class="reply-btn" data-replyNum="${dto.rvNum}" style="cursor: pointer;">
											댓글 ${dto.replyId==null ? 0 : 1}
										</a>
									</div>
								</li>
							</ul>
							<!-- review/listReply 로 분리 -->
							<!-- 댓글 foreach -->
							<c:if test="${not empty dto.replyId}">
								<ul class='rv-reply-container hidden'>
									<li class="rv-reply-user col-md-3 d-flex gap-2 align-items-center">
										<span style="color: #333; font-weight: 600;">${dto.replyName}</span>
										<span>|</span>
										<span>${dto.replyDate}</span>
									</li>
									<li class="rv-reply-cont col-md-9">
										${dto.replyContent}
									</li>
								</ul>
							</c:if>
							<!-- //댓글 foreach -->
							<!-- // review/listReply.jsp 로 분리 -->
						</div>
					</c:forEach>
					<!-- //리뷰 foreach -->
					
					<!-- 페이징 -->
					<div class="row mt-5">
			          	<div class="col text-center">
			            	<div class="block-27 page-nav">
				              ${dataCount == 0 ? "등록된 리뷰가 없습니다." : paging}
			            	</div>
			          	</div>
			        </div>
          			<!-- //페이징 -->
				</div>
