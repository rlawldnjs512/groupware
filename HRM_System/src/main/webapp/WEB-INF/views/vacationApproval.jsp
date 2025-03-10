<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
:root {
	--bs-white: #fff;
	--bs-primary: #1b84ff;
	--bs-primary-light: #e9f3ff;
	--bs-success: #17c653;
	--bs-success-light: #dfffea;
	--bs-secondary: #252f4a;
	--bs-secondary-light: #f9f9f9;
	--bs-warning: #f6c000;
	--bs-warning-light: #fff8dd;
}

.btn.btn-light-success {
	color: var(--bs-success);
	border-color: var(--bs-success-light);
	background-color: var(--bs-success-light);
}

.btn.btn-light-success:hover {
	color: var(--bs-white);
	border-color: var(--bs-success);
	background-color: var(--bs-success);
}

.btn.btn-light-success:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-success), 0.5);
}

.btn.btn-light-secondary {
	color: var(--bs-secondary);
	border-color: var(--bs-secondary-light);
	background-color: var(--bs-secondary-light);
}

.btn.btn-light-secondary:hover {
	color: var(--bs-white);
	border-color: var(--bs-secondary);
	background-color: var(--bs-secondary);
}

.btn.btn-light-secondary:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-secondary), 0.5);
}

.btn.btn-light-primary {
	color: var(--bs-primary);
	border-color: var(--bs-primary-light);
	background-color: var(--bs-primary-light);
}

.btn.btn-light-primary:hover {
	color: var(--bs-primary-white);
	border-color: var(--bs-primary);
	background-color: var(--bs-primary);
}

.btn.btn-light-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-primary), 0.5);
}

.btn.btn-light-warning {
	color: var(--bs-warning);
	border-color: var(--bs-warning-light);
	background-color: var(--bs-warning-light);
}

.btn.btn-light-warning:hover {
	color: var(--bs-white);
	border-color: var(--bs-warning);
	background-color: var(--bs-warning);
}

.btn.btn-light-warning:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-warning), 0.5);
}

</style>
<style type="text/css">

