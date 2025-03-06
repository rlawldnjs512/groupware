<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="header">
<%
    String currentURI = request.getRequestURI();
%>

   <nav>
        <% if (currentURI.contains("servation")) { %>
        <ul class="nav flex-wrap border-transparent">
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./reservation.do"> 회의실 예약 </a>
                </li>
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./myReservation.do"> 나의 예약조회 </a>
                </li>
            </ul>
        <% } else if (currentURI.contains("notice") || currentURI.contains("free") || currentURI.contains("newNotice")){%>
        	<ul class="nav flex-wrap border-transparent">
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./notice.do"> 공지사항 </a>
                </li>
                <li class="nav-item my-1">
                    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
                       href="./free.do"> 커뮤니티 </a>
                </li>
            </ul>
        <% }%>
</nav>
</div>

