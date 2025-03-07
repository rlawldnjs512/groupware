<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<%@ include file="sidebar.jsp"%>
<body>

	<div class="content" id="content">
		<%@ include file="header.jsp"%>
		<div class="main-content">
			<div id="jstree">
				<ul>
					<li>Root node 1
						<ul>
							<li id="child_node_1">Child node 1</li>
							<li>Child node 2</li>
						</ul>
					</li>
					<li>Root node 2
						<ul>
							<li id="child_node_2">Child node 1</li>
							<li>Child node 2</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>



<script>
       

$(function () {

    const schoolData = 
    
    $('#jstree').jstree({
        'core': {
            'data': schoolData
        }
    });

    $('#jstree').on("changed.jstree", function (e, data) {
        console.log("선택된 노드:", data.selected);
    });

    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('student_1'); 
        $('#jstree').jstree(true).select_node('class_1_1'); 
    });
});

    </script>
	

</body>
</html>