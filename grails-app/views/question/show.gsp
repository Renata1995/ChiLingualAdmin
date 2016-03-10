<!DOCTYPE html>
<html>
<div id="show-question" class="content scaffold-show" role="main">
	<h1>
		${questionInstance['questionNo']}.

		${questionInstance['questionText']}
	</h1>

	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>

	<ol style="list-style-type: upper-alpha;">
		<g:each in="${questionInstance['answers']}" status="i" var="a">

			<li class="fieldcontain">
			<g:if test="${a['choice']!=''}">
					<!-- If the answer is not null -->
					<g:if test="${a['correct']=='true'}">
						<b>
							${a['choice']}
						</b>
					</g:if>
					<g:else>
						${a['choice']}
					</g:else>
				</g:if></li>
		</g:each>

	</ol>
	<br>

	<fieldset class="buttons">
		<a class="editQuestionOnShow"> <g:message
				code="default.button.edit.label" default="Edit" />
		</a>
	</fieldset>
</div>
<script>
$(function(){
	$(".editQuestionOnShow").click(function(){
		var position=$("#show-question").parents("div.ui-dialog-content").prop("id");
		$.ajax({
			url:"/ChiLingualAdmin/question/edit/",
			data:{position:position,questionNo:${questionInstance['questionNo']},
				lessonNo:${questionInstance['lessonNo']},courseCode:${questionInstance['courseCode']},
			success:function(data,textStatus){
					$("#show-question").html(data);
				},
				error:function(XMLHttpRequest,textStatus,errorThrwon){}
			});
		});
});
</script>

</html>
