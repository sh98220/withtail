<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <style>
    /* 네비게이션 탭 스타일 */


    .submenu-layout {
      box-sizing: content-box;
      background-color: #f8f8f8;
      border-radius: 75px;
      display: flex;
      align-items: center;
      width: 22%;
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

.mypage {
    align-items: flex-start;
    background-color: var(--aloy-white);
    border: 1px none;
    display: flex;
    gap: 80px;
    justify-content: center;
    padding: 30px 0px;
    width: 100%;
}

.profile-section {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 20px;
}

.upper-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.title {
    color: var(--aloy-black);
    font-size: var(--font-size-24px);
    font-weight: 700;
    font-style: normal;
    align-self: stretch;
}

.profile-section .pets-layout {
    gap: 10px;
}

.pets-layout {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    align-self: stretch;
    margin-bottom: -28px;
}

.title-layout {
    align-items: flex-end;
    align-self: stretch;
    border: 1px none;
    display: flex;
    justify-content: center;
}

.title-two {
    color: #121212;
    flex: 1;
    font-size: 16px;
    font-weight: 600;
}

.title-three {
    color: #4494f1;
    font-size: 12px;
    font-weight: 400;
}

.pets-profile {
    background-color: #f8f8f8;
    border-radius: 5px;
    padding: 20px;
    display: flex;
    align-items: center;
    align-self: stretch;
    flex-wrap: wrap;
    row-gap: 10px;
}
}

.pets-profile .pets {
    margin-right: 0px;
    flex-grow: 0 !important;
    flex-basis: calc((100% - 20px)/3);
}

.pets {
    align-items: center;
    background-color: rgb(255 255 255);
    border: 1px solid;
    border-color: rgb(101 165 239);
    border-radius: 5px;
    display: flex;
	width: 30%;
    height: 80px;
    justify-content: center;
    flex-basis: 30.33%;
    margin-left: 11px;
}

.setting {
    align-items: flex-end;
    background-color: var(--aloy-white);
    border: 1px solid;
    border-color: var(--aloy-gray4-stroke);
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    width: 300px;
}

.detailed-information {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    justify-content: flex-start;
    padding: 16px 20px;
}

.detailed-information .information-layout {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    flex: 1;
}

.detailed-information .text-layout {
    margin-left: -1px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    align-self: stretch;
}

.detailed-information .text {
    color: #000;
    align-self: stretch;
    font-size: 12px;
    font-weight: 400;
}

.image-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
}

.image {
    height: 50px;
    min-width: 50px;
    object-fit: cover;
    position: relative;
    aspect-ratio: 1/1 !important;
    width: 50px;
}

.image .gender {
    position: absolute;
    right: 0px;
    bottom: 0px;
    z-index: 3;
    width: 20px;
    height: 20px;
}

.image img {
    object-fit: cover;
    aspect-ratio: 1/1 !important;
    max-width: 100%;
}

.my-pet {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
    flex-basis: min-content !important;
}

.pets-name {
    align-self: stretch;
    margin-top: -1px;
    color: #121212;
    font-size: 12px;
    font-weight: 400;
}

.pets-text-layout {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    align-self: stretch;
}

.pets-text {
    color: #8b8b8b;
    align-self: stretch;
    font-size: 12px;
    font-weight: 400;
}

.-min {
	min-height: 550px;
}

.add-pets {
    background-color: #fff;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #4494f1;
    width: 220px;
    height: 80px;
}

.add-image-layout {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    align-self: stretch;
    width: 85px;
}

.my-pet1 {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
}

.pets-name1 {
    align-self: stretch;
    margin-top: -1px;
    color: #121212;
    font-size: 12px;
    font-weight: 400;
}

.pets-text1 {
    color: #8b8b8b;
    align-self: stretch;
    font-size: 12px;
    font-weight: 400;
}

.address-text-wrap {
	align-items: flex-end;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
	justify-content: space-between;
}

