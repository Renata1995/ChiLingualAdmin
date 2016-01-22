<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'choice', 'error')} required">
	<label for="choice">
		<g:message code="answer.choice.label" default="Choice" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="choice" required="" value="${answerInstance?.choice}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'correct', 'error')} ">
	<label for="correct">
		<g:message code="answer.correct.label" default="Correct" />
		
	</label>
	<g:checkBox name="correct" value="${answerInstance?.correct}" />

</div>

