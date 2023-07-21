<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
 
<style>
.table {
   font-size: 14px !important;  
}

.table tbody tr td {
    text-align: center !important;
    vertical-align: middle;
    padding: 10px 10px !important;
    border: 1px solid transparent !important;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
}

@media (min-width: 1200px) {
   .container {
       max-width: 1365px !important;
   }
}

.ftco-cart span {
   margin-bottom: 3px;      
   font-size: 13px;                  
}

.ftco-cart .form-control {
    height: 40px !important;
    text-align: center;
    bordeR: 1px solid rgba(0, 0, 0, 0.05) !important;
    color: #000000 !important;
    padding: 0;
    font-size: 13px;
    width: 120px !important;
}

.table .thead-primary tr th {
    color: #808080 !important;
}

.-price {
    width: 200px;
    font-size: 21px;
    padding: 10px 15px 9px 15px;
    color: #888;
    border-bottom: 1px solid #444;
}

.-head {
    width: 130px;
    text-align: left;
    color: #999;
}

.-ul {
   text-align: right; 
   list-style-type: none;
   margin-bottom: 0px;
}

.-btn1 {
   border: 1px solid #008e61 !important;
   background: #fff;
   color: #008e61 !important;
   text-shadow: none;
    font-size: 13px;
   padding: 0px 7px;
    height: 21px !important;

}

.help {
    margin: 40px 0 0;
    line-height: 18px;
}

.help > h3 {
    font-size: 11px !important;
    font-weight: normal;
    border-top: 1px solid #eaeaea;
    border-bottom: 1px solid #eaeaea;
    background: none !important;
    padding: 15px 20px 13px 21px !important;
}

.help .content {
    padding: 0 9px 12px;
}

.help .content ul {
    margin: 15px 0 0 -27px;
}

.help .content li.item1 {
    background-position: -484px 0;
}

.help > .content > ul > li {
    font-size: 13px;
    color: #888;
   	margin : 5px 18px;
   	line-height: 140%;
}

.help .content li {
    padding: 0 0 0 25px;
    color: #757575;
    background: url(http://img.echosting.cafe24.com/skin/base_ko_KR/common/ico_number.png) no-repeat;
}

.help .content li.item2 {
    background-position: -434px -100px;
}

.help .content li.item3 {
    background-position: -384px -200px;
}

#-footer {
    padding: 50px 0 0 0;
    margin: 20px 0 0 0;
    position: relative;
}

#-footer .-size, #-footerbackup .-size, #-copyright > .-size {
    width: 1230px;
    margin-left: 0px; 
    position: relative;
}

.-footerbox {
    border-top: none;
    padding: 0 0 0px 0;
}

.-footerbox .-footerus {
   width: 100%;
    margin: 0 0 40px 0;
    font-size: 0;
    border-bottom: 1px solid #f0f0f0;
}

.-footerbox .-footerus a:first-child {
    padding-left: 0;
}

.-footerbox .-footerus a {
    font-size: 13px;
    color: #333;
}

.-footerbox .-footerus a, .-footerbox table th, .-new .-footer-help-runtime, .-footer-bank p {
    letter-spacing: 0;
}

.-footerbox .-footerus a {
    display: inline-block;
    font-size: 11px;
    line-height: 50px;
    position: relative;
    letter-spacing: 0.1em;
}

.-footerbox table th {
    color: #333;
    font-size: 9px;
    font-weight: bold;
    letter-spacing: 0.15em;
    padding: 7px 0 15px 0;
    text-align: left;
}

.-footerbox table td a {
    color: #666;
    font-size: 11px;
    padding: 3px 0;
    letter-spacing: 0.1em;
    display: block;
    text-transform: uppercase;
}

.-footerbox table td {
    vertical-align: top;
}

.ftco-section {
    padding: 1em 0 !important;
    position: relative;
}


</style>

