<!DOCTYPE html>
<html>
<div id="create-question" class="content scaffold-create" role="main">
	<h1>
		Create Question
	</h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>	
	<g:form>
		<fieldset class="form">
			<div
				class="fieldcontain required">
				<label for="questionText"> Question Text <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="questionText" required=""
					value="" />
			</div>
			
			<g:each in="${['1','2','3','4','5']}" status="i" var="answer">
			<div class="fieldcontain required">
			<label for="choice">
				Choice: 
			 </label> 
			 <g:textField name="${answer}" value=""/>
			<label  style="margin-left:15px;width:inherit">Correct: </label><g:checkBox name="correctChecked" value="${answer}" checked="false"/>
			</div>
			</g:each>
			
			<g:hiddenField name="courseCode" value="${courseCode}" />
			<g:hiddenField name="lessonNo" value="${lessonNo}" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitToRemote controller="question" action="save" update="questionDialog"
				value="Create" />
		</fieldset>
	</g:form>
</div>
</html>
