<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name='layout' content='main' />
<title>Sign Up</title>
<style type='text/css' media='screen'>
#signup {
	margin: 15px 0px;
	padding: 0px;
	text-align: center;
}

#signup .inner {
	width: 340px;
	padding-bottom: 6px;
	margin: 60px auto;
	text-align: left;
	border: 1px solid #aab;
	background-color: #f0f0fa;
	-moz-box-shadow: 2px 2px 2px #eee;
	-webkit-box-shadow: 2px 2px 2px #eee;
	-khtml-box-shadow: 2px 2px 2px #eee;
	box-shadow: 2px 2px 2px #eee;
}

#signup .inner .fheader {
	padding: 18px 26px 14px 26px;
	background-color: #f7f7ff;
	margin: 0px 0 14px 0;
	color: #2e3741;
	font-size: 18px;
	font-weight: bold;
}

#signup .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 4px 0 3px 0;
	padding-left: 105px;
	margin-bottom: 20px;
	height: 1%;
}

#signup .inner .cssform input[type='text'] {
	width: 120px;
}

#signup .inner .cssform label {
	font-weight: bold;
	float: left;
	text-align: right;
	width: 110px;
	padding-top: 3px;
	padding-right: 10px;
}

#signup #remember_me_holder {
	padding-left: 120px;
}

#signupButton{
	margin-top:20px;
}

#signup #remember_me_holder label {
	float: none;
	margin-left: 0;
	text-align: left;
	width: 200px
}

#signup .inner .signup_message {
	padding: 6px 25px 20px 25px;
	color: #c33;
}

#signup .inner .text_ {
	width: 120px;
}

#signup .inner .chk {
	height: 12px;
}
</style>
</head>
<body>
	<div id="signup">
		<div class='inner'>
			<div class='fheader'>
				Sign Up
			</div>

			<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form controller="user" id="${userInstance.id}" method='POST'
				class='cssform signupForm'>
				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'choice', 'error')} required">
					<label for='username'>Email: </label>
					<span class="required-indicator">*</span>
					<g:textField class='text_' name='username'
						value="${userInstance?.username}" required=""/>
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'choice', 'error')} required">
					<label for='password'>Password: </label>
					<span class="required-indicator">*</span>
					<g:field type='password' class='text_' name='password'
						value="${userInstance?.password}" required="" />
				</div>

				<p>
					<g:actionSubmit id="signupButton" action="save" type="button" value='Sign Up' />
				</p>
			</g:form>
		</div>
	</div>
</body>
</html>