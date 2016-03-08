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
			<tr id="${questionInstance['questionNo']}"
				class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td>
					${questionInstance['questionNo']}
				</td>
				<td><a class="showQuestion"> ${questionInstance['questionText']}
				</a></td>
				<td><input type="button" value="Edit" class="editQuestion" />
					<g:link class="delete" action="delete" controller="question" 
					params="[questionNo:"${questionInstance['questionNo']}",lessonNo:"${lessonNo}",courseCode:"${courseCode}"]"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
						Delete</g:link>

				</td>
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
		url:"/ChiLingualAdmin/question/edit/",
		data:{position:"questionDialog",courseCode:${courseCode},lessonNo:${lessonNo},questionNo:id},
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
		url:"/ChiLingualAdmin/question/show/",
		data:{courseCode:${courseCode},lessonNo:${lessonNo},questionNo:id},
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