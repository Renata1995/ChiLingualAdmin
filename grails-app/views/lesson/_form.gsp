<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'lessonTitle', 'error')} required">
	<label for="lessonTitle">
		<g:message code="lesson.lessonTitle.label" default="Lesson Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lessonTitle" required="" value="${lessonInstance?.lessonTitle}"/>

</div>
<g:hiddenField name="courseId" value="${course?.id}"/>

 