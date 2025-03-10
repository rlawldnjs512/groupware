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
        <% } else if (currentURI.contains("notice") || currentURI.contains("free") 
        		|| currentURI.contains("newNotice")
        		|| currentURI.contains("newFree")){%>
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
        <% } else if (currentURI.contains("myPage") || currentURI.contains("certification")
             ||   currentURI.contains("schedule")     ){%>
              <ul class="nav flex-wrap border-transparent">
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                  active"
              href="./mypage.do"> 내 정보 </a></li>
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                    active"
              href="./schedule.do"> 일정 관리 </a></li>
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                    active"
              href="./certification.do"> 증명서 관리 </a></li>
          </ul>
        <% } else if (currentURI.contains("approval") || currentURI.contains("approval_mine") 
            || currentURI.contains("approval_store") || currentURI.contains("signature_manage")
            || currentURI.contains("vacationApproval") || currentURI.contains("tripApproval")
            || currentURI.contains("reportApproval")){%>
              <ul class="nav flex-wrap border-transparent">
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                  active"
              href="./approval.do"> 결재 홈 </a></li>
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                    active"
              href="./approval_mine.do"> 나의 결재 </a></li>
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                    active"
              href="./approval_store.do"> 결재 문서함 </a></li>
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                    active"
              href="./signature_manage.do"> 서명 관리 </a></li>
          </ul>
      <% } else if (currentURI.contains("attendance") || currentURI.contains("vacation")){%>
        	<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
					href="./attendance"> 나의 근태 </a>
				</li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
					href="./vacation"> 휴가 내역 조회 </a>
				</li>
			</ul>
        <% }%>
        <ul>
        
        
        </ul>
        
</nav>
</div>

