<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<script type="text/javascript" src="./js/attendance.js"></script>
	<link rel="stylesheet" href="./css/emplist.css">
	<style>
		img {
 			width: 120px;
 			height: 120px;
 			border-radius: 50%;
 			display: block;
 			margin: 0 auto;
 		}
 		.card.border-light.mb-3 {
 			background-color: #F0F0F0;
 			width: 20em;
 			height: auto;
 			text-align: center;
 			margin-left: 10px;
			margin-top: 10px;
 		}
 		.card-text {
		    display: flex;              	 /* 자식 요소들을 세로로 배치 */
		    flex-direction: column;     	 /* 세로 방향으로 배치 */
		    height: 100%;               	 /* 부모 요소의 높이를 100%로 설정 */
		    gap: 50px; 						 /* 각 요소 사이에 간격 추가 */
		}
		
		.attendButton {
			display: flex;  				 /* 자식 요소들을 가로로 배치 */
			justify-content: space-between;  /* 두 요소를 양 끝에 배치 */
			width: 100%;  					 /* 부모 요소의 넓이를 꽉 채움 */
		    margin-top: auto;           	 /* 남은 공간을 차지하면서 하단으로 밀어넣음 */
		}

		.attendTime {
		    display: flex;  				 /* 자식 요소들을 가로로 배치 */
		    justify-content: space-between;  /* 두 요소를 양 끝에 배치 */
		    width: 100%;  					 /* 부모 요소의 넓이를 꽉 채움 */
		}
		.attendTime div {
		    text-align: center;  			 /* 각 div 안의 내용 중앙 정렬 */
		}
		
/* ------------- 게시판 ------------------------ */		
		
		/* 부모 요소가 flex일 경우 너비 확장 */
		.main-content {
		    display: flex;
		    flex-wrap: wrap; /* 요소가 줄 바꿈될 수 있도록 */
		    width: 100%;
			align-items: flex-start; /* 카드들의 높이를 각각 콘텐츠에 맞게 설정 */
		}

		/* 특정 card만 넓게 설정 */
		.wide-card {
		    flex-grow: 1; /* 가능한 최대 너비를 차지하도록 설정 */
		    width: 100%; /* 부모 요소 기준으로 꽉 차게 설정 */
		    max-width: 1200px; /* 원하는 최대 너비 설정 */
		}

		/* 표가 card의 전체를 차지하도록 */
		.wide-card .table {
		    width: 100%;
		    min-width: 900px; /* 최소 너비 설정 */
		}


	</style>
</head>
<%@ include file="sidebar.jsp"%>
<body>
	<div class="content" id="content">
		<div>
			<input type="hidden" id="extraTime" value="${extraTime}"> 
			<input type="hidden" id="attendType" value="${attendType}">
		</div>

		<div class="main-content">

			<div class="card border-light mb-3 shadow p-3 rounded">
				<div class="profile-image-area">
					<img src="${profileImg}">
				</div>
				<div class="card-body">
					<h3 class="card-title">${empName}</h3>
					<p>${deptName}</p>

					<div class="card-text">
					
						<div class="attendTime">
							<div>
								<span id="clockInTime" style="font-weight: bold;">${clockIn}</span><br>
								<small class="text-body-secondary">출근 시간</small>
							</div>
							<div>
								<span id="clockOutTime" style="font-weight: bold;">${clockOut}</span><br>
								<small class="text-body-secondary">퇴근 시간</small>
							</div>
						</div>

						
						<div class="progress" role="progressbar" aria-label="Animated striped example" 
							 aria-valuenow="${progress}" aria-valuemin="0" aria-valuemax="100" style="position: relative;">
							<div class="progress-bar progress-bar-striped progress-bar-animated" style="width: ${progress}%">
								<span style="font-weight: bold;">${progress}%</span>
							</div>
						</div>


						<div class="attendButton">
							<form id="clockInForm" action="/insertAttendance" method="post">
								<button type="submit" class="btn btn-outline-secondary btn-lg"
									id="clockIn" <c:if test="${isClockedIn}">disabled</c:if>>출근
								</button>
							</form>
							<form id="clockOutForm">
								<button type="button" class="btn btn-outline-secondary btn-lg"
									id="clockOut" <c:if test="${!isClockedIn}">disabled</c:if>>퇴근
								</button>
							</form>
						</div>
						
					</div> <!-- card-text -->
				</div> <!-- card-body -->
			</div> <!-- card -->
			
			<div class="card border-light mb-3 shadow p-3 rounded wide-card">
			    <ul class="nav nav-tabs nav-line-tabs mb-5 fs-6">
			        <li class="nav-item">
			            <a class="nav-link active" data-bs-toggle="tab" href="#kt_tab_pane_1">공지사항</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_2">커뮤니티</a>
			        </li>
			    </ul>

			    <div class="tab-content" id="myTabContent">
			        <div class="tab-pane fade show active" id="kt_tab_pane_1" role="tabpanel">
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
			                        <c:when test="${empty noticeLists}">
			                            <tr>
			                                <td colspan="4" class="text-center text-muted">등록된 공지사항이 없습니다.</td>
			                            </tr>
			                        </c:when>
			                        <c:otherwise>
			                            <c:forEach var="vo" items="${noticeLists}">
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

			            <div class="pagination-container text-center">
			                <c:if test="${page.totalPage > 1}">
			                    <ul class="pagination pagination-lg">
			                        <c:if test="${page.page > 1}">
			                            <li><a href="./homeList.do?page=${page.page - 1}">&laquo;</a></li>
			                        </c:if>

			                        <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
			                            <li class="${i == page.page ? 'active' : ''}">
			                                <a href="./homeList.do?page=${i}">${i}</a>
			                            </li>
			                        </c:forEach>

			                        <c:if test="${page.page < page.totalPage}">
			                            <li><a href="./homeList.do?page=${page.page + 1}">&raquo;</a></li>
			                        </c:if>
			                    </ul>
			                </c:if>
			            </div>
			        </div> <!-- 공지사항 탭 끝 -->

			        <div class="tab-pane fade" id="kt_tab_pane_2" role="tabpanel">
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
			                        <c:when test="${empty freeLists}">
			                            <tr>
			                                <td colspan="4" class="text-center text-muted">등록된 커뮤니티 글이 없습니다.</td>
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

			                        <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
			                            <li class="${i == page.page ? 'active' : ''}">
			                                <a href="./homeList.do?page=${i}">${i}</a>
			                            </li>
			                        </c:forEach>

			                        <c:if test="${page.page < page.totalPage}">
			                            <li><a href="./homeList.do?page=${page.page + 1}">&raquo;</a></li>
			                        </c:if>
			                        
			                        
			                        
			                    </ul>
			                </c:if>
			            </div>
			        </div> <!-- 커뮤니티 탭 끝 -->
			    </div> <!-- tab-content 끝 -->
			</div> <!-- card 끝 -->
			
		</div> <!-- main-content -->
	</div> <!-- content -->
</body>
</html>