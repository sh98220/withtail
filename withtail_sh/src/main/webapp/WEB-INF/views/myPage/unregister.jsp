<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
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

.-min {
	min-height: 550px;
}

.withdrawal {
    align-items: center;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    justify-content: center;
    padding: 30px 0;
    width: 100%;
}

.frame-271 {
    align-items: center;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.warning-image-1 {
    height: 195px;
    min-width: 233px;
    object-fit: cover;
}

.withdrawal-text-layout {
    align-items: center;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.warningtext {
    color: red;
    align-self: stretch;
    font-size: 19px;
    font-weight: 500;
    text-align: center;
}

span {
	font-size: 19px;
	color: black;
}

.subtitle {
	font-size: 12px;
	color: gray;
}

.subtitle2 {
	font-size: 14px;
	margin-left: 14px;
}

.withdrawal-button-layout {
    display: flex;
    flex-direction: row;
    width: 400px;
    gap: 10px;
    justify-content: center;
}

.btn11 {
	border: 1px solid #cfcfcf;
    background-color: white;
    color: #cfcfcf;
    border-radius: 5px;
    height: 55px;
    width: 222px;
}

.btn12 {
	border: none;
    background-color: #82ae46;
    color: white;
    border-radius: 5px;
    height: 55px;
    width: 222px;
}

.subtitle3 {
 font-size: 16px;
 color: #cfcfcf;
}
</style>

<script>

$(function() {
	$('#withdrawalButton').click(function(){
		alert("해ㅐㅇ");
		let enabled = $('#enabled').val();
		
		updateEnabled(enabled);
	});
	
	function updateEnabled(enabled) {
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/updateUnregister',
			type: 'POST',
			data: {enabled: enabled},
			dataType: "JSON",
			success: function(data) {
				logoutAndRedirect();
			},
			error: function(xhr, status, error) {
				alert('실패');
			}
		});
		
	}
	
	function logoutAndRedirect() {
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/logout', // 로그아웃 요청 경로
			type: 'POST',
			success: function() {
				window.location.href = '${pageContext.request.contextPath}/'; // 메인 화면 경로
			},
			error: function(xhr, status, error) {
				alert('로그아웃 실패');
			}
		});
	}
	
	
});

</script>

<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	<div class="withdrawal">
		<div class="frame-271">
			<img class="warning-image-1" alt="warning-image-1" src="${pageContext.request.contextPath}/resources/images/icon/warning-image.png">
			<div class="withdrawal-text-layout">
				<p style="text-align: center;">
					<span>회원 탈퇴 즉시 고객님의 모든 정보가 소멸되며,
					<br>
					 이전으로
					</span>
					<span class="warningtext">
						복구가 불가능
					</span>
					<span>
						합니다.
					</span>
				</p>
				<p style="text-align: center; margin-top: -23px;">
					<span class="subtitle">- 탈퇴 이후 데이터 삭제로 인해 고객센터 대응에 어려움이 있을 수 있습니다.</span>
				</p>
			</div>
		</div>
		<div style="margin-top: -18px;">
		  <input type="checkbox" id="agreementCheckbox" onchange="toggleAgreement()">
		  <span id="agreementText" class="subtitle2">안내 사항을 모두 확인했으며 동의합니다.</span>
		</div>
		<div class="withdrawal-button-layout">
		  <input type="hidden" name="enabled" id="enabled" value="${dto1.enabled}">
		  <button id="withdrawalButton" type="button"  class="btn11" disabled> 
		  	<span class="subtitle3" id="withdrawalButtonText">회원탈퇴</span> 
		  </button>
		  <button type="button" class="btn12" onclick="location.href='${pageContext.request.contextPath}/myPage/profile'">취소하기</button>
		</div>
	</div>
</div>

<script>
  function toggleAgreement() {
    var agreementCheckbox = document.getElementById('agreementCheckbox');
    var agreementText = document.getElementById('agreementText');
    var withdrawalButton = document.getElementById('withdrawalButton');
    var withdrawalButtonText = document.getElementById('withdrawalButtonText');

    if (agreementCheckbox.checked) {
      agreementText.style.color = 'rgb(68 148 241)';
      withdrawalButton.style.borderColor = 'rgb(68 148 241)';
      withdrawalButton.disabled = false;
      withdrawalButtonText.style.color = 'rgb(68 148 241)';
    } else {
      agreementText.style.color = '';
      withdrawalButton.style.borderColor = '';
      withdrawalButton.disabled = true;
      withdrawalButtonText.style.color = '';
    }
  }
</script>