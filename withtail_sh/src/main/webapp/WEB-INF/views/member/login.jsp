<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.login-container {
	width: 400px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 20px;
}

.login-container h2 {
	text-align: center;
	margin-bottom: 30px;
}

.login-container .form-group {
	margin-bottom: 20px;
}

.login-container label {
	font-weight: bold;
	margin-bottom: 0;
}

.login-container input[type="text"], .login-container input[type="password"]
	{
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.login-container button {
	width: 100%;
	padding: 15px;
	border-radius: 5px;
	background-color: #82ae46;
	color: #fff;
	border: none;
	margin-top: 10px;
}

.login-container button:hover {
	color: black;
	background-color: #fff;
	border: 1px solid #82ae46;
}

.login-container button:focus {
	color: black;
	background-color: #fff;
	border: 1px solid #82ae46;
}

hr {
	border: 1px solid #ccc;
}
</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>



<div class="login-container">
	<h2>로그인</h2>
	<form name="loginForm" action="" method="post">
		<div class="form-group">
			<label for="username">아이디</label> <input type="text"
				class="form-control" id="userId" name="userId" placeholder="아이디">
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label> <input type="password"
				class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호">
		</div>
		<button type="button" class="btn" onclick="sendLogin();">로그인하기</button>
		<div>
			<p class="form-control-plaintext text-center text-primary">${message}</p>
        </div>
	</form>
	<div class="text-center mt-3">
		<p>
			<a href="${pageContext.request.contextPath}/member/idFind">아이디 찾기</a> | <a href="${pageContext.request.contextPath}/member/pwdFind">비밀번호 찾기</a>
		</p>
		<p>
			계정이 없으세요? <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
		</p>
	</div>
</div>
