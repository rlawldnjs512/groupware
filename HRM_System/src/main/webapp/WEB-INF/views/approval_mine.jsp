<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/emplist.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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

thead th {
	padding: 12px;
	text-align: center !important; /* text-align에 !important 추가 */
	vertical-align: middle;
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
<%@ include file="sidebar.jsp"%>
<body>

	<div class="content" id="content">
		<%@ include file="header.jsp"%>
		<div class="main-content">
			<!-- 내가 결재를 보낸 문서 -->
			<div>
				<table>
					<thead>
						<tr>
							<th>발급번호</th>
							<th>유형</th>
							<th>제목</th>
							<th>결재상태</th>
							<th>기안일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="doc" items="${docList}">
							<tr>
								<td>${doc.doc_num}</td>
								<td>${doc.doc_type}</td>
								<td>${doc.title}</td>

		<td>
    <c:choose>
        <c:when test="${doc.doc_status == 'Y'}">
            <span class="badge bg-success"><i class="fas fa-check-circle"></i> 결재완료</span>
        </c:when>
        <c:when test="${doc.doc_status == 'N'}">
            <span class="badge bg-warning text-dark"><i class="fas fa-hourglass-half"></i> 진행중</span>
        </c:when>
    </c:choose>
</td>









								<td>
								<fmt:formatDate value="${doc.create_date}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>

</body>
</html>
