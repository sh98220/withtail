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
.btn{border-radius: 10px;}

.btn:hover{background: #6C757D; color: white}


.pointhover:hover{
  background-color: #82ae4654;
  }
  
 .table-border tbody > tr {
   border-bottom: 1px solid #e9e9e9; 
}
.btn{
	border-radius: 0.375rem;
	width: 70px;
	height: 37px;
}
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.membership>50}">
	function deleteOk() {
		let query = "num=${dto.num}&${query}";
		let url = "${pageContext.request.contextPath}/admin/noticeManage/delete?" + query;
	
		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href = url;
		} 
	}
</c:if>
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-circle-exclamation"></i> 공지사항 </h2>
    </div>

		<table class="table table-border table-article">
			<thead>
				<tr>
					<td colspan="2" align="center" style="border-bottom: 1px solid #999;  border-top: 2px solid #999; height: 47px;">
						${dto.subject}${dto.enabled == 1 ? "" : " [숨김]" }
					</td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td width="50%" align="left">
						이름 : ${dto.userName}
					</td>
					<td width="50%" align="right">
						${dto.regDate} | 조회 ${dto.hitCount}
					</td>
				</tr>
				
				<tr>
					<td colspan="2" valign="top" height="200">
						${dto.content}
					</td>
				</tr>
				
				<c:forEach var="vo" items="${listFile}">
					<tr>
						<td colspan="2">
							파&nbsp;&nbsp;일 :
							<a href="${pageContext.request.contextPath}/admin/noticeManage/download?fileNum=${vo.fileNum}"><i class="icofont-file-alt"></i> ${vo.originalName}</a>
							(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="2">
						이전글 :
						<c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/admin/noticeManage/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						다음글 :
						<c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/admin/noticeManage/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
					<c:choose>
						<c:when test="${sessionScope.member.userId == dto.userId}">
			    			<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/noticeManage/update?num=${dto.num}&page=${page}';">수정</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">수정</button>
			    		</c:otherwise>
			    	</c:choose>
			    	
	    			<button type="button" class="btn" onclick="deleteOk();">삭제</button>
				</td>
			
				<td align="right">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/noticeManage/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
	</div>
</div>