<script type="text/javascript">
$(function(){
	
	let cartSize = "${list.size()}";

	if(cartSize!=="" && cartSize!=="0") {
		$("#chkAll").prop("checked", true);
		$("input[name=nums]").prop("checked", true);

	}

    $("#chkAll").click(function () {
    	$("input[name=nums]").prop("checked", $(this).is(":checked"));

    });
});

function refer() {
	let referrer = document.referrer;
	location.href = referrer;
}

function SelectSendOk() {
	let cartSize = "${list.size()}";
	
	if (cartSize=="0"){
		alert('장바구니가 비었습니다.');
		return;
	}
	
	
	if('${nullCheck.cartNum}' != '0') {
		alert('품절 상품을 먼저 삭제해주세요.');
		return;
	}

	
	//  선택 구매하기
	const f = document.cartForm;

	
	
	let cnt = $("input[name=nums]:checked").length;
	
    if (cnt === 0) {
		alert("구매할 상품을 먼저 선택 하세요 !!!");
		return;
    }
    
    $("input[name=nums]").each(function(index, item){
		if(! $(this).is(":checked")) {
			$(this).closest("tr").remove();
		}
	});
	
    //f.method = "post";
	f.action = "${pageContext.request.contextPath}/order/payment";
	f.submit();
}

function sendOk() {
	let cartSize = "${list.size()}";
	
	if (cartSize=="0"){
		alert('장바구니가 비었습니다.');
		return;
	}
	
	
	if('${nullCheck.cartNum}' != '0' ) {
		alert('품절 상품을 먼저 삭제해주세요.');
		return;
	}

	// 전부 구매하기
	const f = document.cartForm;
	
	/*
	let itemNums = "";
	let subNums = "";
	let subNums2 = "";
	let qtys = "";
    
    $("input[name=itemNums]").each(function(index, num) {
    	itemNums += $(num).val() + ",";
 	});
    itemNums = itemNums.substr(0,itemNums.lastIndexOf(","));
    
    $("input[name=subNums]").each(function(index, num) {
    	subNums += $(num).val() + ",";
 	});
    subNums = subNums.substr(0,subNums.lastIndexOf(","));
	
    $("input[name=subNums2]").each(function(index, num) {
    	subNums2 += $(num).val() + ",";
 	});
    subNums2 = subNums2.substr(0,subNums2.lastIndexOf(","));
    
    $("input[name=qtys]").each(function(index, num) {
    	qtys += $(num).val() + ",";
 	});
    qtys = qtys.substr(0,qtys.lastIndexOf(","));
    */
	
	//location.href = "${pageContext.request.contextPath}/order/payment?itemNums="+itemNums+"&subNums="+subNums+"&subNums2="+subNums2+"&qtys="+qtys;
	//f.method = "post";
	f.action = "${pageContext.request.contextPath}/order/payment";
	f.submit();
}

function deleteCartAll() {
	// 장바구니 비우기
	if(! confirm('장바구니를 비우시겠습니까 ? ')) {
		return;
	}

	location.href = '${pageContext.request.contextPath}/cart/deleteCartAll';	
}

function deleteCartSelect() {
	// 선택된 항목 삭제
	let cnt = $("input[name=nums]:checked").length;
    if (cnt === 0) {
		alert("삭제할 상품을 먼저 선택 하세요 !!!");
		return;
    }
    
	if(! confirm('선택한 상품을 장바구니에서 비우시겠습니까 ? ')) {
		return;
	}
	
	const f = document.cartForm;
	f.action = "${pageContext.request.contextPath}/cart/deleteListCart";
	f.submit();
}

</script>


