<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/common.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
</head>
<body>
<div class="sidebar" id="sidebar">
    <!-- 3점 버튼 -->
    <button class="menu-btn" id="toggleBtn">⋮</button>

    <div class="text-center mb-4">
        <img src="#" alt="Logo" width="120">
        <span>HRM</span>
    </div>
    <ul id="menuList">
        <li class="active"><i class="fas fa-user"></i> User Profile</li>
        <li><i class="fas fa-th"></i> <a href="./reservation.do">예약관리</a></li>
        <li><i class="fas fa-user-shield"></i> Authentication</li>
        <li><i class="fas fa-building"></i><a href="./mypage.do">마이페이지</a></li>
        <li><i class="fas fa-fingerprint"></i><a href="./approval.do">전자결재</a></li>
        <li><i class="fas fa-blog"></i><a href="./blog.do">게시판</a></li>
        <li><i class="fas fa-briefcase"></i> Careers</li>
        <li><i class="fas fa-toolbox"></i> Utilities</li>
    </ul>
</div>
</body>

</html>

