<!DOCTYPE html>
<html>

<div id="create-course" class="content scaffold-create" role="main">

	<h1>New Course</h1>
	<g:form controller="course">
		<fieldset class="form">
			<div class="fieldcontain  required">
				<label for="courseTitle"> Course Title: <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="courseTitle" required="" value="" />

			</div>

			<div class="fieldcontain required">
				<label for="courseCode"> Course Code: <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="courseCode" required="" value="" />

			</div>
		</fieldset>
		<fieldset class="buttons">
			<g:actionSubmit name="create" action="save"
				value="Create" />
		</fieldset>
	</g:form>
</div>
</html>