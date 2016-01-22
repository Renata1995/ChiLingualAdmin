<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'choice', 'error')} required">
	<label for="choice"> <g:message code="answer.choice.label"
			default="Choice" /></label>
	<g:textField name="newAnswer" value="" />
	<label style="margin-left: 15px; width: inherit" for="correct">
		Correct: </label>
	<g:checkBox name="newAnswerCorrect" value="${newAnswer}" checked="false" />
	<button type="button" class="btn btn-danger deleteNewAnswer" >
		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	</button>
</div>
<script>
	$(function(){
		$(".deleteNewAnswer").click(function(){
			textFieldCount--;
			$(this).parents("div:first").hide();
			$(this).parents("div:first").children("input:text").val("");
			$("#noMoreAnswer").hide();
		});
	});
</script>
</html>