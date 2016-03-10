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

	<div id="show-course" class="content scaffold-show" role="main">

		<h1>
			${course['courseTitle']}
		</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${
					flash.message
				}
			</div>
		</g:if>

		<!-- Basic Information -->
		<ol class="property-list course">


			<li class="fieldcontain">Title: ${course['courseTitle']}

			</li>



			<li class="fieldcontain">Course Code: ${course['courseCode']}</li>

		</ol>



		<!-- Lesson Table -->
		<g:if test="${lessons}">
			<table id="tableLessons">

				<thead>
					<tr>

						<th>Lesson Number</th>

						<th>Lesson Title</th>

						<th></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${lessons}" status="i" var="lesson">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
								${lesson['lessonNo']}
							</td>

							<td><g:link action="show" controller="lesson"
									id="${lesson['lessonNo']}">
									${lesson['lessonTitle']}
								</g:link></td>

							<td>
								<fieldset class="buttons">
									<g:remoteLink update="lessonDialogOnCourse" class="edit"
										params="[lessonNo:"
										${lesson['lessonNo']}",lessonTitle:"${lesson['lessonTitle']}"]" action="edit"
										controller="lesson">
										<g:message code="default.button.edit.label" default="Edit" />
									</g:remoteLink>
									<g:link controller="lesson" class="delete" action="delete"
										params="[lessonNo:"
										${lesson['lessonNo']}"]" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
										onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</fieldset>
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</g:if>


		<div id="lessonDialogOnCourse"></div>

		<!-- Edit or delete the course -->
		<fieldset class="buttons">
			<g:link class="edit" params="[courseCode:"
				${course['courseCode']}",courseTitle:"${course['courseTitle']}"]" action="edit"
				controller="course">
				<g:message code="default.button.edit.label" default="Edit" />
			</g:link>
			<g:link controller="course" class="delete" action="delete"
				params="[courseCode:"
				${course['courseCode']}"]" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>


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
							url : '/ChiLingualAdmin/lesson/create',
							data:{courseCode:${course['courseCode']}},
							success: function(data, textStatus){
								$("#lessonDialogOnCourse").html(data);
								$("#lessonDialogOnCourse").dialog("open");
								},
							error: function(XMLHttpRequest,textStatus,errorThrown){}
							});
						
							});
					/*$("#tableLessons").on("click",".editLessonIndex",function(){
						var id=$(this).prop("id");
						$.ajax({
							url:"/ChiLingualAdmin/lesson/edit/"+id,
							success:function(data,textStatus){
								$("#lessonDialogOnCourse").html(data);
								$("#lessonDialogOnCourse").dialog("open");
								},
							error:function(XMLHttpRequest,textStatus,errorThrown){}
							
							});
						
						});*/
			})
	</script>
</body>
</html>