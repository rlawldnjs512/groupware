<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
    <meta charset="UTF-8">
    <title>증명서 신청</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active" href="/keen/demo1/account/overview.html">
						내 정보
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="/keen/demo1/account/overview.html">
						일정 관리
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="./certification.do">
						증명서 관리
					</a>
				</li>
			</ul>
        <div class="main-content">
			
        </div>
    </div>
</body>
</html>
