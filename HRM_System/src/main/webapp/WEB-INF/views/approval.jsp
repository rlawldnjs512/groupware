<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>전자결재</title>
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
			
			table {
				width: 100%;
				border-collapse: collapse;
			}
			th, td {
				border: 1px solid #ccc;
				padding: 10px;
				text-align: left;
			}
			th {
				background-color: #f0f0f0;
			}
			.gray {
				background-color: #ddd;
			}	
			.main-content {
			  position: relative;
			  width: 100%;
			  padding-top: 20px; /* 위쪽 여백 추가 */
			  text-align: center; /* 버튼 가운데 정렬 */
			}
			.button-container {
			  display: flex;
			  justify-content: center; /* 가로 중앙 정렬 */
			  gap: 20px; /* 버튼 간격 */
			  margin-bottom: 20px; /* 아래쪽 여백 */
			}
			.button-container button {
			  flex: 1; /* 버튼 크기를 동일하게 확장 */
			  max-width: 300px; /* 버튼 최대 너비 설정 */
			  height: 60px; /* 버튼 높이 */
			  font-size: 18px; /* 글자 크기 */
			  font-weight: bold; /* 글자 굵게 */
			}
	    </style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp"%>
		<div class="main-content">
		  <div class="button-container">
		    <button type="button" class="btn btn-light-success" 
		    		onclick="location.href='/vacationForm.do'">휴가 결재하기</button>
		    <button type="button" class="btn btn-light-secondary" 
		    		onclick="location.href='/tripForm.do'">출장 결재하기</button>
		    <button type="button" class="btn btn-light-warning" 
		    		onclick="location.href='/reportForm.do'">보고서 결재하기</button>
		  </div>
		</div>
    </div>
</body>
</html>
