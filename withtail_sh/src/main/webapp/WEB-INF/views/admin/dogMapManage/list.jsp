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
.btn {
color: #333;
border: 1px solid #999;
background-color: #fff;
padding: 3px;
border-radius: 4px;
font-weight: 500;
font-size: 12px;
cursor: pointer;
font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
vertical-align: baseline;
}

.imgbox {
     width: 90px;
     height: 90px;
     padding: 10px;
     border: 1px solid #999;
     margin: 10px auto;
}

.btn-light {
    padding: 5px;
    margin: 3px;
    background-color: #fff;
    border-radius: 4px;
}

.btn {
    color: #333;
    border: 1px solid #999;
    background-color: #fff;
    padding: 4px;
    border-radius: 30px;
    font-weight: 500;
    font-size: 12px;
    cursor: pointer;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    vertical-align: baseline;
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
		<h2><i class=" fa-solid fa-democrat"></i> 댕댕여지도 </h2>
    </div>

		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr style="border-bottom: 1px solid #ced4da; border-top: 1px solid #ced4da; color: #333;">
					<th class="wx-60">번호</th>
					<th class="wx-100">대표사진</th>
					<th class="wx-100">시설명</th>
					<th class="wx-80">변경</th>
				</tr>
			</thead>
		 
		 	<tbody>	
		 	    <c:forEach var="dto" items="${list}" varStatus="status">			
					<tr> 
						<td>${dto.placeNum}</td>
						<td><div class="imgbox" style="background:url(${pageContext.request.contextPath}/uploads/dogMap/${dto.mainImage}); background-size:cover;"></div></td>
						<td>${dto.placeName}</td>
						<td>
							<c:url var="updateUrl" value="/admin/dogMapManage/update">
								<c:param name="placeNum" value="${dto.placeNum}"/>
								<c:param name="page" value="${page}"/>
							</c:url>
							<button type="button" class="btn" onclick="location.href='${updateUrl}';">수정</button>
						</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
		 
		<div class="page-navigation">
		    ${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/dogMapManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/dogMapManage/list" method="post">
						<select name="col" class="form-select">
							<option value="placeName" ${col=="placeName"?"selected='selected'":""}>시설명</option>
							<option value="placeNum" ${col=="placeNum"?"selected='selected'":""}>시설번호</option>
						</select>
						<input type="text" name="kwd" value="${kwd}" class="form-control">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/dogmapManage/write';">글올리기</button>
				</td>
			</tr>
		</table>

	</div>
</div>