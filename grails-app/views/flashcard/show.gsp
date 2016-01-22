<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flashcard.label', default: 'Flashcard')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flashcard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flashcard" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flashcard">
			
				<g:if test="${flashcardInstance?.symbol}">
				<li class="fieldcontain">
					<span id="symbol-label" class="property-label"><g:message code="flashcard.symbol.label" default="Symbol" /></span>
					
						<span class="property-value" aria-labelledby="symbol-label"><g:fieldValue bean="${flashcardInstance}" field="symbol"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flashcardInstance?.pronunciation}">
				<li class="fieldcontain">
					<span id="pronunciation-label" class="property-label"><g:message code="flashcard.pronunciation.label" default="Pronunciation" /></span>
					
						<span class="property-value" aria-labelledby="pronunciation-label"><g:fieldValue bean="${flashcardInstance}" field="pronunciation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flashcardInstance?.definition}">
				<li class="fieldcontain">
					<span id="definition-label" class="property-label"><g:message code="flashcard.definition.label" default="Definition" /></span>
					
						<span class="property-value" aria-labelledby="definition-label"><g:fieldValue bean="${flashcardInstance}" field="definition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flashcardInstance?.lessons}">
				<li class="fieldcontain">
					<span id="lessons-label" class="property-label"><g:message code="flashcard.lessons.label" default="Lessons" /></span>
					
						<g:each in="${flashcardInstance.lessons}" var="l">
						<span class="property-value" aria-labelledby="lessons-label"><g:link controller="lesson" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
			<g:form url="[resource:flashcardInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:remoteLink class="edit" action="edit" controller="flashcard" update="show-flashcard" id="${flashcardInstance.id}">Edit</g:remoteLink>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
