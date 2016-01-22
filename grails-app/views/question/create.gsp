<!DOCTYPE html>
<html>
<div id="create-question" class="content scaffold-create" role="main">
	<h1>
		Create Question
		${questionNo}
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
			
			<g:each in="${['1','2','3','4','5']}" status="i" var="answer">
			<div class="fieldcontain required">
			<label for="choice">
				<g:message code="answer.choice.label" default="Choice" />
			 </label> <g:textField name="${answer}" value=""/>
			<label  style="margin-left:15px;width:inherit">Correct: </label><g:checkBox name="correctChecked" value="${answer}" checked="false"/>
			</div>
			</g:each>
			
			<g:hiddenField name="questionNo" value="${questionNo}" />
			<g:hiddenField name="lesson" value="${lessonInstance.id}" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitToRemote controller="question" action="save" id="${questionInstance.id}" update="questionDialog"
				value="Create" />
		</fieldset>
	</g:form>
</div>
</html>
