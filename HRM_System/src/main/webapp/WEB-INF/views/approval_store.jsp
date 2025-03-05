<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    
    <meta charset="UTF-8">
    <title>전자결재</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <div class="header">
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active"
					href="./approval.do"> 결재 홈 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="./approval_mine.do"> 나의 결재 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="./approval_store.do"> 결재 문서함 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="./signature_manage.do"> 서명 관리 </a></li>
			</ul>
		</div>
        <div class="main-content">
            
        </div>
    </div>
</body>
</html>
