 <!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Course Table</title>
<script
	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
</head>
<body>
	
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><a id="newCourse" class="create"> New Course </a></li>
		</ul>
	</div>
	<div id="list-course" class="content scaffold-list" role="main">
		<h1 class="pageTitle">Course Table</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<hr/><br/>
		<table id ="tableCourses">
			<thead>
				<tr>

					<th>Title</th>

					<th>Course Code</th>

					<th></th>


				</tr>
			</thead>

			<tbody>
				<g:each in="${list}" status="i" var="course">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" params="[course:"${course['courseCode']}"]">
								${course['courseTitle']}
							</g:link></td>

						<td>
							${course['courseCode']}
						</td>

						<td id="${course['courseCode']}">
						<input type="button" class="editCourseIndex" value="Edit"/>
						<g:link class="deleteButton" controller="course" params="[courseCode:"${course['courseCode']}"]" class="delete" action="delete"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
								Delete</g:link>
						</td>

					</tr>
				</g:each>
				
			</tbody>
		</table>

	</div>
	<div id="courseDialog"></div>
	<script>
	
$(function(){
	$('#tableCourses').dataTable();
	$("#courseDialog").dialog({
		model:true,
		width:"80%",
		height:$(window).height()*0.8,
		autoOpen:false	
		});
	$("#newCourse").click(function(){
		$.ajax({
			url : '/ChiLingualAdmin/course/create',
			success: function(data, textStatus){
				$("#courseDialog").html(data);
				},
			error: function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#courseDialog").dialog("open");
			});
	$("#tableCourses").on("click",".editCourseIndex",function(){
		var courseCode=$(this).parents("td:first").prop("id");
		alert(courseCode);
		$.ajax({
			url:"/ChiLingualAdmin/course/edit/",
			data:{courseCode:courseCode},
			success:function(data,textStatus){
				$("#courseDialog").html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){
				alert(errorThrown);
				}
			
			});
		$("#courseDialog").dialog("open");
		});
});
</script>
</body>

</html>