.address-text-layout-1 {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 4px;
}

  </style>

  <div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
 
  
	  <div class="mypage">
	  	<div class="profile-section">
	  		<div class="upper-layout">
	  			<p style="font-size: 24px; color: black; font-weight: 1000; margin-bottom: -10px;">${sessionScope.member.userName} 집사님, 안녕하세요!</p>
	  			<p>
	  				이 곳에서는 계정 정보를 설정할 수 있어요.
	  			<br>
	  				내 계정 정보를 설정하고 신나는 쇼핑하러 가보실까요?
	  			</p>
	  		</div>
	  		
	  		<div class="pets-layout">
	  			<div class="title-layout">
	  				<p class="title-two">사랑하는 우리 아이</p>
	  				<p class="title-three"><a class="title-three" href="${pageContext.request.contextPath}/pets/new">+ 다른 아이가 더 있나요?</a></p>
	  			</div>
	  		</div>
	  		<div class="pets-profile d-none d-md-flex">
	  			<c:choose>
	  				<c:when test="${dataCount eq 0}">
			  			<a class="add-pets" href="${pageContext.request.contextPath}/pets/new">
			  				<div class="add-image-layout">
				  					<img alt="" src="${pageContext.request.contextPath}/resources/svg/icon-add-blue.svg">			
				  			</div>
				  			<div class="my-pet1">
				  				<p class="pets-name1" style="margin-bottom : 0px">우리 아이 등록하기</p>
				  				<p class="pets-text1" style="margin-bottom : 0px" >맞춤 정보를 받아보세요.</p>
				  			</div>
			  			</a>
	  				</c:when>
	  				<c:otherwise>
			  			<c:forEach var="dto" items="${list}" varStatus="status">
			  				<c:url var="url" value="/myPage/pet">
			  					<c:param name="num" value="${dto.num}"/>
			  				</c:url>
				  			<a class="pets" href="${url}">			  			
				  				<div class="image-layout">
				  					<div class="image">
										<c:choose>
											<c:when test="${dto.gender == '남'}">	  					
					  							<img alt="gender" class="gender" src="${pageContext.request.contextPath}/resources/images/icon/male.png">
					  						</c:when>
					  						<c:otherwise>
					  							<img alt="gender" class="gender" src="${pageContext.request.contextPath}/resources/images/icon/female.png">
					  						</c:otherwise>
					  					</c:choose>
					  					<c:choose>
					  						<c:when test="${!empty dto.petsImageFilename}">
					  							<img src="${pageContext.request.contextPath}/uploads/pets/${dto.petsImageFilename}">
				  							</c:when>
				  							<c:otherwise>
				  								<c:choose>
					  								<c:when test="${dto.whichPet == '강아지'}">
					  									<img src="${pageContext.request.contextPath}/resources/images/icon/dog1.png">
					  								</c:when>
					  								<c:otherwise>
					  									<img src="${pageContext.request.contextPath}/resources/images/icon/cat2.png">
					  								</c:otherwise>
					  							</c:choose>	
				  							</c:otherwise>
				  						</c:choose>
				  					</div>
				  				</div>
				  				<div class="my-pet">
				  					<p class="pets-name" style="margin-bottom: 0px;">${dto.petName}</p>
				  					<div class="pets-text-layout">
				  						<p class="pets-text" style="margin-bottom: 0px;">${dto.breed}</p>	  						
				  					</div>
				  				</div>
				  			</a>
			  			</c:forEach>	
		  			</c:otherwise>
		  		</c:choose>  					
	  		</div> 		  			
	  	</div> 
	  	
	  	<div class="setting">
			<a href="${pageContext.request.contextPath}/myPage/profile" class="detailed-information"> 	  	
				<div>
					<div class="information-layout">
						<p class="title-two" style="margin-bottom: 0px" >프로필</p>
						<div class="text-layout">
							<p style="margin-bottom: -5px; font-size: 13px;">${dto2.userName}</p>
							<p style="margin-bottom: -5px; font-size: 13px;">${dto2.email}</p>					
						</div>
					</div>
				</div>  
			</a>
			<hr style="width: 100%; margin-top: 0px; margin-bottom: 0px;">
			
			
			<c:choose>
				<c:when test="${addDataCount eq 0}">
					<a href="${pageContext.request.contextPath}/myPage/delivery" class="detailed-information">	
						<div>
							<div class="information-layout">
								<p class="title-two" style="margin-bottom: 0px" >자주 쓰는 배송지</p>
								<div class="text-layout">
									<p style="margin-bottom: -5px; font-size: 13px;">없음</p>					
								</div>
							</div>
						</div> 	
					</a>
				</c:when>
				<c:otherwise>
						<a href="${pageContext.request.contextPath}/myPage/delivery" class="detailed-information">	
							<div>
								<div class="information-layout">
									<p class="title-two" style="margin-bottom: 0px" >자주 쓰는 배송지</p>
									<div class="address-text-wrap">
										<div class="text-layout">
											<p class="registered-address-name-1 valign-text-middle"  style="margin-bottom: -5px; font-size: 13px;">${dto1.addName}</p>
											<p class="registered-address-1 valign-text-middle"  style="margin-bottom: -5px; font-size: 13px;">
												${dto1.addr1} ${dto1.addr2} ${dto1.zip}</p>
											<p class="phone-number-1 valign-text-middle"  style="margin-bottom: -5px; font-size: 13px;" >${dto1.tel}</p>
											<p class="message-1 valign-text-middle"  style="margin-bottom: -5px; font-size: 13px;">${dto1.memo}</p>
										</div>
									</div>
								</div>
							</div> 	
						</a>
				</c:otherwise>
			</c:choose>
			
			
			<hr style="width: 100%; margin-top: 0px; margin-bottom: 0px;">
			
			<a href="${pageContext.request.contextPath}/myPage/storecredit" class="detailed-information">		
				<div>
					<div class="information-layout">
						<p class="title-two" style="margin-bottom: 0px" >적립금</p>
						<div class="text-layout">
							<c:choose>
								<c:when test="${pointDataCount eq 0 or dto3.balance eq 0}">
									<p style="margin-bottom: 0px; font-size: 13px;">0원</p>
								</c:when>
								<c:otherwise>
									<p style="margin-bottom: 0px; font-size: 13px;"><fmt:formatNumber value="${dto3.balance}" pattern="#,###" />원</p>	
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div> 	
			</a>
			
			
			<hr style="width: 100%; margin-top: 0px; margin-bottom: 0px;">
		
			<a href="${pageContext.request.contextPath}/myPage/coupon" class="detailed-information">
				<div>
					<div class="information-layout">
						<p class="title-two" style="margin-bottom: 0px" >쿠폰</p>
						<div class="text-layout">
							<p style="margin-bottom: -5px; font-size: 13px;">${couponUnusedDataCount}장</p>					
						</div>
					</div>
				</div> 	
			</a>
				<hr style="width: 100%; margin-top: 0px; margin-bottom: 0px;">
	  	</div>
	  		
	  </div>
  </div>

