<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>근태 통계</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript" src="./js/chart.js"></script>
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
		h4.card-title {
			padding-top: 30px;
			margin-bottom: 0;
			font-weight: bold;
		}
		p {
			margin-top: auto;
		}
		#departmentWorkChart {
	        max-width: 400px;
	        max-height: 400px;
	        width: 100%;
	        height: auto;
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
				    <h4 class="card-title d-flex align-items-end">
				    	${avgClockInTimeAll}
				    </h4>
				    <p class="card-text d-flex align-items-end">직원 평균 출근</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/gohome.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${avgClockOutTimeAll}
				    </h4>
				    <p class="card-text d-flex align-items-end">직원 평균 퇴근</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/avg.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${avgWorkTimeAll}
				    </h4>
				    <p class="card-text d-flex align-items-end">일 평균 근무</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/late.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${lateToday}명
				    </h4>
				    <p class="card-text d-flex align-items-end">오늘 지각한 사원</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/late.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	2명
				    </h4>
				    <p class="card-text d-flex align-items-end">오늘 휴가 사용</p>
				  </div>
				</div>
			</div>
			
			<canvas id="departmentWorkChart"></canvas>
			
		</div> <!-- main-content -->	
	</div> <!-- content -->
</body>
</html>