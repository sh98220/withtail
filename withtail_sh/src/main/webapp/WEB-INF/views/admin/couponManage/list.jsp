<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}

</style>
<style>
.submenu-layout {
	box-sizing: content-box;
	background-color: #f8f8f8;
	border-radius: 75px;
	display: flex;
	align-items: center;
	width: 29%;
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

.my-coupon-container {
    padding: 30px 0 20px 0;
    align-items: flex-start;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
}

.coupon-wrap {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    padding-bottom: 30px;
}

.coupon-layout {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: row;
    gap: 10px;
    background-color: rgb(248 248 248);
    border: 1px none;
    border-radius: 5px;
    flex-wrap: wrap;
    padding: 20px;
}

.title {
    color: black;
    font-size: 24px;
    font-weight: 700;
    text-align: center;
    width: fit-content;
}
 
.coupon {
	align-items: flex-start;
	background-color: rgb(255, 255, 255);
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 5px;
	padding: 16px;
	flex-basis: calc(33% - 4px);
	min-height: 138px;
	justify-content: space-between;
}

.coupon:checked {
	align-items: flex-start;
	background-color: #f5fbff;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 5px;
	padding: 16px;
	flex-basis: calc(50% - 5px);
	min-height: 138px;
	justify-content: space-between;
}

.coupon-upper {
	align-self: stretch;
	border: 1px none;
	display: flex;
}

.coupon-text-layout {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
}

.coupon-title {
	flex: 1;
	margin-top: -1px;
	white-space: nowrap;
	font-size: 14px;
	font-weight: 500;
	color: black;
}

.coupon-text {
	font-size: 24px;
	font-weight: 700;
	color: black;
}

.coupon-lower {
	align-items: flex-end;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 5px;
}
</style>



<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

</script> 

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-tags"></i> 쿠폰 </h2>
    </div>
	<div class="coupon-wrap">
		 <div style="text-align: right; width: 100%; margin: 5px; padding: 3px;">
		    ${dataCount}개(${page}/${total_page} 페이지)
		 </div>
		 
		<div class="coupon-layout">
		 <c:forEach var="dto" items="${list}" varStatus="status">
			<div class="coupon" style="cursor: pointer;" onclick="location.href='${articleUrl}&couponNum=${dto.couponNum}'">
				<div class="coupon-upper">
					<div class="coupon-text-layout">
						<div class="coupon-title valign-text-middle">
							${dto.couponName }
						</div>
						<div class="coupon-text valign-text-middle">${dto.couponPrice }
						<c:if test="${dto.couponCategory == 0 }">
						    <span> 원</span>
						</c:if>
						<c:if test="${dto.couponCategory == 1 }">
						    <span> %</span>
						</c:if>
						</div>
					</div>
				</div>
				<div class="coupon-lower">
					<div class="restriction">
						<p class="restriction-text valign-text-middle">
							<span>- 사용기간 : ~</span> <span> ${dto.endDate }</span> <span>까지</span>
						</p>
						<p class="restriction-text valign-text-middle">
							<span>- 최소주문금액</span> <span> ${dto.couponMinPrice} </span><span>원</span>
						</p>
					</div>
				</div>
			</div>
	     </c:forEach>
	</div>
	<div style="width: 100%">
		<div style="text-align: center;" class="page-navigation">
			${dataCount == 0 ? "등록된 쿠폰이 없습니다." : paging}
		</div>
	</div>
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/couponManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/couponManage/list" method="post">
						<select name="condition" class="form-select">
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="startDate" ${condition=="startDate"?"selected='selected'":""}>시작일</option>
							<option value="endDate" ${condition=="endDate"?"selected='selected'":""}>종료일</option>
							<option value="discount" ${condition=="discount"?"selected='selected'":""}>할인가/할인율</option>
							<option value="price" ${condition=="price"?"selected='selected'":""}>가격</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="form-control">
						<input type="hidden" name="page" value="${page}" class="form-control">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/couponManage/write';">등록하기</button>
				</td>
			</tr>
		</table>
	</div>
	</div>
</div>
