<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<h1>Quiz Questions</h1>
<br />
<g:if test="${flash.message}">
	<div class="message" role="status">
		${flash.message}
	</div>
</g:if>
<table id="questionTable">
	<thead>
		<tr>

			<th>No.</th>
			<th>Question</th>
			<th></th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${list}" status="i" var="questionInstance">
			<tr id="${questionInstance.id}"
				class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td>
					${questionInstance.questionNo}
				</td>
				<td><a class="showQuestion"> ${questionInstance.questionText}
				</a></td>
				<td><g:form url="[resource:questionInstance, action:'delete']"
						method="DELETE">

						<input type="button" value="Edit" class="editQuestion" />
						<g:hiddenField name="lessonId"
							value="${questionInstance.lesson.id}" />
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

					</g:form></td>
			</tr>
		</g:each>
	</tbody>
</table>
<script>
$(function(){
	$("#questionTable").dataTable();
$("#questionTable").on("click",".editQuestion",function(){
	var id=$(this).parents("tr:first").prop("id");
	$.ajax({
		url:"/ChineseWeb/question/edit/"+id,
		data:{position:"questionDialog"},
		success:function(data,textStatus){
				$("#questionDialog").html(data);
			},
		error:function(XMLHttpRequest,textStatus,errorThrown){}
		});
	$("#questionDialog").dialog("open");
	});
$("#questionTable").on("click",".showQuestion",function(){
	var id=$(this).parents("tr:first").prop("id");
	$.ajax({
		url:"/ChineseWeb/question/show/"+id,
		success:function(data,textStatus){
				$("#questionDialog").html(data);
			},
		error:function(XMLHttpRequest,textStatus,errorThrown){}
		});
	$("#questionDialog").dialog("open");
	});
});
</script>
</html>