<!DOCTYPE html>
<div id="edit-question" class="content scaffold-edit" role="main">
	<h1>
		Edit Question
		${questionInstance.questionNo}
	</h1>

	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>

	<g:hasErrors bean="${questionInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${questionInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>

	<g:form>
		<g:hiddenField name="version" value="${questionInstance?.version}" />

		<fieldset class="form">
			<div
				class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionText', 'error')} required">
				<label for="questionText"> <g:message
						code="question.questionText.label" default="Question Text" /> <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="questionText" required=""
					value="${questionInstance?.questionText}" />
			</div>

			<g:each in="${questionInstance.answers}" var="answerInstance"
				status="i">
				<div
					class="fieldcontain ${hasErrors(bean: answerInstance, field: 'choice', 'error')} required" id="answer${answerInstance.id}">
					<label for="choice"> <g:message code="answer.choice.label"
							default="Choice" />
					</label>
					<g:textField name="${answerInstance.id}"
						value="${answerInstance?.choice}" />
						<label style="margin-left:15px;width:inherit"> Correct:  </label>
					<g:if test="${answerInstance.correct}">
						<g:checkBox name="correct" value="${answerInstance.id}"
							checked="true" />
					</g:if>
					<g:else>
						<g:checkBox name="correct" value="${answerInstance.id}"
							checked="false" />
					</g:else>
					
					<button type="button" class="btn btn-danger deleteAnswer">
						<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					</button>
					
				</div>
			</g:each>
			<div id="newAnswer"></div>
			<div id="noMoreAnswer" style="display:none">No More than 5 Answers</div>
		</fieldset>
		<fieldset class="buttons">
			<g:submitToRemote class="updateQuestion" id="${questionInstance.id}" controller="question"
				update="${position}" action="update" type="button" value="Update" />
			<a id="addAnswer">Add An Answer</a>
		</fieldset>
	</g:form>
</div>
<script>
var textFieldCount=${questionInstance.answers.size()};
var newAnswerCount=0;
function deleteAnswer(){
	textFieldCount--;
	$(this).parents("div:first").hide();
	var textField=$(this).parents("div:first").children("input:text");
	textField.val("");
	$("#noMoreAnswer").hide();
}
	$(function(){
		$("#addAnswer").click(function(){
			if(textFieldCount<5){
					$.ajax({
						url:"/ChineseWeb/question/_addAnswer",
						data:{newAnswer:newAnswerCount},
						success:function(data,textStatus){
							$("#newAnswer").append(data);
							},
						error:function(XMLHttpRequest,textStatus,errorThrown){}
						});
					//$("#newAnswer").append("<div class='fieldcontain'><label for='choice'><g:message code='answer.choice.label' default='Choice' /></label><g:textField name='newAnswer' value='' /><label style='margin-left: 15px; width: inherit' for='correct'>Correct: </label><g:checkBox name='newAnswerCorrect' value='' checked='false' /><button type='button' class='btn btn-danger deleteNewAnswer' ><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button></div>");
					textFieldCount++;
					newAnswerCount++;
					}else{
						$("#noMoreAnswer").show()
					}				
			});
		$(".deleteAnswer").click(deleteAnswer);
		});
</script>


