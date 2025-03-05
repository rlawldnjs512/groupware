<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>근태관리</title>
	<script type="text/javascript" src="./js/attendance.js"></script>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	
	<div class="content" id="content">
		<%@ include file="header.jsp" %>
		<div>
			<input type="hidden" id="extraTime" value="${extraTime}">
		</div>
		<div>
			<form id="clockIn" action="/insertAttendance" method="post">
				<button class="btn btn-light-primary" type="button" onclick="confirmClockIn()">출근</button>
			</form>
			<button class="btn btn-light-danger" id="clockOut" type="button">퇴근</button>
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
	
		

	</script>
	

</body>
</html>