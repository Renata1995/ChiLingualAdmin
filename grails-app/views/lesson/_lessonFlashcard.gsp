<script>
$(function() {
	$('#tbleFlashcardsLesson').dataTable();
})
</script>
<g:if test="${lessonInstance?.flashcards}">
	<table id="tbleFlashcardsLesson">
		<thead>
			<tr>
				<th>Symbol</th>
				<th>Pronunciation</th>
				<th>Definition</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${lessonInstance.flashcards}" status="i"
				var="flashcardInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link controller="flashcard" action="show"
							id="${flashcardInstance.id}">
							${fieldValue(bean: flashcardInstance, field: "symbol")}
						</g:link></td>

					<td>
						${fieldValue(bean: flashcardInstance, field: "pronunciation")}
					</td>

					<td>
						${fieldValue(bean: flashcardInstance, field: "definition")}
					</td>

					<td id="${flashcardInstance.id}"><g:form controller="lesson"
							id="${flashcardInstance.id}">

							<input type="button" value="Remove"
								onclick="
											$.ajax({
											type:'POST',
												url:'/ChineseWeb/lesson/deleteFlashcard',
									
												data: {
													lessonId: ${lessonInstance.id},
													flashcardId: ${flashcardInstance.id}
												},
												success:function(data,textStatus){
												jQuery('#tbleAjax').html(data);
												},
												error:function(XMLHttpRequest,textStatus,errorThrown){
												}
												
											});
											return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</g:form></td>

				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>