<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./css/emplist.css">
    <meta charset="UTF-8">
    <title>전자결재</title>

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
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn.btn-light-primary:hover {
            color: var(--bs-primary-white);
            border-color: var(--bs-primary);
            background-color: var(--bs-primary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        thead {
            background-color: var(--bs-primary);
            color: white;
            font-weight: bold;
        }

        thead th {
            padding: 12px;
            text-align: center;
            border-bottom: 2px solid #ddd;
        }

        tbody td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        tbody tr:hover {
            background-color: var(--bs-primary-light);
        }
    </style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="main-content">
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>문서ID</th>
                            <th>유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>결재상태</th>
                            <th>결재일</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty approvalList}">
                                <tr>
                                    <td colspan="7" class="text-center">결재할 문서가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="approval" items="${approvalList}">
                                <input type="hidden" name="apprv_id" value="${approval.apprv_id}">
                                    <tr>
                                        <td>${approval.doc_id}</td>
                                        <td>${approval.doc_type}</td>
                                        <td>${approval.title}</td>
                                        <td>${approval.name}</td>
                                        <td>${approval.doc_status}</td>
                                        <td>${approval.doc_date}</td>
                                       <td>
										    <a href="./approval_detail.do?doc_id=${approval.doc_id}&apprv_id=${approval.apprv_id}"
										       class="btn btn-light-primary">상세보기</a>
										</td>
										</tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
