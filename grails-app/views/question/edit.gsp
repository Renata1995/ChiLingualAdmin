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

	<g:form>
		<fieldset class="form">
			<div class="fieldcontain  required">
				<label for="questionText"> <g:message
						code="question.questionText.label" default="Question Text" /> <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="questionText" required=""
					value="${questionInstance['questionText']}" />
			</div>

			<g:each in="${questionInstance['answers']}" var="answerInstance"
				status="i">
				
				<div class="fieldcontain required">
					<label for="choice"> Choice: </label>
					<g:textField name="${i}" value="${answerInstance['choice']}" />
					
					<label style="margin-left: 15px; width: inherit">Correct: </label>
					<g:checkBox name="correctChecked" value="${i}"
						checked="${answerInstance['correct']=='true'}" />
				</div>
			
			</g:each>

			<g:hiddenField name="courseCode" value="${courseCode}" />
			<g:hiddenField name="lessonNo" value="${lessonNo}" />
			<g:hiddenField name="questionNo"
				value="${questionInstance['questionNo']}" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitToRemote controller="question" action="save"
				update="questionDialog" value="Create" />
		</fieldset>
	</g:form>
</div>