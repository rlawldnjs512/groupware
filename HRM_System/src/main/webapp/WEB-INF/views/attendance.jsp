<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>근태관리</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.15/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/resource-timegrid@6.1.15/index.global.min.js'></script>
  	<link rel="stylesheet" href="./css/attendance.css">
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
				    	${avgClockInTime}
				    </h4>
				    <p class="card-text d-flex align-items-end">평균 출근 시간</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/gohome.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${avgClockOutTime}
				    </h4>
				    <p class="card-text d-flex align-items-end">평균 퇴근 시간</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/avg.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${avgWorkTime}
				    </h4>
				    <p class="card-text d-flex align-items-end">평균 근무 시간</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/extraTime.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${extraTime}시간
				    </h4>
				    <p class="card-text d-flex align-items-end">보상시간</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/late.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${late}번
				    </h4>
				    <p class="card-text d-flex align-items-end">이번 달 지각</p>
				  </div>
				</div>
				<div class="card border-light mb-3 shadow p-3 rounded">
				  <div class="card-header">
				  	<img src="./images/vacation.svg">
				  </div>
				  <div class="card-body d-flex flex-column justify-content-between">
				    <h4 class="card-title d-flex align-items-center">
				    	${leaveRemain}일
				    </h4>
				    <p class="card-text d-flex align-items-end">남은 휴가</p>
				  </div>
				</div>
			</div>
			
			<div id='calendar'></div>
		
		</div> <!-- main-content -->
	</div>	<!-- content -->
	
	<script>
		document.addEventListener('DOMContentLoaded', async function (event) {
		    var calendarEl = document.getElementById('calendar');
	
		    async function fetchEvents() {
		        try {
		            const response = await fetch('./attendance/events'); // API 호출
		            if (!response.ok) {
		                throw new Error('Network response was not ok');
		            }
		            const data = await response.json(); // JSON 변환
		            console.log('Fetched events:', data);
		            return data; // 데이터 반환
		        } catch (error) {
		            console.error('There was a problem with the fetch operation:', error);
		            return []; // 오류 발생 시 빈 배열 반환
		        }
		    }
	
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		        timeZone: 'UTC',
		        initialView: 'timeGridWeek',
		        slotMinTime: '07:00:00',
		        slotMaxTime: '23:00:00',
		        contentHeight: 'auto',
		        headerToolbar: {
		            left: 'prev,next',
		            center: 'title',
		            right: 'today'
		        },
		        events: async function (fetchInfo, successCallback, failureCallback) {
		            console.log("Fetching events...");
	
		            // API에서 이벤트 데이터를 비동기 가져오기
		            let sampleData = await fetchEvents();
	
		            console.log("Sample events:", sampleData);
	
		            // FullCalendar에 맞게 데이터 매핑
		            let events = sampleData.map(event => ({
		                title: event.title,
		                start: event.start,
		                end: event.end
		            }));
	
		            // FullCalendar에 이벤트 데이터 전달
		            successCallback(events);
		        }
		    });
	
		    // 캘린더 렌더링
		    calendar.render();
		});

	</script>

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