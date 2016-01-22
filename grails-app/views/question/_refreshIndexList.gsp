<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<h1>Questions List</h1>
<br />
<g:if test="${flash.message}">
	<div class="message" role="status">
		${flash.message}
	</div>
</g:if>
<table id="questionIndexTable">
	<thead>
		<tr>
			<th>No.</th>
			<th>Question</th>
			<th>Lesson</th>
			<th>Course</th>
			<th></th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${list}" status="i" var="questionInstance">
			<tr id="${questionInstance.id}"
				class="${(i % 2) == 0 ? 'even' : 'odd'}">
				<td>
					${i+1}
				</td>
				<td><a class="showQuestion">
						${questionInstance.questionText}
				</a></td>
				<td><g:link controller="lesson" action="show"
						id="${questionInstance.lesson.id}">
						${questionInstance.lesson.lessonTitle}
					</g:link></td>
				<td><g:link controller="course" action="show"
						id="${questionInstance.lesson.course.id}">
						${questionInstance.lesson.course.courseTitle}
					</g:link></td>
				<td><g:form controller="question" id="${questionInstance.id}"
						method="DELETE">

						<input type="button" value="Edit" class="editQuestion" />
						<g:actionSubmit class="delete" action="deleteOnIndex"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

					</g:form></td>
			</tr>
		</g:each>
	</tbody>
</table>
<script>
$(function(){
	$("#questionIndexTable").dataTable();
	$("#questionIndexTable").on("click",".editQuestion",function(){
		var id=$(this).parents("tr:first").prop("id");
		$.ajax({
			data:{position:"questionIndexDialog"},
			url:"/ChineseWeb/question/edit/"+id,
			success:function(data,textStatus){
					$("#questionIndexDialog").html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#questionIndexDialog").dialog("open");
		});
	$("#questionIndexTable").on("click",".showQuestion",function(){
		var id=$(this).parents("tr:first").prop("id");
		$.ajax({
			url:"/ChineseWeb/question/show/"+id,
			success:function(data,textStatus){
					$("#questionIndexDialog").html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#questionIndexDialog").dialog("open");
		});
})
</script>
</html>