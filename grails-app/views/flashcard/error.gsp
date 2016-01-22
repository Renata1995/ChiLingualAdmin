<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  	<g:hasErrors bean="${flashcardInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${flashcardInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				
				</g:eachError>
				<li> Please go back and check again</li>
			</ul>
			</g:hasErrors>
  </div>
</body>
</html>