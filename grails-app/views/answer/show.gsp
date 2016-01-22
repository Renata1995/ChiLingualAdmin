
<%@ page import="chineseweb.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-answer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answer">
			
				<g:if test="${answerInstance?.choice}">
				<li class="fieldcontain">
					<span id="choice-label" class="property-label"><g:message code="answer.choice.label" default="Choice" /></span>
					
						<span class="property-value" aria-labelledby="choice-label"><g:fieldValue bean="${answerInstance}" field="choice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.correct}">
				<li class="fieldcontain">
					<span id="correct-label" class="property-label"><g:message code="answer.correct.label" default="Correct" /></span>
					
						<span class="property-value" aria-labelledby="correct-label"><g:formatBoolean boolean="${answerInstance?.correct}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:answerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${answerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
