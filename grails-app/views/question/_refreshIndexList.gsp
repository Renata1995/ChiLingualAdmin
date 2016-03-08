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
			<tr	class="${(i % 2) == 0 ? 'even' : 'odd'}">
				<td>
					${i+1}
				</td>
				<td><a class="showQuestion"
				onclick='$.ajax({
					data:{questionNo:${questionInstance['questionNo']},
					lessonNo:${questionInstance['lessonNo']},courseCode:${questionInstance['courseCode']}},
					url:"/ChiLingualAdmin/question/show/",
					success:function(data,textStatus){
							$("#questionIndexDialog").html(data);
						},
					error:function(XMLHttpRequest,textStatus,errorThrown){}
					});
				$("#questionIndexDialog").dialog("open");}'
				> ${questionInstance['questionText']}
				</a></td>
				
				<td><g:link controller="lesson" action="show"
						params="[lessonNo:"${questionInstance['lessonNo']}",courseCode:"${questionInstance['courseCode']}"]">
						${questionInstance['lessonNo']}
					</g:link></td>
				
				<td><g:link controller="course" action="show"
						params="[courseCode:"${questionInstance['courseCode']}"]">
						${questionInstance['courseCode']}
					</g:link></td>
				
				<td><input type="button" value="Edit" class="editQuestion" 
					onclick='$.ajax({
						url:"/ChiLingualAdmin/question/edit/",
						data:{position:"questionIndexDialog",questionNo:${questionInstance['questionNo']},
							lessonNo:${questionInstance['lessonNo']},courseCode:${questionInstance['courseCode']}},
						success:function(data,textStatus){
								$("#questionIndexDialog").html(data);
							},
						error:function(XMLHttpRequest,textStatus,errorThrown){}
						});
					$("#questionIndexDialog").dialog("open");'/>
					
					<g:link class="delete" action="deleteOnIndex" controller="question"
					params="[questionNo:"${questionInstance['questionNo']}",
							lessonNo:"${questionInstance['lessonNo']}",courseCode:"${questionInstance['courseCode']}"]"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
							Delete</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<script>
$(function(){
	$("#questionIndexTable").dataTable();
	/*$("#questionIndexTable").on("click",".editQuestion",function(){
		var id=$(this).parents("tr:first").prop("id");
		$.ajax({
			data:{position:"questionIndexDialog"},
			url:"/ChiLingualAdmin/question/edit/"+id,
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
			url:"/ChiLingualAdmin/question/show/"+id,
			success:function(data,textStatus){
					$("#questionIndexDialog").html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#questionIndexDialog").dialog("open");
		});*/
})
</script>
</html>