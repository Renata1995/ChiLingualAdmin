<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'flashcard.label', default: 'Flashcard')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
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
	<a href="#list-flashcard" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><a id="newFlashcard" class="create"> New Flashcard </a></li>
		</ul>
	</div>
	<div id="list-flashcard" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table id="tbleFlashcards">
			<thead>
				<tr>
					<th>Symbol</th>
					<th>Pronunciation</th>
					<th>Definition</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${list}" status="i" var="flashcardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${flashcardInstance.id}">
								${fieldValue(bean: flashcardInstance, field: "symbol")}
							</g:link></td>

						<td>
							${fieldValue(bean: flashcardInstance, field: "pronunciation")}
						</td>

						<td>
							${fieldValue(bean: flashcardInstance, field: "definition")}
						</td>

						<td id="${flashcardInstance.id}"><g:form
								controller="flashcard" id="${flashcardInstance.id}">
								<input type="button" class="editFlashcardIndex" value="Edit" />
								<g:actionSubmit class="delete" action="delete" value="Delete"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</g:form></td>

					</tr>
				</g:each>
			</tbody>
		</table>

	</div>
	
	<script>
	
$(function(){
	$('#tbleFlashcards').dataTable();
	$("#flashcardDialog").dialog({
		model:true,
		width:"80%",
		height:$(window).height()*0.8,
		autoOpen:false	
		});
	$("#newFlashcard").click(function(){
		$.ajax({
			url : 'create/',
			success: function(data, textStatus){
				$("#flashcardDialog").html(data);
				},
			error: function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#flashcardDialog").dialog("open");
			});
	$("#tbleFlashcards").on("click",".editFlashcardIndex",
			function(){
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
});
</script>
<div id="flashcardDialog"></div>
</body>
</html>
