
<script>
	
$(function(){
	$('#tbleFlashcards').dataTable();
	$('.symbol').click(function(){
		var idString=$(this).prop('id');
		$.ajax({
			type:'POST',
			
			url:'/ChiLingualAdmin/lesson/addFlashcard',

			data: {
				lessonId: ${lessonInstance.id},
				flashcardId: idString
			},
			success:function(data,textStatus){
				jQuery('#tbleAjax').html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){
			}
		});
			});
	
});

</script>

<table id="tbleFlashcards">
	<thead>
		<tr>
			<th>Symbol</th>
			<th>Pronunciation</th>
			<th>Definition</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${flashcardInstanceList}" status="i"
			var="flashcardInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td>${flashcardInstance.symbol}
				</td>

				<td>
					${fieldValue(bean: flashcardInstance, field: "pronunciation")}
				</td>

				<td>
					${fieldValue(bean: flashcardInstance, field: "definition")}
				</td>
				<td> <input type="button" value="Add" class="symbol" id="${flashcardInstance.id}"/></td>

			</tr>
		</g:each>
	</tbody>
</table>
