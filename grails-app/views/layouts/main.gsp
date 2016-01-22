<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Austin College Chinese Web</title>
<!-- Jquery CDN -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- Custom assets -->
<asset:stylesheet src="application.css" />

<!-- Jquery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<g:layoutHead />
</head>
<body>
	<sec:ifLoggedIn>
	<fieldset class="buttons" id="logOutBar">
		<g:form controller="logout" method="POST" style="text-align:right">
		<g:actionSubmit id="logOutButton" action="index" value="Log Out"/>
		</g:form>
		</fieldset>
	</sec:ifLoggedIn>
	<div id="mainTitle"> ChiLingual Administration
	<p>Web for administrators to manage the database
			  </p>
	</div>
	<g:layoutBody />
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>

</body>

<footer class="site-footer" role="contentinfo" itemscope="itemscope"
	itemtype="http://schema.org/WPFooter">
	<div class="wrap">
		<div class="credits widget-area">
			<div class="wrap">
				<section id="black-studio-tinymce-12"
					class="widget widget_black_studio_tinymce">
					<div class="widget-wrap">
						<div class="textwidget">
							<p>
								Copyright © 2015 - All rights reserved <span class="seperator">|</span>
								Site by Austin College
							</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</footer>
</html>
