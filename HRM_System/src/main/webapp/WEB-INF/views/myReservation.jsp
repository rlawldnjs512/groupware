<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<link rel="stylesheet" href="./css/emplist.css">
<style type="text/css">
tr, td {
	text-align: center;	
	vertical-align: middle;
}
</style>
</head>
 <%@ include file="sidebar.jsp" %>
<body>
	<input type="hidden" id="emp_name" value="${sessionScope.loginVo.name}">
	<input type="hidden" id="emp_id" value="${sessionScope.loginVo.emp_id}">
	<div class="content" id="content">
	<%@ include file="header.jsp" %>
		<div class="main-content">
			<table class="table table-hover">
				<thead>
	            	<tr>
						<td>예약번호</td>
						<td>회의실 이름</td>
						<td>사원번호</td>
						<td>예약자 이름</td>
						<td>예약날짜</td>
						<td>예약시간</td>
						<td></td>
					</tr>
	            </thead>
				
				<tbody>
					<c:forEach var="room" items="${lists}" varStatus="vs">
						<c:forEach var="reserv" items="${room.reservation}" varStatus="vs">
							<tr>
								<td>${reserv.reserv_id}</td>
								<td>${room.room_name}</td>
								<td>${reserv.emp_id}</td>
								<td>${reserv.name}</td>
								<td>${reserv.rev_date}</td>
								<td>${reserv.range}</td>
								<td>
									<form action="./deleteReservation.do" method="post" onsubmit="return confirmCancel()">
									    <input type="hidden" name="reserv_id" value="${reserv.reserv_id}">
									    <input type="hidden" name="emp_id" value="${reserv.emp_id}">
									    <button type="submit" class="btn btn-danger">취소</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script>
function confirmCancel() {
    if (confirm("정말 예약을 취소하시겠습니까?")) {
        alert("취소되었습니다.");
        return true;
    }
    return false;
}
</script>

</body>
</html>