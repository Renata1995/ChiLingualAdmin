<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	<title>Quiz Questions</title>
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
				<li><g:link controller="lesson" action="show" id="${lessonInstance.id}">Lesson</g:link>
				<li><a class="create" id="new-question">New Question</a></li>
			</ul>
		</div>
		
		<div id="list-question" class="content scaffold-list" role="main">
			<g:render template="refreshList"/>
		</div>
		<div id="questionDialog">
		</div>
		<script>
		$(function(){
			$("#questionDialog").dialog({
				model:true,
				width:"80%",
				height:$(window).height()*0.8,
				autoOpen:false,
				close:function(event,ui){
					var id="${lessonInstance.id}";
					$.ajax({
						url:"/ChineseWeb/question/_refreshList/"+id,
						success:function(data,textStatus){
								$("#list-question").html(data);
							},
						error:function(XMLHttpRequest,textStatus,errorThrown){}
						});
					}
				});
			$("#new-question").click(function(){
				$.ajax({
					url:"/ChineseWeb/question/create",
					data:{lessonId:"${lessonInstance.id}"},
					success:function(data,textStatus){
							$("#questionDialog").html(data);
						},
					error:function(XMLHttpRequest,textStatus,errorThrown){}
					});
				$("#questionDialog").dialog("open");
				});
			
			});
	</script>
	</body>
	
</html>
