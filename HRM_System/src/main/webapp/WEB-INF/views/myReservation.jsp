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
</head>


 <%@ include file="sidebar.jsp" %>
<body>
	<input type="hidden" id="emp_name" value="${sessionScope.loginVo.name}">
	<input type="hidden" id="emp_id" value="${sessionScope.loginVo.emp_id}">
	<%@ include file="header.jsp" %>
	<div class="content" id="content">
		<div class="main-content">
			<table class="table table-hover">
				<thead>
	            	<tr class="success">
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




<div class="modal fade" id="deleteReserv" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">예약 취소</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="#" >
        	<div class="form-group">
        <label for="room">회의실</label>
        <input id="room" name="room" type="text" value="" readonly>
        <label for="name">이름</label>
        <input id="name" name="name" type="text" value="" readonly>
        <label for="date">날짜</label>
        <input id="date" name="date" type="text" value="" readonly>
        <label for="time">시간</label>
        <input id="time" name="time" type="text" value="" readonly>

        <p>선택한 예약을 취소하시겠습니까?</p>
    </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >뒤로</button>
        <button type="button" class="btn btn-primary" id="delSubmit">확인</button>
      </div>
    </div>
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