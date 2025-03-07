<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>vacation</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>

	<div class="content" id="content">
	<%@ include file="header.jsp" %>
		<div class="main-content">
		<h3>사원들의 연차 정보 테이블 조회</h3>
		<table class="table table-hover">
			<thead>
				<tr class="success">
					<td>번호</td>
					<td>사원번호</td>
					<td>연차발생일</td>
					<td>연차소멸일</td>
					<td>총연차</td>
					<td>사용한연차</td>
					<td>남은연차</td>
					<td>보상시간</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${lists}" varStatus="vs">
					<tr>
						<td>${vo.leave_id}</td>
						<td>${vo.emp_id}</td>
						<td>${vo.start_date}</td>
						<td>${vo.end_date}</td>
						<td>${vo.leave_total}</td>
						<td>${vo.leave_use}</td>
						<td>${vo.leave_remain}</td>
						<td>${vo.extra_time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>

		<br>
		<br>

		<form action="/insertVacation" method="POST">
			<h3>현재 사원(input value="사원번호")의 연차 등록(insert)</h3>
			<table class="table table-hover">
				<thead>
					<tr class="success">
						<td>leave_id(seq)</td>
						<td>emd_id</td>
						<td>start_date</td>
						<td>end_date</td>
						<td>leave_total</td>
						<td>leave_use</td>
						<td>leave_remain</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="leaveId"></td>
						<td><input type="text" name="empId"></td>
						<td><input type="text" name="startDate"></td>
						<td><input type="text" name="endDate" value="20251231"></td>
						<td><input type="text" name="leaveTotal"></td>
						<td><input type="text" name="leaveUse"></td>
						<td><input type="text" name="leaveRemain"></td>
					</tr>
				</tbody>
			</table>
					<button type="submit" class="btn btn-secondary">연차 정보 저장</button>
		</form>
	</div>
	
</body>
</html>