<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta name="layout" content="main">
	<title>Question List</title>
	<script	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		<div id="indexList-question" class="content scaffold-list" role="main">
			<g:render template="refreshIndexList"/>
		</div>
		<div id="questionIndexDialog">
		</div>
		<script>
		$(function(){
			$("#questionIndexDialog").dialog({
				model:true,
				width:"80%",
				height:$(window).height()*0.8,
				autoOpen:false,
				close:function(event,ui){
					$.ajax({
						url:"/ChineseWeb/question/_refreshIndexList/",
						success:function(data,textStatus){
								$("#indexList-question").html(data);
							},
						error:function(XMLHttpRequest,textStatus,errorThrown){}
						});
					}
				});
	
			});
	</script>
	</body>
	
</html>