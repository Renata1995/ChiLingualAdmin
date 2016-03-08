package chilingualadmin



import static org.springframework.http.HttpStatus.*
import chilingual.security.User
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class QuestionController {
	def springSecurityService
	def restClient
	
	/**
	 * No path!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 * Show all questions of a specific user
	 * @return
	 */
	def index(){
		String username=springSecurityService.currentUser.username
		def response=restClient.get(path:'questions',query:[adminEmail:username],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is an arrayList of question objects
		[list:list]
	}
	
	/**
	 * Show all questions in the current lesson
	 * path: Uncertain!!!!!!!!!
	 * @return
	 */
	def list() {
		def response=restClient.get(path:'questions',query:[courseCode:params.courseCode,lessonNo:params.lessonNo],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is an arrayList of question objects
		[list:list,lessonNo:params.lessonNo, courseCode:params.courseCode]
	}
	
	/**
	 * Ajax method for the list page
	 */
	def _refreshList(){
		def response=restClient.get(path:'questions',query:[courseCode:params.courseCode,lessonNo:params.lessonNo],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is an arrayList of question objects
		[list:list,lessonNo:params.lessonNo, courseCode:params.courseCode]
	}

	/**
	 * Show a specific question and its answers
	 * @return
	 */
	def show() {
		def response=restClient.get(path:"questions",query:[questionNo:params.questionNo,courseCode:params.courseCode,lessonNo:params.lessonNo],accept: ContentType.JSON)
		println response
		def question=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a question object which contains an arrayList of five answers
		[questionInstance:question]
	}

	/**
	 * Create a question
	 * @return
	 */
	def create() {		
		[courseCode:params.courseCode,lessonNo:params.lessonNo]
	}

	@Transactional
	def save() {
		def answerList=[]//a list of maps
		(1..5).each{
				def a=[choice:params."${it}",correct:false]
				if(it.toString() in params.correctChecked){
					a['correct'] = true
				}
				answerList.add(a)
		}

		def response=restClient.post(path:'questions'){
			urlenc courseCode:params.courseCode,lessonNo:params.lessonNo,questionText:questionText,answers:answerList
		}
		def question=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a question object which contains an arrayList of five answers
		render view:"show",model:[questionInstance:question]
	}

	
	def edit() {
		def position=params.position
		def response=restClient.get(path:"questions",query:[questionNo:params.questionNo,courseCode:params.courseCode,lessonNo:params.lessonNo],accept: ContentType.JSON)
		println response
		def question=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a question object which contains an arrayList of five answers
		[questionInstance:question,position:position]
	}

	@Transactional
	def update() {
		def answerList=[]//a list of maps
		(0..4).each{
				def a=[choice:params."${it}",correct:false]
				if(it.toString() in params.correctChecked){
					a['correct'] = true
				}
				answerList.add(a)
		}

		def response=restClient.put(path:'questions'){
			urlenc questionNo:params.questionNo,questionText:params.questionText,courseCode:params.courseCode,lessonNo:params.lessonNo,answers:answerList
		}
		def question=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a question object which contains an arrayList of five answers
		render view:"show",model:[questionInstance:question]


	}

	@Transactional
	def delete() {
		def response=restClient.delete(path:"questions",query:[questionNo:params.questionNo,lessonNo:params.lessonNo,courseCode:params.courseCode],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		flash.message = "Question ${params.questionNo} is deleted."
		//Assume the response is an arrayList of course objects
		render view:"index",model:[list:list,lessonNo:params.lessonNo, courseCode:params.courseCode]
	}
	
	@Transactional
	def deleteOnIndex() {
		def response=restClient.delete(path:"questions",query:[questionNo:params.questionNo,lessonNo:params.lessonNo,courseCode:params.courseCode],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		flash.message = "Question ${params.courseCode}-${params.lessonNo}-${params.questionNo} is deleted."
		//Assume the response is an arrayList of course objects
		render view:"index",model:[list:list]
	}


}
