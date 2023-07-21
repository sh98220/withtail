<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
</style>


<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: #f4f4f4;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid gray;
	width: 400px;
	height: 250px;
	position: relative;
	left: 10px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
}

.modalbtn {
	margin: 30px auto;
}

.modalbtnbox {
	text-align: center;
}

.modalinput {
	padding: 3px;
}


.tabmenu{ 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:200px; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:200; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}

.tab-menu {
  border: 1px solid #ddd;
  border-radius: 4px;
}

.tab {
  display: flex;
}
</style>

<style>
#infomodal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#infomodal .modal-window {
	background: #f4f4f4;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid gray;
	width: 800px;
	height: 600px;
	position: relative;
	left: 10px;
	padding: 10px;
}

#infomodal .title {
	padding-left: 10px;
	display: inline;
}

#infomodal .title h2 {
	display: inline;
}

#infomodal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
}

#infomodal .content {
	margin-top: 20px;
	padding: 0px 10px;
}

.modalbtn {
	margin: 30px auto;
}

.modalbtnbox {
	text-align: center;
}

.modalinput {
	padding: 3px;
}
</style>

<script type="text/javascript">

<c:if test="${sessionScope.member.membership==99}">
	function deleteOk() {
		let query = "couponNum=${dto.couponNum}&${query}";
		let url = "${pageContext.request.contextPath}/admin/couponManage/delete?" + query;
	
		if(confirm("위 쿠폰을 삭제 하시 겠습니까 ? ")) {
			location.href = url;
		} 
	}
</c:if>

</script>

<script type="text/javascript">
$(function() {
	 $(".chkAll").click(function() {
		   if($(this).is(":checked")) {
			   $("input[name=nums]").prop("checked", true);
	        } else {
			   $("input[name=nums]").prop("checked", false);
	        }
	   });
})
/*
$(function() {
	$(".insertAll").click(function(){
            let cnt = $("input[name=nums]:checked").length;
            let userIds = "";
            
            $("input[name=nums]:checked").each(function(index, num) {
				userIds += $(num).val() + ",";
			});
			
            if(cnt == 0){
            	alert("지급 대상이 없습니다.");
            	return false;
            }
            
            if(confirm('선택한 멤버에게 쿠폰을 지급하시겠습니까?')) {
    			const f = document.giveCounponForm;
    			let url = "${pageContext.request.contextPath}/admin/itemManage/insertToMember";
    			query = "nums="+userIds+"couponNum=${couponNum}"
    			
    			alert(url)
    			alert(query)
    			
    			f.action = url+query;
    			
    			
    			f.submit();
    		}
	});
});
*/
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
	$(".insertAll").click(function(){
		let cnt = $("input[name=nums]:checked").length;
        let userIds = "";
        let couponNum = $("form[name=giveCounponForm] input[name=couponNum]").val();
        
        
        $("input[name=nums]:checked").each(function(index, num) {
			userIds += $(num).val() + ",";
		});
		
        if(cnt == 0){
        	alert("지급 대상이 없습니다.");
        	return false;
        }
        
		const query = "userIds="+userIds+"&couponNum="+couponNum;		
		const url = "${pageContext.request.contextPath}/admin/couponManage/insertToMember";
        
        if(confirm('선택한 멤버에게 쿠폰을 지급하시겠습니까?')) {
			
        	const fn = function(data){
    			if(data.state === "true") {
    				alert("쿠폰을 지급했습니다.");
    				infoOff();
    			}
    		};
    		
    		 ajaxFun(url, "post", query, "json", fn);
		}
        
	});
});
</script>


<div class="out">


	<div class="body-main">
	<div class="body-title">
		<h2>
			<i class="fa-solid fa-tags"></i> 쿠폰
		</h2>
	</div>

		<table class="table table-border table-article">
			<tbody>
				<tr>
					<td width="30%">쿠폰 이름 : ${dto.couponName }</td>
				</tr>
				<tr>
					<td width="50%" align="left">할인금액 : ${dto.couponPrice } ${dto.couponCategory == 0 ? '원' : '%' }</td>
				</tr>

				<tr>
					<td width="50%" align="left">최소 주문 금액 :${dto.couponMinPrice } 원</td>
				</tr>


				<tr>
					<td width="50%" align="left">시작일 : ${dto.startDate }</td>
				</tr>
				<tr>
					<td width="50%" align="left">종료일 : ${dto.endDate }</td>
				</tr>

			</tbody>
		</table>

		<table class="table">
			<tr>
				<td width="50%" align="left">
					<button type="button" class="btn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/admin/couponManage/update?couponNum=${dto.couponNum}&page=${page}';">수정</button>

					<button type="button" class="btn" onclick="deleteOk();">삭제</button>
				</td>

				<td align="right">
					<button type="button" class="btn" onclick="javascript:infoOn();">회원
						전달</button>
					<button type="button" class="btn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/admin/couponManage/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
	</div>



	<div id="infomodal" class="modal-overlay" style="margin-top: 20px;">
		<div class="modal-window" style="overflow-y: scroll;">
			<div class="title">
				<h2 style="padding: 10px;">쿠폰 전달 현황</h2>
			</div>
			<div class="close-area">X</div>
	  		<div style="clear:both;"></div>
	  		<div>
				<table class="table table-border table-list" style="margin-top: 10px;">
					<thead>
						<tr>
							<th class="wx-80">회원 코드</th>
							<th class="wx-100">회원 아이디</th>
							<th class="wx-80">보유</th>
							<th class="wx-80">사용여부</th>
						</tr>
					</thead>
	
					<tbody>
					    <c:forEach var="dto" items="${allMember}" varStatus="status">
						<tr>
							<td>${dto.memberNum}</td>
							<td>${dto.userId }</td>
							<td>${dto.couponNum == null || dto.couponNum == 0 ? "미보유" : "보유" }</td>
							<td>${dto.used == null ? "--" : dto.used == 0 ? "미사용" : "사용" }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="width: 100%">
					<div style="text-align: center;" class="page-navigation">
						${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
					</div>
				</div>				
			</div>
			
	        <div style="margin-top: 50px;">
	        <div class="title">
				<h2 style="padding: 10px;">쿠폰 지급</h2>
			</div>
			<form name="giveCounponForm" action="">
					<table class="table table-border table-list" style="margin-top: 10px;">
						<thead>
							<tr>
							    <th class="wx-50"><input type="checkbox" class="chkAll"></th>
								<th class="wx-80">회원 코드</th>
								<th class="wx-100">회원 아이디</th>
							</tr>
						</thead>
		
						<tbody>
						    <c:forEach var="dto" items="${noCouponMember}" varStatus="status">
							<tr>
							    <td class="item-remove"><input type="checkbox" name="nums" value="${dto.userId}"></td>
								<td>${dto.memberNum}</td>
								<td>${dto.userId }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="width: 100%; text-align: right; margin: 15px;" >
					   <input type="hidden" name="couponNum" value="${dto.couponNum}">
					   <button type="button" class="btn insertAll" style="margin-right: 30px;">지급하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script>
const infomodal = document.getElementById("infomodal")
        
function infoOn() {
	infomodal.style.display = "flex"
}
        
function infoOff() {
	infomodal.style.display = "none"
}
        
const infocloseBtn = infomodal.querySelector(".close-area")
infocloseBtn.addEventListener("click", e => {
	infoOff();
});

</script>
