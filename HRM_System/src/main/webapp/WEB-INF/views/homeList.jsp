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
	</style>
</head>
<%@ include file="sidebar.jsp"%>
<body>
	<div class="content" id="content">
		<%@ include file="header.jsp"%>
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
		</div> <!-- main-content -->
	</div> <!-- content -->
</body>
</html>