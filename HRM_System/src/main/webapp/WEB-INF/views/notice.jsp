<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
		<ul class="nav flex-wrap border-transparent">
			<li class="nav-item my-1">
				<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
			             active" href="./blog.do">
					게시판 홈
				</a>
			</li>
			<li class="nav-item my-1">
				<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
			             active" href="./notice.do">
					공지사항
				</a>
			</li>
			<li class="nav-item my-1">
				<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
			             active" href="./free.do">
					커뮤니티
				</a>
			</li>
		</ul>
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
						
					</tbody>
				</table>
			</div>            
        </div>
    </div>
</body>
</html>
