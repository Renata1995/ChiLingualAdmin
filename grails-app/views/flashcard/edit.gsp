<!DOCTYPE html>
<html>
	<body>
		
		<div id="edit-flashcard" class="content scaffold-edit" role="main">
			<h1>Edit Flashcard ${flashcardInstance.symbol}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${flashcardInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${flashcardInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:flashcardInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${flashcardInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
