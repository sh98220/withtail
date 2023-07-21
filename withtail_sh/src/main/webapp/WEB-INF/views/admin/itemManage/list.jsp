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
    padding: 4px;
    border-radius: 30px;
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

</style>


<script>
function searchList() {
	const f = document.searchForm;
	f.submit();
}

function changeList() {
	let parentCt = $("#main").val();
	
	const f = document.searchForm;
	f.parentCt.value = parentCt;
	f.subCtNum.value = 0;
	f.lastCtNum.value = 0;
	searchList();
}

function changeSubList() {
	let parentCt = $("#main").val();
	let subCtNum = $("#sub").val();
	
	const f = document.searchForm;
	f.parentCt.value = parentCt;
	f.subCtNum.value = subCtNum;
	f.lastCtNum.value = 0;
	searchList();
}

function changeLastList() {
	let parentCt = $("#main").val();
	let subCtNum = $("#sub").val();
	let lastCtNum = $("#last").val();
	
	const f = document.searchForm;
	f.parentCt.value = parentCt;
	f.subCtNum.value = subCtNum;
	f.lastCtNum.value = lastCtNum;
	searchList();
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
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function() {
	 $(".chkAll").click(function() {
		   if($(this).is(":checked")) {
			   $("input[name=nums]").prop("checked", true);
	        } else {
			   $("input[name=nums]").prop("checked", false);
	        }
	   });
})

$(function() {
	$(".listDeleteBtn").click(function(){
            let cnt = $("input[name=nums]:checked").length;
			
            if(cnt == 0){
            	alert("선택된 글이 없습니다.");
            	return false;
            }
            if(confirm('선택한 정보를 삭제하시겠습니까?')) {
    			const f = document.itemForm;
    			f.action = "${pageContext.request.contextPath}/admin/itemManage/deleteListItem";
    			f.submit();
    		}
	});
});

