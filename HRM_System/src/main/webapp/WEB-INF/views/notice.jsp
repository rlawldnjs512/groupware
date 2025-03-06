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
		<%@ include file="header.jsp" %>
		<div class="main-content">
		   <div class="table-responsive">
		       <table class="table table-hover table-rounded table-striped border gy-7 gs-7">
		           <thead>
		               <tr class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
		                   <th>ID</th>
		                   <th>제목</th>
		                   <th>작성자</th>
		                   <th>작성일</th>
		               </tr>
		           </thead>
		           <tbody>
		               <c:choose>
		                   <c:when test="${empty lists}">
		                       <tr>
		                           <td colspan="4" class="text-center text-muted">등록된 공지사항이 없습니다.</td>
		                       </tr>
		                   </c:when>
		                   <c:otherwise>
		                       <c:forEach var="vo" items="${lists}">
		                           <tr>
		                               <td>${vo.not_id}</td>
		                               <td>${vo.title}</td>
		                               <td>${vo.name}</td>
		                               <td>${vo.regdate}</td>
		                           </tr>
		                       </c:forEach>
		                   </c:otherwise>
		               </c:choose>
		           </tbody>
		       </table>
		       <input type="button" class="btn btn-light-primary ms-2" value="등록하기" 
		       		onclick="location.href='./newNotice.do'">
		   </div>            
		</div>
    </div>
</body>
</html>
