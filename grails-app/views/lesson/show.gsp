<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>
	${lessonInstance.lessonTitle}
</title>
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
	<a href="#show-lesson" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>

	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" controller="course" action="show"
					id="${course.id}">Lesson List</g:link></li>
			<li><g:link controller="question" id="${lessonInstance.id}" action="list">Quiz Questions</g:link></li>
		</ul>
	</div>
	<!-- nav -->


	<div id="show-lesson" class="content scaffold-show" role="main">
		<h1>
			<g:if test="${lessonInstance?.lessonNo}">
			Lesson ${lessonInstance.lessonNo}  
			</g:if>
			<g:if test="${lessonInstance?.lessonTitle}">
			${lessonInstance.lessonTitle }
			</g:if>
		</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<br/>
		<div id="tbleAjax">
			<g:if test="${lessonInstance?.flashcards}">
				<table id="tbleFlashcardsLesson">
					<thead>
						<tr>
							<th>Symbol</th>
							<th>Pronunciation</th>
							<th>Definition</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${lessonInstance.flashcards}" status="i"
							var="flashcardInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link controller="flashcard" action="show"
										id="${flashcardInstance.id}">
										${fieldValue(bean: flashcardInstance, field: "symbol")}
									</g:link></td>

								<td>
									${fieldValue(bean: flashcardInstance, field: "pronunciation")}
								</td>

								<td>
									${fieldValue(bean: flashcardInstance, field: "definition")}
								</td>

								<td id="${flashcardInstance.id}"><g:form
										controller="lesson" id="${flashcardInstance.id}">

										<input type="button" value="Remove"
											onclick="
											$.ajax({
											type:'POST',
												url:'/ChiLingualAdmin/lesson/deleteFlashcard',
									
												data: {
													lessonId: ${lessonInstance.id},
													flashcardId: ${flashcardInstance.id}
												},
												success:function(data,textStatus){
													jQuery('#tbleAjax').html(data);
													},
												error:function(XMLHttpRequest,textStatus,errorThrown){
												}
												
											});
											return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</g:form></td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
		</div>
		<input
			onclick="
			showAddFlashcardPanel();
			jQuery.ajax({
				type:'POST',
				url:'/ChiLingualAdmin/lesson/_tableFlashcard',
				data: {
					lessonId: ${lessonInstance.id}
				},
				success:
					function(data,textStatus){
						jQuery('#panelAddFlashcard').html(data);
					},
				error:
					function(XMLHttpRequest,textStatus,errorThrown){
					}});
			return false"
			type="button" class="create btn btn-default" value="Add Flashcard">

		<div id="panelAddFlashcard"></div>
		<div id="flashcardDialog"></div>

		<div>
			<br>
		</div>

		<g:form url="[resource:lessonInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:remoteLink class="edit" action="edit" id="${lessonInstance.id }"
					update="show-lesson" controller="lesson">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:remoteLink>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
	<script>
			function showAddFlashcardPanel(){
				$( "#panelAddFlashcard").dialog({
				 	 title: "Add Flashcard",
				 	 resizable: false, 
				 	 modal: true,
					 resizable: false,
					 height: 600,
					 width: 700,
				});
			}
			
			$(function() {
				$('#tbleFlashcardsLesson').dataTable();
				$(".editFlashcardIndex").click(function(){
					var id=$(this).parents("td:first").prop("id");
					$.ajax({
						url:"edit/"+id,
						success:function(data,textStatus){
							$("#flashcardDialog").html(data);
							},
						error:function(XMLHttpRequest,textStatus,errorThrown){}
						
						});
					$("#flashcardDialog").dialog("open");
					});
			})
			
	</script>
</body>
</html>
