<!DOCTYPE html>
<html>
<div id="edit-course" class="content scaffold-edit" role="main">
	<h1>
		Edit ${courseTitle}
	</h1>

	<g:form controller="course" method="PUT">
		<fieldset class="form">
			<div class="fieldcontain  required">
				<label for="courseTitle"> Course Title: <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="courseTitle" required="" value="${courseTitle}" />
				<g:hiddenField name="courseCode" value="${courseCode}"/>
			</div>

		</fieldset>
		<fieldset class="buttons">
			<g:actionSubmit class="save" action="update"
				value="${message(code: 'default.button.update.label', default: 'Update')}" />
		</fieldset>
	</g:form>
</div>
</html>