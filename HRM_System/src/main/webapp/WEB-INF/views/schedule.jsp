<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정관리</title>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
	<link rel="stylesheet" href="./css/calendar.css">
	<style>
		.main-content {
		    display: flex;
		    flex-direction: column;
		    height: calc(100vh - 100px); 
		}
		
		#calendar {
		    flex-grow: 1;
		    width: 100%;
		    height: 100%;
		}
	</style>
</head>
 <%@ include file="sidebar.jsp" %>
<body>

	<div class="content" id="content">
		<div class="main-content">
			<div id='calendar'></div>
		</div> <!-- main-content -->
	</div> <!-- content -->
	
	<!-- 모달 창 추가 -->
	<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="eventModalLabel">일정 정보</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <p><img src="./images/calendar.svg"> <span id="modalEventTitle" style="font-weight: bold;"></span></p>
	                <p>
	                	<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="#17C653" class="bi bi-circle-fill" viewBox="0 0 16 16"><circle cx="8" cy="8" r="6"/></svg>
	                		<Strong>Start</Strong>
	                	<span id="modalEventStart"></span>
	                </p>
	                <p>
	                	<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="#F82457" class="bi bi-circle-fill" viewBox="0 0 16 16"><circle cx="8" cy="8" r="6"/></svg>
	                		<Strong>End</Strong>
	                	<span id="modalEventEnd"></span>
	                </p>
	                <p><img src="./images/etc.svg"><span id="modalMemo"></span></p>
	            </div>
	            
	            
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	
	
	

	<script>
		document.addEventListener('DOMContentLoaded', async function(event) {
			var calendarEl = document.getElementById('calendar');
			
			async function fetchEvents() {
		        try {
		            const response = await fetch('./schedule/reservation'); // API 호출
		            if (!response.ok) {
		                throw new Error('Network response was not ok');
		            }
		            const data = await response.json(); // JSON 변환
		            return data; // 데이터 반환
		        } catch (error) {
		            console.error('There was a problem with the fetch operation:', error);
		            return []; // 오류 발생 시 빈 배열 반환
		        }
		    }

			var calendar = new FullCalendar.Calendar(calendarEl, {
				timeZone : 'UTC',
				initialView : 'dayGridMonth',
				height : '100%',
				events : async function (fetchInfo, successCallback, failureCallback) {
					// API에서 이벤트 데이터를 비동기 가져오기
		            let sampleData = await fetchEvents();
	
		            // FullCalendar에 맞게 데이터 매핑
		            let events = sampleData.map(event => ({
		                title: event.title,
		                start: event.start,
		                extendedProps: {
		                	startTime: event.startTime,
		                	endTime: event.endTime,
		                	roomName: event.roomName
		                }
		            }));
	
		            // FullCalendar에 이벤트 데이터 전달
		            successCallback(events);
				},
				editable : true,
				selectable : true,
				eventClick: function(info) {
					
					// 제목 변경: 회의실 예약인 경우 제목을 '회의'로 변경
				    let eventTitle = info.event.title;
				    
				    // 회의실 예약 제목을 변경 (예시: 회의실A, 회의실B 등)
				    if (eventTitle.includes("회의실")) {
				        eventTitle = '회의';  // 회의실 예약인 경우 제목을 '회의'로 변경
				    }
				    
				 	// 날짜와 시간을 합쳐서 포맷
		            const startTime = info.event.extendedProps.startTime;
				    const endTime = info.event.extendedProps.endTime;
				    const roomName = info.event.extendedProps.roomName;
					
				 	// 모달에 데이터 삽입
				    document.getElementById('modalEventTitle').textContent = eventTitle;
				    document.getElementById('modalEventStart').textContent = startTime; // 시작 시간
				    document.getElementById('modalEventEnd').textContent = endTime; // 종료 시간
				    document.getElementById('modalMemo').textContent = roomName; // 회의실위치
				    
		            // 모달 표시
		            var eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
		            eventModal.show();
		        }
			});

			calendar.render();
		});
	</script>


</body>
</html>






















