<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>근태관리</title>
	<script type="text/javascript" src="./js/attendance.js"></script>
	<style>
		.card.border-light.mb-3 { 
			background-color: #F0F0F0;
			width: 18rem;
			min-height: 11rem;
			margin-left: 10px;
			margin-top: 10px;
 		}
 		img {
 			width: 20px;
 			height: 20px;
 		}
 		h2.card-title {
 			padding-top: 30px;
 			margin-bottom: 0;
 			font-weight: bold;
 		}
 		p {
 			margin-top: auto;
 		}
	</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	
	<div class="content" id="content">
	<%@ include file="header.jsp" %>
		<div class="main-content">
		
		<div class="d-flex">
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/work.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-end">
			    	${avgClockInTime}
			    </h2>
			    <p class="card-text d-flex align-items-end">평균 출근 시간</p>
			  </div>
			</div>
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/gohome.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-center">
			    	${avgClockOutTime}
			    </h2>
			    <p class="card-text d-flex align-items-end">평균 퇴근 시간</p>
			  </div>
			</div>
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/avg.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-center">
			    	${avgWorkTime}
			    </h2>
			    <p class="card-text d-flex align-items-end">평균 근무 시간</p>
			  </div>
			</div>
		</div>
		
		
		<div class="d-flex">
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/extraTime.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-center">
			    	${extraTime}시간
			    </h2>
			    <p class="card-text d-flex align-items-end">보상시간</p>
			  </div>
			</div>
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/late.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-center">
			    	${late}번
			    </h2>
			    <p class="card-text d-flex align-items-end">이번 달 지각</p>
			  </div>
			</div>
			<div class="card border-light mb-3 shadow p-3 rounded">
			  <div class="card-header">
			  	<img src="./images/vacation.svg">
			  </div>
			  <div class="card-body d-flex flex-column justify-content-between">
			    <h2 class="card-title d-flex align-items-center">
			    	${leaveRemain}일
			    </h2>
			    <p class="card-text d-flex align-items-end">남은 휴가</p>
			  </div>
			</div>
		</div>
		
		
		
		</div>
		
</div>	

</body>






<!-- <table class="table table-hover"> -->
<!-- 				<thead> -->
<!-- 					<tr class="success"> -->
<!-- 						<td>번호</td> -->
<!-- 						<td>출퇴근날짜</td> -->
<!-- 						<td>출근시간</td> -->
<!-- 						<td>퇴근시간</td> -->
<!-- 						<td>총근무시간(분)</td> -->
<!-- 						<td>근무형태</td> -->
<!-- 						<td>보상시간사용</td> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach var="vo" items="${lists}" varStatus="vs"> --%>
<!-- 						<tr> -->
<%-- 							<td>${vo.attend_id}</td> --%>
<%-- 							<td>${vo.attend_date}</td> --%>
<%-- 							<td>${vo.clockin}</td> --%>
<%-- 							<td>${vo.clockout}</td> --%>
<%-- 							<td>${vo.total_time}</td> --%>
<%-- 							<td>${vo.attend_type}</td> --%>
<%-- 							<td>${vo.use_extra_time}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</tbody> -->
<!-- 			</table> -->











</html>