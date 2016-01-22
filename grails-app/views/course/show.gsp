<!-- Detailed information about the current course -->
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>course.courseTitle</title>
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
			<li><g:link class="list" controller="course" action="index">Course List</g:link></li>
			<li><a id="newLesson" class="create">New Lesson</a></li>
		</ul>
	</div>
	<!-- nav -->

	<g:hasErrors bean="${course}">
	<ul class="errors" role="alert">
		<g:eachError bean="${course}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>${error.field} has error</li>
		</g:eachError>
	</ul>
	</g:hasErrors>

	<div id="show-course" class="content scaffold-show" role="main">

		<h1>
			${course['courseTitle']}
		</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<!-- Basic Information -->
		<ol class="property-list course">

			
				<li class="fieldcontain">Title: ${course['courseTitle']}

				</li>
			

			
				<li class="fieldcontain">Course Code: ${course['courseCode']}</li>
			
		</ol>



		<!-- Lesson Table -->
		
			<table id="tableLessons">

				<thead>
					<tr>

						<th>Lesson Number</th>

						<th>Lesson Title</th>

						<th></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${lessonList}" status="i" var="lesson">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
									${lesson['lessonNo']}
								</td>

							<td><g:link action="show" controller="lesson"
									id="${lesson['id']}">
								${lesson['lessonTitle']}
								</g:link>
							</td>

							<td><g:form controller="lesson" id="${lesson['id']}"
									method="DELETE">

									<input type="button" class="edit editLessonIndex" id="${lesson['id']}" value="Edit">
									
									<g:actionSubmit class="delete" action="delete"
										value="${message(code: 'default.button.delete.label', default: 'Delete')}"
										onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

								</g:form></td>

						</tr>
					</g:each>
				</tbody>
			</table>
		

		<div id="lessonDialogOnCourse"></div>

		<!-- Edit or delete the course -->
		<g:form url="[resource:course, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:remoteLink class="edit" update="show-course" action="edit" params="[courseCode:"${course.get('courseCode')}"]">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:remoteLink>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>


	</div>
	<script>
			$(function() {
				$('#tableLessons').dataTable();
				$("#lessonDialogOnCourse").dialog({
						model:true,
						width:"80%",
						height:$(window).height()*0.8,
						autoOpen:false	
						});
					$("#newLesson").click(function(){
						$.ajax({
							url : '/ChineseWeb/lesson/create',
							data:{courseId:${course['id']}},
							success: function(data, textStatus){
								$("#lessonDialogOnCourse").html(data);
								$("#lessonDialogOnCourse").dialog("open");
								},
							error: function(XMLHttpRequest,textStatus,errorThrown){}
							});
						
							});
					$("#tableLessons").on("click",".editLessonIndex",function(){
						var id=$(this).prop("id");
						$.ajax({
							url:"/ChineseWeb/lesson/edit/"+id,
							success:function(data,textStatus){
								$("#lessonDialogOnCourse").html(data);
								$("#lessonDialogOnCourse").dialog("open");
								},
							error:function(XMLHttpRequest,textStatus,errorThrown){}
							
							});
						
						});
			})
	</script>
</body>
</html>