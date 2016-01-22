<div class="fieldcontain ${hasErrors(bean: flashcardInstance, field: 'symbol', 'error')} required">
	<label for="symbol">
		<g:message code="flashcard.symbol.label" default="Symbol" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="symbol" required="" value="${flashcardInstance?.symbol}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: flashcardInstance, field: 'pronunciation', 'error')} required">
	<label for="pronunciation">
		<g:message code="flashcard.pronunciation.label" default="Pronunciation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pronunciation" required="" value="${flashcardInstance?.pronunciation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: flashcardInstance, field: 'definition', 'error')} required">
	<label for="definition">
		<g:message code="flashcard.definition.label" default="Definition" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="definition" required="" value="${flashcardInstance?.definition}"/>

</div>


