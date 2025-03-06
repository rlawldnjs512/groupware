<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<meta charset="UTF-8">
	<title>홈페이지</title>
	<style>
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
		
		.btn.btn-light-secondary {
			color: var(--bs-secondary);
			border-color: var(--bs-secondary-light);
			background-color: var(--bs-secondary-light);
		}
		
		.btn.btn-light-secondary:hover {
			color: var(--bs-white);
			border-color: var(--bs-secondary);
			background-color: var(--bs-secondary);
		}
		
		.btn.btn-light-secondary:focus {
			outline: none;
			box-shadow: 0 0 0 0.25rem rgba(var(--bs-secondary), 0.5);
		}
		.main-content {
			  position: relative;
			  width: 100%;
			  padding-top: 20px; /* 위쪽 여백 추가 */
			  text-align: center; /* 버튼 가운데 정렬 */
		}
		.button-container {
		  display: flex;
		  gap: 20px; /* 버튼 간격 */
		  margin-bottom: 20px; /* 아래쪽 여백 */
		}
		.button-container button {
		  flex: 1; /* 버튼 크기를 동일하게 확장 */
 		  max-width: 300px; /* 버튼 최대 너비 설정 */
		  height: 60px; /* 버튼 높이 */
		  font-size: 18px; /* 글자 크기 */
		  font-weight: bold; /* 글자 굵게 */
		}
	</style>
<script type="text/javascript" src="./js/attendance.js"></script>
</head>
<%@ include file="sidebar.jsp"%>
<body>
	<div class="content" id="content">
		<%@ include file="header.jsp"%>
		<div>
			<input type="hidden" id="extraTime" value="${extraTime}">
		</div>
		<div class="main-content">
			<div class="button-container">
				<form id="clockInForm" action="/insertAttendance" method="post">
					<button type="submit" class="btn btn-light-primary" id="clockIn"
					    <c:if test="${isClockedIn}">disabled</c:if>>출근
					</button>
				</form>
				<form id="clockOutForm">
					<button type="button" class="btn btn-light-secondary" id="clockOut" 
						<c:if test="${!isClockedIn}">disabled</c:if>>퇴근
					</button>
				</form>
				<div>
				출근 시간 : <span id="clockInTime">${clockIn}</span><br>
				퇴근 시간 : <span id="clockOutTime">${clockOut}</span>
				</div> 
			</div>
		</div>
	</div>


</body>
</html>