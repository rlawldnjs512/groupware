<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/common.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
    <style> 
		.sidebar .text-center {
		    margin-bottom: 30px;
		}
		.sidebar .text-center img {
		    margin-bottom: 10px;
		}
    </style>
</head>
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelectorAll("#menuList li").forEach(function(li) {
	        li.addEventListener("click", function() {
	            const link = li.querySelector("a");
	            if (link) {
	                window.location.href = link.href;
	            }
	        });
	    });
	});
</script>
<body>
    <div class="sidebar" id="sidebar">
        <!-- 3점 버튼 -->
        <button class="menu-btn" id="toggleBtn">⋮</button>
			<br>
			<br>
        <ul id="menuList">
			<li class="active"><a href="/homeList.do"> Home </a></li>
			<li><a href="./mypage.do">마이페이지 </a></li>
			<c:choose>
				<c:when test="${sessionScope.loginVo.role eq 'A'}">
					<li><a href="./attendance_admin">근태관리</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="./attendance">근태관리</a></li>
				</c:otherwise>
			</c:choose>
			<!-- 사원조회 또는 사원관리 -->
			<li><a href="./emp.do"> 
				<c:choose>
					<c:when test="${sessionScope.loginVo.role eq 'A'}">사원관리</c:when>
					<c:otherwise>사원조회</c:otherwise>
				</c:choose>
			</a></li>

			<li><a href="./reservation.do"> 회의실예약 </a></li>
			<li><a href="./approval.do">전자결재 </a></li>
			<li><a href="./notice.do">게시판 </a></li>
			<li><a href="./logout.do">로그아웃 </a></li>
		</ul>
    </div>
</body>
</html>