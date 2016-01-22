<!DOCTYPE html>
<html>
		<div id="create-lesson" class="content scaffold-create" role="main">
			<h1>Create Lesson ${lessonNo}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${lessonInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${lessonInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="lesson" id="${lessonInstance.id}" >
				<fieldset class="form">
					<g:render template="form"/>
					<g:hiddenField name="lessonNo" value="${lessonNo}"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit name="create" action="save" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
</html>
