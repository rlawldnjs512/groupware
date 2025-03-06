<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<meta charset="UTF-8">
	<title>근태관리</title>
	<script type="text/javascript" src="./js/attendance.js"></script>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	
	<div class="content" id="content">
	
		<div class="header">
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active"
					href="./attendance"> 나의 근태 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="./vacation"> 휴가 내역 조회 </a></li>
			</ul>
		</div>
		
		
		<div class="main-content">
		
			<div class="col-sm-6 col-xl-2 mb-xl-10">
        
				<!--begin::Card widget 2-->
				<div class="card h-lg-100">
				    <!--begin::Body-->
				    <div class="card-body d-flex justify-content-between align-items-start flex-column">         
				        <!--begin::Icon--> 
				        <div class="m-0">
				                            <img src="/keen/demo1/assets/media/svg/brand-logos/instagram-2-1.svg" class="w-35px" alt="">   
				                       
				        </div>                           
				        <!--end::Icon-->
				
				        <!--begin::Section--> 
				        <div class="d-flex flex-column my-7">
				            <!--begin::Number-->           
				            <span class="fw-semibold fs-3x text-gray-800 lh-1 ls-n2">320k</span> 
				            <!--end::Number--> 
				
				            <!--begin::Follower-->
				            <div class="m-0">
				            	<span class="fw-semibold fs-6 text-gray-500">Followers</span>                
				            </div>       
				            <!--end::Follower--> 
				        </div>  
				        <!--end::Section-->          
				        
				        <!--begin::Badge--> 
				        <span class="badge badge-light-success fs-base">
				                            <i class="ki-duotone ki-arrow-up fs-5 text-success ms-n1"><span class="path1"></span><span class="path2"></span></i> 
				                                       
				            2.1%
				        </span>  
				        <!--end::Badge-->                              
				    </div>
				    <!--end::Body-->
				</div>
				<!--end::Card widget 2-->


     		</div>
		
		
		
		
			
		</div>
		
		
		
		
		
		
	</div>	

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