$(function(){
	$("select[name=parentCt]").change(function(){
		let parentCt = $(this).val();
		
		$("select[name=ctNum]").find('option').remove().end()
			.append("<option value=''>:: 카테고리 선택 ::</option>");	
		
		if(! parentCt) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/admin/itemManage/listSubCategory";
		let query = "parentCt="+parentCt;
		
		const fn = function(data) {
			$.each(data.listSubCategory, function(index, item){
				let ctNum = item.ctNum;
				let ctName = item.ctName;
				let s = "<option value='"+ctNum+"'>"+ctName+"</option>";
				$("select[name=ctNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
	
	$("select[name=ctNum]").change(function(){
		let parentCt = $(this).val();
		
		$("select[name=ctNum2]").find('option').remove().end()
			.append("<option value=''>:: 카테고리 선택 ::</option>");	
		
		if(! parentCt) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/admin/itemManage/listLastCategory";
		let query = "parentCt="+parentCt;
		
		const fn = function(data) {
			$.each(data.listLastCategory, function(index, item){
				let ctNum = item.ctNum;
				let ctName = item.ctName;
				let s = "<option value='"+ctNum+"'>"+ctName+"</option>";
				$("select[name=ctNum2]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});
</script>


<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-basket-shopping"></i> 상품 관리 </h2>
    </div>
		<table class="table">
			<tr>
				<td align="left" width="50%">
					<select name="parentCt" id="main" class="form-select" onchange="changeList();">
					            <option value="0">:: 카테고리 ::</option>
								<c:forEach var="vo" items="${listCategory}">
									<option value="${vo.ctNum}" ${parentCt==vo.ctNum?"selected='selected'":""}>${vo.ctName}</option>
								</c:forEach>
					</select>
					
					<!-- 위에서 상위 카테고리에 따라 내용이 달라져야해요! 예시는 강아지를 선택했을 때 -->
					<select name="ctNum" id="sub" class="form-select" onchange="changeSubList();">
				          	 <option value="0">:: 카테고리 ::</option>
							<c:forEach var="vo" items="${listSubCategory}">
								<option value="${vo.ctNum}" ${subCtNum==vo.ctNum?"selected='selected'":""}>${vo.ctName}</option>
							</c:forEach>
					</select>
					
						<select name="ctNum2" id="last" class="form-select" onchange="changeLastList();">
						     <option value="0">:: 카테고리 ::</option>
							<c:forEach var="vo" items="${listLastCategory}">
								<option value="${vo.ctNum}" ${lastCtNum==vo.ctNum?"selected='selected'":""}>${vo.ctName}</option>
							</c:forEach>
						</select>	
				</td>
				<td align="right" width="30%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
			</tr>
		</table>
		
		<form name="itemForm" method="post">
		<table class="table table-border table-list">
			<thead>
				<tr style="border-bottom: 1px solid #ced4da; border-top: 1px solid #ced4da; color: #333;">
					<th class="wx-50" ><input type="checkbox" class="chkAll"></th>
					<th class="wx-70">상품 코드</th>
					<th class="wx-130">상품 사진</th>
					<th class="wx-150">상품명</th>
					<th class="wx-100">가격</th>
					<th class="wx-80">할인율</th>
					<!-- 옵션 상관없는 전체 재고 -->
					<th class="wx-80">재고</th>
					<th class="wx-80">진열</th>
					<th class="wx-100">수정일</th>
					<th class="wx-80">변경</th>
				</tr>
			</thead>
			
		 	<tbody>
		     	<c:forEach var="dto" items="${list}" varStatus="status">
					<tr> 
					<c:if test="${dto.orderNum != 0}">
						<td class="item-remove"><input type="checkbox" name="nums" value="${dto.itemNum}" disabled="disabled"></td>
					</c:if>	
					<c:if test="${dto.orderNum == 0}">
						<td class="item-remove"><input type="checkbox" name="nums" value="${dto.itemNum}"></td>
					</c:if>	
						<td>${dataCount - (page-1) * size - status.index}    ${dto.orderNum }</td>
                        <td><div class="imgbox" style="background:url(${pageContext.request.contextPath}/uploads/item/${dto.mainImage}); background-size:cover;"></div></td>
						<td class="left">
						    <!-- 제품 상세 페이지로 이동 -->
							<a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}">${dto.itemName }</a>
						</td>
						<td>${dto.itemPrice }</td>
						<td>${dto.orderNum } % </td>
						<td>${dto.totalStock }</td>
						<td>${dto.showNotice==0?"진열":"숨김"}</td>
						<td>${dto.upddate }</td>
						<td>
							<c:url var="updateUrl" value="/admin/itemManage/update">
								<c:param name="itemNum" value="${dto.itemNum}"/>
								<c:param name="parentCt" value="${parentCt}"/>
								<c:param name="subCtNum" value="${subCtNum}"/>
								<c:param name="lastCtNum" value="${lastCtNum}"/>
								<c:param name="page" value="${page}"/>
							</c:url>
							<c:url var="stockUrl" value="/admin/itemManage/stockList">
								<c:param name="itemNum" value="${dto.itemNum}"/>
								<c:param name="parentCt" value="${parentCt}"/>
								<c:param name="subCtNum" value="${subCtNum}"/>
								<c:param name="lastCtNum" value="${lastCtNum}"/>
								<c:param name="page" value="${page}"/>
							</c:url>
							<button type="button" class="btn" onclick="location.href='${stockUrl}';">재고</button> 
							<button type="button" class="btn" onclick="location.href='${updateUrl}';">수정</button>
						</td>
					</tr>
			     </c:forEach>
			</tbody>
		</table>
		<div style="text-align: right; margin: 3px 0;">
		        <input type="hidden" name="page" value="${page}">
		        <input type="hidden" name="parentCt" value="${parentCt}">
		        <input type="hidden" name="subCtNum" value="${subCtNum}">
		        <input type="hidden" name="lastCtNum" value="${lastCtNum}">
				<button type="button" style="margin: 3px 0;" class="btn btn-light listDeleteBtn" onclick="check();">삭제</button>
		</div>
		</form>
			
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/itemManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/itemManage/list" method="post">
						<select name="condition" class="form-select">
							<option value="all" ${col=="all"?"selected='selected'":""}>상품명+설명</option>
							<option value="itemNum" ${col=="itemNum"?"selected='selected'":""}>상품코드</option>
							<option value="itemName" ${col=="itemName"?"selected='selected'":""}>상품명</option>
							<option value="itemContent" ${col=="itemContent"?"selected='selected'":""}>설명</option>
						</select>
						
						<input type="text" name="kwd" value="${kwd}" class="form-control">
						<input type="hidden" name="size" value="${size}">
						<input type="hidden" name="parentCt" value="${parentCt}">
						<input type="hidden" name="subCtNum" value="${subCtNum}">
						<input type="hidden" name="lastCtNum" value="${lastCtNum}">
						<input type="hidden" name="page" value="${page}">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="150">
					<div class="col text-end" style="display: inline-block;">
					    <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/itemManage/write';">상품 등록</button>
				    </div>
				</td>
			</tr>
		 </table>
	</div>
</div>
