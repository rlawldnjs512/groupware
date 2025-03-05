<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
:root {
	--bs-primary: #1b84ff;
	--bs-primary-light: #e9f3ff;
	--bs-primary-white: #fff;
}

.btn.btn-light-primary {
	color: var(--bs-primary);
	border-color: var(--bs-primary-light);
	background-color: var(--bs-primary-light);
}

.btn.btn-light-primary:hover {
	color: var(--bs-primary-white);
	border-color: var(--bs-primary);
	background-color: var(--bs-primary);
}

.btn.btn-light-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-primary), 0.5);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f0f0f0;
}

.gray {
	background-color: #ddd;
}
</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <div class="header">
            <ul class="nav flex-wrap border-transparent">
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./notice.do"> 공지사항 </a>
                </li>
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./free.do"> 커뮤니티 </a>
                </li>
            </ul>
        </div>
        
        <div class="main-content">
        	<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
				증명서 신청 이력
			</h1>
        	<div>
        		<table border="1">
       				<tr>
       					<td>게시글ID</td>
       					<td><input type="text"></td>
       				</tr>
       				<tr>
       					<td>제목</td>
       					<td><input type="text"></td>
       				</tr>
       				<tr>
       					<td colspan="3">첨부파일</td>
       					<td><input type="text"></td>
       				</tr>
       				<tr>
       					<td>내용</td>
       					<td><textarea></textarea></td>
       				</tr>
        		</table>
        	</div>
        
        	<form id="select-form" action="./newNotice.do" method="POST">
		        <button type="submit" class="btn btn-light-primary ms-2" id="newNotice">등록하기</button>
		        <button class="btn btn-light-primary ms-2" onclick="history.back(-1)">취소</button>
			</form>
		</div>
    </div>
</body>
</html>
