<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리</title>
<script type="text/javascript" src="./js/reservation.js"></script>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	
	<div class="content" id="content">
		<%@ include file="header.jsp" %>
		<!-- <h3>현재 로그인한 사원(input value="사원번호")의 출/퇴근 버튼 및 근무 시간 계산</h3> -->
		<div style="display: flex; justify-content: center; align-items: center; gap: 10px;">
			<form id="clockIn" action="/insertAttendance" method="post">
				<button class="btn btn-light-primary" type="button" onclick="confirmClockIn()">출근</button>
			</form>
			<form id="clockOut" action="/updateAttendance" method="post">
				<button class="btn btn-light-danger" type="button" onclick="confirmClockOut()">퇴근</button>
			</form>
<!-- 			<form action="/calAttendance" method="post"> -->
<!-- 				<button class="btn btn-lignt-info" type="submit">근무 시간 계산</button> -->
<!-- 			</form> -->
		</div>
		
		<table class="table table-hover">
			<thead>
				<tr class="success">
					<td>번호</td>
					<td>출퇴근날짜</td>
					<td>출근시간</td>
					<td>퇴근시간</td>
					<td>총근무시간(분)</td>
					<td>근무형태</td>
					<td>보상시간사용</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${lists}" varStatus="vs">
					<tr>
						<td>${vo.attend_id}</td>
						<td>${vo.attend_date}</td>
						<td>${vo.clockin}</td>
						<td>${vo.clockout}</td>
						<td>${vo.total_time}</td>
						<td>${vo.attend_type}</td>
						<td>${vo.use_extra_time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<script type="text/javascript">
	
		// 출근버튼
		function confirmClockIn(){
			if(confirm("출근하시겠습니까?")){
				document.getElementById("clockIn").submit();
			}
		}

	</script>
	

</body>
</html>