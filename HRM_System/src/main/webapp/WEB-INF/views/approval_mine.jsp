<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="main-content">
			<!-- 결재 완료된 내 문서 -->

			<div class="card list border-light mb-3 shadow p-3 rounded wide-card">
				<ul class="nav nav-tabs nav-line-tabs mb-5 fs-6">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="tab" href="#kt_tab_pane_1">진행중인 결재</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#kt_tab_pane_2">종료된 결재</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
						href="#kt_tab_pane_3">전체 결재</a></li>
				</ul>

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="kt_tab_pane_1"
						role="tabpanel">
						<table
							class="table table-hover table-rounded table-striped border gy-7 gs-7">
							<thead>
								<tr
									class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
									<th>문서번호</th>
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
									<c:when test="${empty lists}">
										<tr>
											<td colspan="7" class="text-center text-muted">진행중인 결재가 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="vo" items="${lists}">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div class="pagination-container text-center">
							<c:if test="${page.totalPage > 1}">
								<ul class="pagination pagination-lg">
									<c:if test="${page.page > 1}">
										<li><a href="./homeList.do?page=${page.page - 1}">&laquo;</a></li>
									</c:if>

									<c:forEach var="i" begin="${page.stagePage}"
										end="${page.endPage}" step="1">
										<li class="${i == page.page ? 'active' : ''}"><a
											href="./homeList.do?page=${i}">${i}</a></li>
									</c:forEach>

									<c:if test="${page.page < page.totalPage}">
										<li><a href="./homeList.do?page=${page.page + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</c:if>
						</div>
					</div><!-- 임시문서함 탭 끝 -->

					<div class="tab-pane fade" id="kt_tab_pane_2" role="tabpanel">
						<table
							class="table table-hover table-rounded table-striped border gy-7 gs-7">
							<thead>
								<tr
									class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
									<th>발급번호</th>
			        				<th>유형</th>
			        				<th>제목</th>
			        				<th>작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty freeLists}">
										<tr>
											<td colspan="4" class="text-center text-muted">종료된 결재가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="vo" items="${freeLists}">
											<tr>
												<td>${vo.free_id}</td>
												<td>${vo.title}</td>
												<td>${vo.name}</td>
												<td>${vo.regdate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div class="pagination-container text-center">
							<c:if test="${page.totalPage > 1}">
								<ul class="pagination pagination-lg">
									<c:if test="${page.page > 1}">
										<li><a href="./homeList.do?page=${page.page - 1}">&laquo;</a></li>
									</c:if>

									<c:forEach var="i" begin="${page.stagePage}"
										end="${page.endPage}" step="1">
										<li class="${i == page.page ? 'active' : ''}"><a
											href="./homeList.do?page=${i}">${i}</a></li>
									</c:forEach>

									<c:if test="${page.page < page.totalPage}">
										<li><a href="./homeList.do?page=${page.page + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</c:if>
						</div>
					</div><!-- 부서문서함 탭 끝 -->
					<div class="tab-pane fade" id="kt_tab_pane_3"
						role="tabpanel">
						<table
							class="table table-hover table-rounded table-striped border gy-7 gs-7">
							<thead>
								<tr
									class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
									<th>문서번호</th>
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
									<c:when test="${empty lists}">
										<tr>
											<td colspan="7" class="text-center text-muted">결재가 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="vo" items="${lists}">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div class="pagination-container text-center">
							<c:if test="${page.totalPage > 1}">
								<ul class="pagination pagination-lg">
									<c:if test="${page.page > 1}">
										<li><a href="./homeList.do?page=${page.page - 1}">&laquo;</a></li>
									</c:if>

									<c:forEach var="i" begin="${page.stagePage}"
										end="${page.endPage}" step="1">
										<li class="${i == page.page ? 'active' : ''}"><a
											href="./homeList.do?page=${i}">${i}</a></li>
									</c:forEach>

									<c:if test="${page.page < page.totalPage}">
										<li><a href="./homeList.do?page=${page.page + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</c:if>
						</div>
					</div><!-- 임시문서함 탭 끝 -->
					
				</div><!-- tab-content 끝 -->

			</div>


        </div>
    </div>
</body>
</html>
