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
        		|| currentURI.contains("newFree")
				|| currentURI.contains("modifyNotice")
				|| currentURI.contains("modifyFree")
				|| currentURI.contains("replyFree")){%>
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
            <li class="nav-item my-1">
            	<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 active"
             		 href="./mypage.do"> 내 정보 </a>
            </li>
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
            || currentURI.contains("approval_pending") || currentURI.contains("signature_manage")
            || currentURI.contains("vacationApproval") || currentURI.contains("tripApproval")
            || currentURI.contains("reportApproval") || currentURI.contains("approval_receive")
            || currentURI.contains("temp_store") || currentURI.contains("dept_store")){%>
              <ul class="nav flex-wrap border-transparent">
            <li class="nav-item my-1"><a
              class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
                  active"
              href="./approval.do"> 결재 홈 </a></li>
            <li class="nav-item my-1 dropdown">
			    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 dropdown-toggle"
			       href="#" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			       내 결재
			    </a>
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			        <li><a class="dropdown-item" href="./approval_pending.do">결재 대기함</a></li>
			        <li><a class="dropdown-item" href="./approval_receive.do">결재 수신함</a></li>
			        <li><a class="dropdown-item" href="./approval_mine.do">내 결재함</a></li>
			    </ul>
			</li>
            <li class="nav-item my-1 dropdown">
			    <a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1 dropdown-toggle"
			       href="#" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			       결재 문서함
			    </a>
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			        <li><a class="dropdown-item" href="./temp_store.do">임시 문서함</a></li>
			        <li><a class="dropdown-item" href="./dept_store.do">부서 문서함</a></li>
			    </ul>
			</li>
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
        
</nav>
</div>
<!-- Bootstrap JS 로드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>