package chilingualadmin



import static org.springframework.http.HttpStatus.*
import chilingual.security.User
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class QuestionController {
	def springSecurityService
	
	def index(){
		User user=springSecurityService.currentUser
		def list=Question.list().findAll{
			it.lesson.course.user==user
		}
		[list:list]
	}
	
	def _refreshIndexList(){
		def list=Question.list()
		[list:list]
	}
	
	def list(Lesson lessonInstance ) {
		def list=lessonInstance.questions.toList()
		[list:list,lessonInstance:lessonInstance]
	}
	
	def _refreshList(Lesson lessonInstance){
		println "refresh"
		def list=lessonInstance.questions.toList()
		[list:list,lessonInstance:lessonInstance]
	}

	def show(Question questionInstance) {
		[questionInstance:questionInstance]
	}

	def create() {
		def lessonInstance=Lesson.get(params.lessonId)
		int questionNo=lessonInstance.questions.size()+1
		(1..5).each{
			Answer a = new Answer(choice:"A",correct:false)


		}
		[questionInstance:new Question(),lessonInstance:lessonInstance,questionNo:questionNo]
	}

	@Transactional
	def save(Question questionInstance) {
		def lessonInstance=Lesson.get(params.lesson)
		lessonInstance.addToQuestions(questionInstance)
		if (questionInstance == null) {
			notFound()
			return
		}

		if (questionInstance.hasErrors()) {
			respond questionInstance.errors, view:'create',model:[questionInstance:questionInstance,lessonInstance:lessonInstance]
			return
		}
		lessonInstance.addToQuestions(questionInstance).save(flush:true,failOnError:true)
		questionInstance.save flush:true


		(1..5).each{
			if(params."${it}".compareTo("")){
				Answer a=new Answer(choice:params."${it}",correct:false)
				if(it.toString() in params.correctChecked){
					print it + " correct answer"
					a.correct = true
				}
				questionInstance.addToAnswers(a).save flush:true,failOnError:true
				a.save flush:true,failOnError:true
			}
		}

		request.withFormat {
			form multipartForm {
				flash.message = "Question ${questionInstance.questionNo} is created"
				render view:"show",model:[questionInstance:questionInstance]
			}
			'*' { respond questionInstance, [status: CREATED] }
		}
	}

	def edit(Question questionInstance) {
		def position=params.position
		[questionInstance:questionInstance,position:position]
	}

	@Transactional
	def update(Question questionInstance) {
		if (questionInstance == null) {
			notFound()
			return
		}

		if (questionInstance.hasErrors()) {
			respond questionInstance.errors, view:'edit'
			return
		}

		questionInstance.save flush:true,failOnError:true

		def answerList=[]

		/*
		 * Update previous answers and move empty answers to the answerList
		 */
		questionInstance.answers.each{answer->
			def idString=answer.id
			if(params."${idString}"==""){
				println "empty"
				answerList.add(answer)
			}else{
				answer.choice = params."${idString}"
				answer.correct = false
				answer.save(flush:true)
			}
		}

		/*
		 *Remove empty answers
		 */
		answerList.each{
			questionInstance.removeFromAnswers(it)
			deleteAnswer(it)
		}

		/*
		 * Determine correct answers
		 */
		if(params.correct.getClass()==String){
			def correctAnswer=Answer.get(params.correct)
			if(correctAnswer!=null){
				correctAnswer.correct=true
				correctAnswer.save(flush:true,failOnError:true)
			}
		}else{
			params.correct.each{
				if(Answer.get(it)!=null){
					Answer.get(it).correct = true
					Answer.get(it).save(flush:true,failOnError:true)
				}
			}
		}


		/*
		 *Add new Answers
		 */
		if(params.newAnswer.getClass()==String){
			println params.newAnswerCorrect
			def content=params.newAnswer
			if(content!=""){
				Answer a=new Answer(choice:content,correct:false)
				if(params.newAnswerCorrect!=null){
					a.correct=true;
				}
				questionInstance.addToAnswers(a).save(flush:true,failOnError:true)
				a.save(flush:true,failOnError:true)
				
			}
		}else if(params.newAnswer==null){}
		else{
			println params.newAnswerCorrect
			for(int i=0;i<params.newAnswer.size();i++){
				if(params.newAnswer[i]!=""){
					Answer a=new Answer(choice:params.newAnswer[i],correct:false)
					if(i.toString() in params.newAnswerCorrect){
						a.correct=true;
					}
					questionInstance.addToAnswers(a).save(flush:true,failOnError:true)
					a.save(flush:true,failOnError:true)
				}
			}
		}

		
		flash.message = "Question ${questionInstance.questionNo} is updated"
		render view:"show",model:[questionInstance:questionInstance]


	}

	@Transactional
	def delete(Question questionInstance) {
		def lessonInstance=Lesson.get(params.lessonId)

		if (questionInstance == null) {
			notFound()
			return
		}

		questionInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Question ${questionInstance.questionNo} is deleted."
				def list=lessonInstance.questions.toList()
				render view:"list",model:[list:list,lessonInstance:lessonInstance]
			}
			'*'{ render status: NO_CONTENT }
		}
	}
	
	@Transactional
	def deleteOnIndex(Question questionInstance) {
		def lessonInstance=Lesson.get(params.lessonId)

		if (questionInstance == null) {
			notFound()
			return
		}

		questionInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Question ${questionInstance.questionNo} is deleted."
				def list=Question.list()
				render view:"index",model:[list:list]
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	def deleteAnswer(Answer answerInstance) {
		if (answerInstance == null) {
			println "not found"
			notFound()
			return
		}
		answerInstance.delete flush:true
	}


	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
				redirect action: "list", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def addAnswer(){
		Question q=Question.get(params.questionId)
		if(q.answers.size()<5){
			Answer a=new Answer(choice:"Input Text",correct:false)
			q.addToAnswers(a).save(flush:true,failOnError:true)
			a.save(flush:true,failOnError:true)
			println a.id
			render view:"_form",model:[answerInstance:a]
		}else{
			render "No more than 5 answers"
		}
	}

	def _addAnswer(){
		def newAnswer=params.newAnswer
		render view:"addAnswer",model:[newAnswer:newAnswer]
	}
}
