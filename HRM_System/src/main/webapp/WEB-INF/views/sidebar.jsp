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


<body>
    <div class="sidebar" id="sidebar">
        <!-- 3점 버튼 -->
        <button class="menu-btn" id="toggleBtn">⋮</button>

        <div class="text-center mb-4">
        
        </div>
        <ul id="menuList">
            <li class="active"><i class="fas fa-user"></i><a href="/homeList.do">
            Home
            
            </a></li>
            <li><i class="fas fa-th"></i> <a href="./reservation.do">
            예약
             
            </a></li>

            <!-- 사원조회 또는 사원관리 -->
            <li>
                <i class="fas fa-user-shield"></i>
                <a href="./emp.do">
                    <c:choose>
                        <c:when test="${sessionScope.loginVo.role eq 'A'}">사원관리</c:when>
                        <c:otherwise>사원조회</c:otherwise>
                    </c:choose>
                     
                </a>
            </li>

            <li><i class="fas fa-building"></i><a href="./attendanceListByEmpId">근태관리
            
            </a></li>
            <li><i class="fas fa-building"></i> <a>전자결재
           
            </a></li>
            <li><i class="fas fa-building"></i><a href="./mypage.do">마이페이지
            
            </a></li>
            <li><i class="fas fa-building"></i> <a>게시판
            
            </a></li>
        </ul>
    </div>
</body>
</html>