<div class="hero-wrap hero-bread" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/main_ban01.jpg');">
      
    </div>
    <section class="ftco-section ftco-cart">
    	<form name="cartForm" method="post">
         <div class="container">
            <p style="margin-left: 4px; margin-bottom: -14px;">일반상품이 <span style="font-size: 17px; text-decoration: underline; font-weight: 500">${fn:length(list)}&nbsp;</span>개 있습니다. 구매시 참고해주세요.<p>
            <div class="row">
             <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                   <table class="table" >
                      <thead class="thead-primary" style="background: #fbfafa;">
                        <tr class="text-center">
                          <th><input type="checkbox" name="chkAll" id="chkAll"></th>
                          <th>이미지</th>
                          <th>상품정보</th>
                          <th>판매가</th>
                          <th>수량</th>
                          <th>적립금</th>
                          <th>배송비</th>
                          <th>합계</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      <!-- c:foreach로 반복문으로 짜서 할 것. -->
					<c:set var="all" value="0"/>
                      <c:forEach var="dto" items="${list}" varStatus="status">
                      
                        	<tr class="text-center">
	                          <td class="product-remove"><input type="checkbox" name="nums" value="${dto.cartNum}"></td>
	                          
	                          <td class="image-prod">
	                          	  <div onclick="location.href ='${pageContext.request.contextPath}/shop/info/${dto.itemNum}';">
			                          <div class="img" style="background-image:url(${pageContext.request.contextPath}/uploads/item/${dto.mainImage});">
			                          </div>
		                          </div>
	                          </td>
	                          
	                          <td class="product-name">
	                          	<c:choose>
	                             <c:when test="${dto.totalStock != 0}">
	                             <div onclick="location.href ='${pageContext.request.contextPath}/shop/info/${dto.itemNum}';" style="cursor:pointer;"> 
		                             <h3>${dto.itemName}</h3>                        
		                             <p>${dto.option2Name}&nbsp;&nbsp;${dto.option2Name2}</p>
		                          </div>
	                             </c:when>
	                             <c:otherwise>
	                             <div onclick="location.href ='${pageContext.request.contextPath}/shop/info/${dto.itemNum}';" style="cursor:pointer;"> 
	                             	<h3>품절된 상품입니다.</h3>
		                            <h3 style="color:#808080; text-decoration:line-through;">${dto.itemName}</h3>
		                            <c:if test="${not empty dto.option2Name}">                     
		                            	<p style="color:#808080; text-decoration:line-through;">${dto.option2Name}&nbsp;&nbsp;${dto.option2Name2}</p>
		                         	</c:if>
		                         </div>
	                             </c:otherwise>
								</c:choose>
	                          </td>
	                          
	                          	                          
	                          <c:choose>
	                          <c:when test="${dto.totalStock == 0 }">
	                          <td>품절</td>
	                          <td>-</td>
	                          <td>-</td>
	                          <td>-</td>
	                          <td>-
	                          
	                          	 <input type="hidden" value="${dto.itemNum}" name="itemNums">
	                          	 <c:if test="${not empty dto.option2Num}">
	                          	 	<input type="hidden" name="subNums" value="${dto.option2Num}">
	                          	 </c:if>
		                         <c:if test="${not empty dto.option2Num2}">
		                         	<input type="hidden" name="subNums2" value="${dto.option2Num2}">
		                         </c:if>
	                             <input type="hidden" value="0" name="itemPoint-${status.index}" id="itemPointN-${status.index}">
	                          	 <input type="hidden" value="0" name="totalStock-${status.index}" id="totalStockN-${status.index}">
		                         <input type="hidden" value="0" name="disPrice-${status.index}" id="disPriceN-${status.index}">
		                         <input type="hidden" value="0" name="price1-${status.index}" id="price1N-${status.index}">
		                         <input type="hidden" name="totalPrice-${status.index}" value="0" id="totalPriceN-${status.index}">
		                         <span id="totalPrice-${status.index}" style="display:none">0</span>
	                          </td>

	                          </c:when>
	                          <c:otherwise>
	                          
	                          
	                          <td class="price">
		                          <c:if test="${empty dto.discount}"> 
		                          <span style="color:#808080; text-decoration:line-through;" id="price0-${status.index}">${dto.itemPrice}</span>
		                          </c:if>
	                   
	                         <div><span class="price-sale" id="price2-${status.index}">${dto.finalPrice}</span></div>

	                          </td>
	                          

		                         <td class="quantity">
		                          <div style="display: flex; justify-content: space-between;">
		                            <span>
		                              <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="" id="minus-${status.index}">
		                                <i class="ion-ios-remove"></i>
		                              </button>
		                            </span>
		                            <span style="margin: 0 10px;"> <!-- 간격을 띄우기 위해 마진을 추가 -->
		                              <input type="text" id="quantity-${status.index}" name="qtys" class="form-control input-number" value="${dto.quantity}" 
		                               min="1" max="100" readonly="readonly">
		                            </span>
		                            <span>
		                              <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="" id="plus-${status.index}">
		                                <i class="ion-ios-add"></i>
		                              </button>
		                            </span>
		                          </div>
		                        </td>
		                     
		                          <td class="total"><span id="itemPoint-${status.index}">${dto.itemPoint * dto.quantity}</span></td>
		                          <td class="total">${dto.deliveryFee}</td>
		                          <td class="total"><span id="totalPrice-${status.index}">${dto.finalPrice * dto.quantity}</span>
		                          
		                          <!-- hidden 처리 -->
		                         <input type="hidden" value="${dto.itemNum}" name="itemNums">
		                         <c:if test="${not empty dto.option2Num}">
	                          	 	<input type="hidden" name="subNums" value="${dto.option2Num}">
	                          	 </c:if>
		                         <c:if test="${not empty dto.option2Num2}">
		                         	<input type="hidden" name="subNums2" value="${dto.option2Num2}">
		                         </c:if>
		                         
		                         <input type="hidden" value="${dto.itemPoint * dto.quantity}" name="itemPoint" id="itemPointN-${status.index}">
		                         <input type="hidden" value="${dto.totalStock}" name="totalStock" id="totalStockN-${status.index}">
		                         <input type="hidden" value="${dto.disPrice}" name="disPrice" id="disPriceN-${status.index}">
		                         <input type="hidden" value="${dto.itemPrice}" name="price1" id="price1N-${status.index}">
		                         <input type="hidden" name="totalPrice" value="${dto.finalPrice * dto.quantity}" id="totalPriceN-${status.index}">
		                          </td>
		                    <c:set var="all" value="${all + (dto.itemPrice * dto.quantity)}"/>
	                        <c:set var="poi" value="${poi + (dto.itemPoint * dto.quantity)}"/>
	                        <c:set var="dis" value="${dis + (dto.disPrice * dto.quantity)}"/>
	                        <c:set var="fin" value="${fin + (dto.finalPrice * dto.quantity)}"/>  
	                        	</c:otherwise>
	                          </c:choose> 
	                        </tr>


						</c:forEach>

                        <tr>
                          <td colspan="10" style="padding-bottom: 20px !important; padding-top: 20px !important; background: #fbfafa;">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                              <span style="float: left; margin-right: auto;"></span>
                              <div style="float: right;">
                                <input type="hidden" name="allPoint" value="${poi == null ? 0 : poi}">    
								<input type="hidden" name="allPrice" value="${all == null ? 0 : all}">
								<input type="hidden" name="deliveryFee" value="0">
                                <input type="hidden" name="allDisPrice" value="${dis == null ? 0 : dis}">
                                <input type="hidden" name="finalPrice" value="${all == null ? 0 : all}">
                                <input type="hidden" name="mode" value="buy">
                              </div>
                            </div>
                          </td>
                        </tr>
  
                      </tbody>
                    </table>
                 </div>
             </div>
          </div>
          <div style="margin-bottom: 35px;">
             <p style="display: inline-block;">
                <span>선택상품을&nbsp;</span>
                <button type="button" style="border: 1px solid #008e61 !important;
                background: #fff;
                  color: #008e61 !important;
                  text-shadow: none;
                   font-size: 13px;
                   padding: 0px 7px;
                   height: 21px !important;" onclick="deleteCartSelect()">삭제</button>
               </p> 
               <p style="display: inline-block; float: right;"> 
                   <button type="button" style="border: 1px solid #008e61 !important;
                background: #fff;
                  color: #008e61 !important;
                  text-shadow: none;
                   font-size: 13px;
                   padding: 0px 7px;
                   height: 21px !important;" onclick="deleteCartAll()">장바구니비우기</button>
                </p>
             </div>
             <c:choose>
			<c:when test="${list.size() != 0}">
             <div style="padding: 20px 0 30px 30px; border-top: double #666; border-bottom: double #eaeaea;">
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">총 상품금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">
                   <a id="allPrice"></a> 원
                   
                   </li>
                </ul>
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">총 배송비</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">+ <a id="deliveryFee"></a> 원</li>
                </ul>
                <ul class="-ul">

                   <li class="-head" style="display: inline-block; ">총 할인금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">- <a id="allDisPrice"></a> 원</li>
                </ul>
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">결제 예정금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; color: #008e61;">= <a id="finalPrice"></a> 원</li>
                </ul>            
             </div>
               </c:when>
             <c:otherwise>
                 <div style="padding: 20px 0 30px 30px; border-top: double #666; border-bottom: double #eaeaea;">
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">총 상품금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">
                   0 원

                   </li>
                </ul>
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">총 배송비</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">+ 0 원</li>
                </ul>
                <ul class="-ul">

                   <li class="-head" style="display: inline-block; ">총 할인금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; ">- 0 원</li>
                </ul>
                <ul class="-ul">
                   <li class="-head" style="display: inline-block; ">결제 예정금액</li>
                   <li class="-price" style="display: inline-block; font-weight: 1000; color: #008e61;">= 0 원</li>
                </ul>            
             </div>
             
             </c:otherwise>

             </c:choose>
             <div style="margin-top: 30px;">
                <p style="display: inline-block;">
                <a href="${pageContext.request.contextPath}"><button type="button" class="-btn1" style="padding: 0 18px; height: 41px !important;">쇼핑계속하기</button></a>
               </p> 
               <p style="display: inline-block; float: right;"> 
                   <button type="button" class="-btn1" onclick="SelectSendOk()" style="padding: 0 18px; height: 41px !important; ">선택 상품만 주문</button>
                   <button type="button" class="-btn1" onclick="sendOk()" style="padding: 0 18px; height: 41px !important; ">전체상품 주문</button>
                </p>
             </div>
             
             <div class="help">
                <h3>&gt; 위드테일 배송 이용안내<span style="font-size: 10px; color: #d6d6d6">&nbsp;&nbsp;&nbsp;- 이 항목은 읽어두시면,많은 도움이 됩니다.</span></h3>
                <div class="content">
                   <ul style="list-style: none;">
                      <li class="item1">브랜드별 배송 제품은 각 브랜드에서 직접 발송됩니다. 교환 반품시에는 브랜드별로 배송비가 부과됩니다.</li>   
                      <li class="item2">할인 쿠폰은 다음 주문 단계에서 적용 가능합니다.</li>
                      <li class="item3">위드테일에서 구매하신 제품의 문의는 사이트 우측 하단의 채팅상담 아이콘을 통해 접수하시면 더욱 빠릅니다.</li>                 
                   </ul>           
                </div>
                <h3>> 주문과 결제 안내<span style="font-size: 10px; color: #d6d6d6">&nbsp;&nbsp;&nbsp;- 이 항목은 읽어두시면,많은 도움이 됩니다.</span></h3>
             <div class="content">
                   <ul style="list-style: none;">
                      <li class="item1">상품 주문 후 상품준비중 단계에서만 고객 취소가 가능하며, 배송준비중 단계에서는 고객센터를 통해서만 가능합니다.</li>   
                      <li class="item2">배송중 단계에서는 반품 배송비 등이 부과될 수 있으며, 고객센터 운영시간 안에 접수해 주셔야 가능합니다.</li>                
                   </ul>           
                </div>   
         </div>
      </div>
	</form>
      </section>

	<script>
	
      $(document).ready(function(){

    	  document.getElementById('allPrice').innerHTML = parseInt('<c:out value="${all}"/>').toLocaleString();
    	  document.getElementById('allDisPrice').innerHTML = parseInt('<c:out value="${dis}"/>').toLocaleString();
    	  document.getElementById('finalPrice').innerHTML = parseInt('<c:out value="${fin}"/>').toLocaleString();
	   	 <c:forEach items="${list}" varStatus="status" var="dto">
	   	 	
	  	<c:if test="${dto.totalStock != 0}">	
	   	 //10만원 이상시 배달비 무료
			if(parseInt('<c:out value="${all}"/>') >= 100000){
				document.getElementById('deliveryFee').innerHTML = 0;
				document.getElementsByName('deliveryFee')[0].value = 0;
				document.getElementsByName('finalPrice')[0].value = parseInt('<c:out value="${fin}"/>');
				document.getElementById('finalPrice').innerHTML = parseInt('<c:out value="${fin}"/>').toLocaleString();
			} else {
				document.getElementById('deliveryFee').innerHTML = parseInt('${deliveryFeeMax.deliveryFeeMax}').toLocaleString();
				document.getElementsByName('deliveryFee')[0].value = '${deliveryFeeMax.deliveryFeeMax}';
				document.getElementsByName('finalPrice')[0].value = parseInt('<c:out value="${fin}"/>') + parseInt('${deliveryFeeMax.deliveryFeeMax}');
				document.getElementById('finalPrice').innerHTML = (parseInt('<c:out value="${fin}"/>') + parseInt('${deliveryFeeMax.deliveryFeeMax}')).toLocaleString(); 
			} 
			
			  var size = '${fn:length(list)}';
		   	  var totalPrice = document.getElementById('totalPrice-${status.index}').innerHTML; //할인 적용 총 합계
		      var quantity=0; //각 상품 개수



	         $('#plus-${status.index}').click(function(e){


	              
	              let quantity = parseInt($('#quantity-${status.index}').val());
				

	               $('#quantity-${status.index}').val(quantity + 1);
	               quantity = quantity + 1;

	               
					if(quantity > 100){
			              //alert('한 번에 100개까지 구매 가능합니다.');
			              $('#quantity-${status.index}').val(quantity - 1);	
			              return;
					}
	               
	               /*
					if(${dto.totalStock} < quantity){
		              alert('재고의 최대 수량입니다.');
		              $('#quantity-${status.index}').val(quantity - 1);	
		              return;
					}*/

	               
		              document.getElementById('price1N-${status.index}').value = '${dto.itemPrice}' * quantity;
		              document.getElementById('disPriceN-${status.index}').value = '${dto.disPrice}' * quantity;
		              document.getElementById('itemPoint-${status.index}').innerHTML = '${dto.itemPoint}' * quantity;
		              document.getElementById('itemPointN-${status.index}').value  = '${dto.itemPoint}' * quantity;
	                  document.getElementById('totalPrice-${status.index}').innerHTML = '${dto.finalPrice}' * quantity;
	                  document.getElementById('totalPriceN-${status.index}').value = '${dto.finalPrice}' * quantity;
			
					let allPrice = 0; //정가 총합
					let allDisPrice = 0; //할인금액 총합
					let allPoint = 0; //총 적립포인트
					let allTotalPrice = 0; //정가에서 할인적용 총합
		               for(let i = 0; i < size; i ++){
		            	   allPrice = allPrice + parseInt(document.getElementById('price1N-' + i).value);
		            	   allDisPrice = allDisPrice + parseInt(document.getElementById('disPriceN-' + i).value);
		            	   allPoint =  allPoint + parseInt(document.getElementById('itemPointN-' + i).value);
		            	   allTotalPrice = allTotalPrice + parseInt(document.getElementById('totalPriceN-' + i).value);
		               }
					

		               document.getElementsByName('allPoint')[0].value = allPoint;
		               document.getElementById('allPrice').innerHTML = allPrice.toLocaleString();
		               document.getElementsByName('allPrice')[0].value = allPrice;
		               document.getElementById('allDisPrice').innerHTML = allDisPrice.toLocaleString();
		               document.getElementsByName('allDisPrice')[0].value = allDisPrice;
		               
		               
		               if(allTotalPrice >= 100000){
		            	   document.getElementsByName('deliveryFee')[0].value = 0;
		            	   document.getElementById('deliveryFee').innerHTML = 0;
		               } else {
		            	   document.getElementById('deliveryFee').innerHTML =parseInt('${deliveryFeeMax.deliveryFeeMax}').toLocaleString();
		            	   document.getElementsByName('deliveryFee')[0].value = '${deliveryFeeMax.deliveryFeeMax}';
		            	   allTotalPrice += parseInt('${deliveryFeeMax.deliveryFeeMax}');
		               }
		               
		               
		               document.getElementsByName('finalPrice')[0].value = allTotalPrice;
		               document.getElementById('finalPrice').innerHTML = allTotalPrice.toLocaleString();

	          });
	
	           $('#minus-${status.index}').click(function(e){
	              // Stop acting like a button
	              e.preventDefault();
	              // Get the field name
	              let quantity = parseInt($('#quantity-${status.index}').val());
	              
	              // If is not undefined
	            
	                  // Increment
	                  if(quantity>1) {
	                  $('#quantity-${status.index}').val(quantity - 1);
	            
	                  quantity = quantity - 1;
		               
		              document.getElementById('price1N-${status.index}').value = '${dto.itemPrice}' * quantity;
		              document.getElementById('disPriceN-${status.index}').value = '${dto.disPrice}' * quantity;
		              document.getElementById('itemPoint-${status.index}').innerHTML = '${dto.itemPoint}' * quantity;
		              document.getElementById('itemPointN-${status.index}').value  = '${dto.itemPoint}' * quantity;
	                  document.getElementById('totalPrice-${status.index}').innerHTML = '${dto.finalPrice}' * quantity;
	                  document.getElementById('totalPriceN-${status.index}').value = '${dto.finalPrice}' * quantity;
			
					let allPrice = 0; //정가 총합
					let allDisPrice = 0; //할인금액 총합
					let allPoint = 0; //총 적립포인트
					let allTotalPrice = 0; //정가에서 할인적용 총합
		               for(let i = 0; i < size; i ++){
		            	   allPrice = allPrice + parseInt(document.getElementById('price1N-' + i).value);
		            	   allDisPrice = allDisPrice + parseInt(document.getElementById('disPriceN-' + i).value);
		            	   allPoint =  allPoint + parseInt(document.getElementById('itemPointN-' + i).value);
		            	   allTotalPrice = allTotalPrice + parseInt(document.getElementById('totalPriceN-' + i).value);
		               }

		               document.getElementsByName('allPoint')[0].value = allPoint;
		               document.getElementById('allPrice').innerHTML = allPrice.toLocaleString();
		               document.getElementsByName('allPrice')[0].value = allPrice;
		               document.getElementById('allDisPrice').innerHTML = allDisPrice.toLocaleString();
		               document.getElementsByName('allDisPrice')[0].value = allDisPrice;
		               
		               if(allTotalPrice >= 100000){
		            	   document.getElementsByName('deliveryFee')[0].value = 0;
		            	   document.getElementById('deliveryFee').innerHTML = 0;
		               } else {
		            	   document.getElementById('deliveryFee').innerHTML = parseInt('${deliveryFeeMax.deliveryFeeMax}').toLocaleString();
		            	   document.getElementsByName('deliveryFee')[0].value = '${deliveryFeeMax.deliveryFeeMax}';
		            	   allTotalPrice += parseInt('${deliveryFeeMax.deliveryFeeMax}');
		               }
		               
		               document.getElementsByName('finalPrice')[0].value = allTotalPrice;
		               document.getElementById('finalPrice').innerHTML = allTotalPrice.toLocaleString();
	              }
	
	          });
	           </c:if>
	           </c:forEach>
	           
	  
      });
   </script>