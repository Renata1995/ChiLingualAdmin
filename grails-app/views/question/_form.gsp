<div
					class="fieldcontain ${hasErrors(bean: answerInstance, field: 'choice', 'error')} required" id="answer${answerInstance.id}">
					<label for="choice"> <g:message code="answer.choice.label"
							default="Choice" />
					</label>
					<g:textField name="${answerInstance.id}"
						value="" />
						<label style="margin-left:15px;width:inherit" for="correct"> Correct:  </label>
					<g:if test="${answerInstance.correct}">
						<g:checkBox name="correct" value="${answerInstance.id}"
							checked="true" />
					</g:if>
					<g:else>
						<g:checkBox name="correct" value="${answerInstance.id}"
							checked="false" />
					</g:else>
					
					<button type="button" class="btn btn-default deleteAnswer">
						<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					</button>
					
				</div>