</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	<div class="content" id="content">
        <%@ include file="header.jsp"%>
		<div class="main-content">
		
			<div style="display: flex;">
			    <!-- 왼쪽 버튼 컨테이너 -->
			    <div style="display: flex; flex-direction: column; gap: 10px; margin: 20px;">
			    	<button type="button" class="btn btn-light-success" 
			    		style="width: 100%; margin-bottom: 10px;">결재선 선택</button>
			    	<button type="button" class="btn btn-light-warning" 
			    		style="width: 100%; margin-bottom: 10px;"
			    		onclick="/vacationSave.do">임시 저장</button>
			    	<button type="button" class="btn btn-light-info" 
			    		style="width: 100%; margin-bottom: 10px;" onclick="history.back(-1)">취소</button>
			    	<button type="button" class="btn btn-light-secondary" 
			    		style="width: 100%; margin-bottom: 10px;">상신 하기</button>
				</div>
				<div>
					<span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;
							">
						<span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
							<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
								<colgroup>
									<col width="310">
									<col width="490">
								</colgroup>
								<tbody>
									<tr>
										<td style="padding: 0px !important; border: 0px currentColor; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
											colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											휴&nbsp;가&nbsp;원<br>
										<br type="_moz">
										</td>
									</tr>
									<tr>
										<td style="padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
											<table style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
												<colgroup>
													<col width="90">
													<col width="120">
												</colgroup>
												<tbody>
													<tr>
														<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
															소속부서</td>
														<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
															<span unselectable="on" contenteditable="false"
																	class="comp_wrap" data-cid="9"
																	data-dsl="{{label:draftDept}}" data-wrapper=""
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																	data-value="" data-autotype="">
																		<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																			${loginVo.dept_name}</span>
																		<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																			<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																		</span>
																		<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"
																				style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																			<a contenteditable="false"
																				class="ic_prototype ic_prototype_trash"
																				data-content-protect-cover="true"
																				data-component-delete-button="true"></a>
																		</span> 
															</span><br>
														</td>
													</tr>
													<tr style="height: 32px;">
														<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
															직&nbsp;&nbsp;&nbsp;&nbsp;급</td>
														<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
															<span unselectable="on" contenteditable="false"
																	class="comp_wrap" data-cid="10"
																	data-dsl="{{label:position}}" data-wrapper=""
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																	data-value="" data-autotype="">
																<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																	${loginVo.position}</span>
																<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																	<span class="Active_dot1"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot2"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot3"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot4"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																</span> 
																<span contenteditable="false" class="comp_hover"
																	  data-content-protect-cover="true" data-origin="10"
																	  style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																	<a contenteditable="false"
					  												class="ic_prototype ic_prototype_trash"
																	data-content-protect-cover="true"
																	data-component-delete-button="true"></a>
																</span> 
															</span><br>
														</td>
													</tr>
													<tr>
														<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
															성&nbsp;&nbsp;&nbsp;&nbsp;명</td>
														<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
															<span unselectable="on" contenteditable="false"
																  class="comp_wrap" data-cid="11"
															      data-dsl="{{label:draftUser}}" data-wrapper=""
															      style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
															      data-value="" data-autotype="">
															      <span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																	${loginVo.name}</span>
																  <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																	<span class="Active_dot1"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot2"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot3"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	<span class="Active_dot4"
																	style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																	</span> 
																	<span contenteditable="false" class="comp_hover"
																			data-content-protect-cover="true" data-origin="11"
																			style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																		<a contenteditable="false"
																		class="ic_prototype ic_prototype_trash"
																		data-content-protect-cover="true"
																		data-component-delete-button="true"></a>
																	</span> 
															</span><br>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td style="padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
											<div>
												<table>
													<tbody>
														<tr>
															<td rowspan="3" style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
																신청
															</td>
															<td rowspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<span unselectable="on" contenteditable="false"
																		class="comp_wrap" data-cid="9"
																		data-dsl="{{label:draftDept}}" data-wrapper=""
																		style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																		data-value="" data-autotype="">
																			<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																			<img id="signatureImage" src="${signSaved}" width="80" height="75"
																			style="border: 1px solid black;;" />	
																			</span>
																			<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			</span>
																			<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"
																					style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<a contenteditable="false"
																					class="ic_prototype ic_prototype_trash"
																					data-content-protect-cover="true"
																					data-component-delete-button="true"></a>
																			</span> 
																</span><br>
															</td>
															<td rowspan="3" style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
																결재자
															</td>
															<td rowspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<span unselectable="on" contenteditable="false"
																		class="comp_wrap" data-cid="9"
																		data-dsl="{{label:draftDept}}" data-wrapper=""
																		style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																		data-value="" data-autotype="">
																			<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				결재자1</span>
																			<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			</span>
																			<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"
																					style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<a contenteditable="false"
																					class="ic_prototype ic_prototype_trash"
																					data-content-protect-cover="true"
																					data-component-delete-button="true"></a>
																			</span> 
																</span><br>
															</td>
															<td rowspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<span unselectable="on" contenteditable="false"
																		class="comp_wrap" data-cid="9"
																		data-dsl="{{label:draftDept}}" data-wrapper=""
																		style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																		data-value="" data-autotype="">
																			<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				결재자2</span>
																			<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			</span>
																			<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"
																					style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<a contenteditable="false"
																					class="ic_prototype ic_prototype_trash"
																					data-content-protect-cover="true"
																					data-component-delete-button="true"></a>
																			</span> 
																</span><br>
															</td>
															<td rowspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
																<span unselectable="on" contenteditable="false"
																		class="comp_wrap" data-cid="9"
																		data-dsl="{{label:draftDept}}" data-wrapper=""
																		style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
																		data-value="" data-autotype="">
																			<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				결재자3</span>
																			<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																				<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
																			</span>
																			<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"
																					style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
																				<a contenteditable="false"
																					class="ic_prototype ic_prototype_trash"
																					data-content-protect-cover="true"
																					data-component-delete-button="true"></a>
																			</span> 
																</span><br>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
		
							<table style="border: 2px solid; rgb (0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
								<colgroup>
									<col width="200">
									<col width="600">
								</colgroup>
								<tbody>
								    <!-- 제목 -->
								    <tr>
								        <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; width: 100px;">
								            제&nbsp;&nbsp;&nbsp;&nbsp;목
								        </td>
								        <td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
								            <input type="text" id="title" name="title">
								        </td>
								    </tr>
								    
								    <!-- 종류 선택 -->
								    <tr>
								        <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; width: 100px;">
								            종&nbsp;&nbsp;&nbsp;&nbsp;류
								        </td>
								        <td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
								            <input class="editor_opt" type="radio" name="leave_type" value="연차">
								            <label class="editor_label">오전반차</label>
								            <input class="editor_opt" type="radio" name="leave_type" value="공가">
								            <label class="editor_label">오후반차</label>
								            <input class="editor_opt" type="radio" name="leave_type" value="경조">
								            <label class="editor_label">연차</label>
								        </td>
								    </tr>
								
								    <tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border:1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
											
											기&nbsp;&nbsp;&nbsp;&nbsp;간
										</td>
										<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; border: 1px solid black; height: 18px; text-align:left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
											<span unselectable="on" contenteditable="false" class="comp_wrap" 
													data-cid="3" data-dsl="{{period}}" data-wrapper="" 
													style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; 
													font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 
													data-value="">
												<input class="ipt_editor ipt_editor_date" type="date"> ~ 
												<input class="ipt_editor ipt_editor_date" type="date">
												<span contenteditable="false" class="comp_active" style="display: none; 
														font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; 
														font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
													<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span>
													<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span> 
													<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span>
													<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span> 
												</span> 
												<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" 
														data-origin="3" style="font-family: &quot;malgun gothic&quot;, 
														dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
														margin-top: 0px; margin-bottom: 0px;"> 
													<a contenteditable="false" class="ic_prototype ic_prototype_trash" 
														data-content-protect-cover="true" data-component-delete-button="true"></a> 
												</span> 
											</span>&nbsp; 
											<span unselectable="on" contenteditable="false" class="comp_wrap" 
													data-cid="4" data-dsl="{{text$width:80$}}" data-wrapper="" 
													style="width: 80px; font-family: &quot;malgun gothic&quot;, 
													dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
													margin-top: 0px; margin-bottom: 0px;" data-value="">
												<input class="ipt_editor" type="text">
												<span contenteditable="false" class="comp_active" "="" style="display: none; 
														font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; 
														font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
													<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span>
													<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span> 
													<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span>
													<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, 
															dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
															margin-top: 0px; margin-bottom: 0px;"></span>
												</span> 
												<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" 
														data-origin="4" style="font-family: &quot;malgun gothic&quot;, 
														dotum, arial, tahoma; font-size: 9pt; line-height: normal; 
														margin-top: 0px; margin-bottom: 0px;"> 
													<a contenteditable="false" class="ic_prototype ic_prototype_trash" 
														data-content-protect-cover="true" data-component-delete-button="true"></a> 
												</span> 
											</span>&nbsp;일간
										</td>
									</tr>
								
								    <!-- 사유 -->
								    <tr>
								        <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle; width: 100px;">
								            사&nbsp;&nbsp;&nbsp;&nbsp;유
								        </td>
								        <td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; 
								            color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
								            <textarea class="txta_editor" name="content" style="width: 100%; height: 40px;"></textarea>
								        </td>
								    </tr>
								
								</tbody>
							</table>
							
						</span>
					</span>
					<p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
						<br>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>