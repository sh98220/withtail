<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.body-main {
	max-width: 900px;
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

.stuck_input {
    width: 50px;
    text-align: center;
    border-radius: 50px;
    padding: 15px;
    margin: 10px auto;
}

.updatebtn {
    margin: 30px;
    width:30px;
    height: 30px;
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
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function() {
	$(".stockUpdateBtn").click(function(){
		const $tr = $(this).closest("tr");
		
		let stockNum = $(this).attr("data-stockNum");
		let totalStock = $tr.find("input[name=totalStock]").val();
		
		const query = "stockNum="+stockNum+"&totalStock="+totalStock;
		const url = "${pageContext.request.contextPath}/admin/itemManage/updateStock";
		
		const fn = function(data){
			if(data.state === "true") {
				alert("재고 수량을 변경했습니다.");
			}
		};
		
		 ajaxFun(url, "post", query, "json", fn);
		
	});
});


$(function(){
	$(".btnMinus").click(function(){
		const $tr = $(this).closest("tr");
		let totalStock = Number($tr.find("input[name=totalStock]").val())
		
		if(totalStock <= 0) {
			return false;
		}
		
		totalStock--;
		$tr.find("input[name=totalStock]").val(totalStock);
	});

	$(".btnPlus").click(function(){
		const $tr = $(this).closest("tr");
		let totalStock = Number($tr.find("input[name=totalStock]").val()) || 1;
		
		if(totalStock >= 99) {
			return false;
		}
		
		totalStock++;
		$tr.find("input[name=totalStock]").val(totalStock);
	});
});

</script>

<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-solid fa-basket-shopping"></i> 상품 재고 관리 </h2>
    </div>
    
    <div class="body-main">
		<table class="table">
			<tr>
				<td align="right" width="30%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr>
					<th class="wx-100">상품 코드</th>
					<th class="wx-130">상품 사진</th>
					<th class="wx-150">상품명</th>
					<th class="wx-100">상위 옵션</th>
					<th class="wx-100">하위 옵션</th>
					<th class="wx-80">재고</th>
					<th class="wx-100">확인</th>
				</tr>
			</thead>
			
		 	<tbody>
		 	  <c:forEach var="dto" items="${stockList}" varStatus="status">
					<tr> 
						<td>${dataCount - (page-1) * size - status.index}</td>
                        <td><div class="imgbox" style="background:url(${pageContext.request.contextPath}/uploads/item/${dto.mainImage}); background-size:cover;"></div></td>
						<td class="left">
						    ${dto.itemName}
						</td>
						<td>${dto.option2Name}</td>
						<td>${dto.option2Name2}</td>
						<td>
						    <div style="display: flex; justify-content: space-between; align-items: center">
                          
                            <span>
                              <button type="button" data-type="plus" class="updatebtn btnPlus">
                               <i class="fa-sharp fa-solid fa-plus"></i>
                              </button>
                            </span>
                            
                            <span>
                              <input type="text" name="totalStock" class="form-control stuck_input" value="${dto.totalStock}" min="1" max="100">
                            </span>
                            
                            <span>
                              <button type="button" data-type="minus" class="updatebtn btnMinus">
                                <i class="fa-solid fa-minus"></i>
                              </button>
                            </span>
                            
                          </div>
						</td>
						<td>
							<button type="button" class="btn stockUpdateBtn" data-stockNum="${dto.stockNum}">변경</button> 
						</td>
					</tr>
			     </c:forEach>
		  	</tbody>
		</table>
		 
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 옵션이 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/itemManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
			</tr>
		</table>
	</div>
</div>
