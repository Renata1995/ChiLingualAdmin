//package chilingualadmin
//
//import grails.plugin.springsecurity.annotation.Secured
//
//import static org.springframework.http.HttpStatus.*
//import grails.transaction.Transactional
//import groovy.json.JsonSlurper
//import grails.converters.JSON
//
//@Transactional(readOnly = true)
//@Secured("ROLE_ADMIN")
//class FlashcardController {
//	def jsonSlurper = new JsonSlurper()
//
//	def index(Integer max) {
//		def list=Flashcard.list()
//		def listString=(list as JSON)as String
//		def listArray=jsonSlurper.parseText(listString)
//		[list:listArray]
//	}
//
//	def show(Flashcard flashcard) {
//		def flashcardString=(flashcard as JSON) as String
//		def flashcardInstance=jsonSlurper.parseText(flashcard)
//		model:flashcardInstance
//	}
//
//	def create() {
//	}
//
//	@Transactional
//	def save() {
//		/*get params and convert to JSON*/
//		def paramsJSON=params as JSON
//		println paramsJSON
//		println paramsJSON.getClass()
//		
//		
//		/*Send paramsJSON to the API server*/
//		
//		/*Get a JSON string of map: success and fail*/
//		/*	-if failure: render the error view
//		 * 	-if success: render the show view of the course (from the value of success)
//		 *
//		 */
//		def mockFlashcardSuccess=new Flashcard(symbol:"AS",pronunciation:"AS",definition:"AS")
//		def responseSuccessMap=[error:null,success:mockFlashcardSuccess]
//		def responseSuccessString=(responseSuccessMap as JSON)as String
//		def response1 = jsonSlurper.parseText(responseSuccessString)
//	
//		
//		def responseFailMap=[error:"fail",success:null]
//		def responseFailString=(responseFailMap as JSON)as String
//		def response2 = jsonSlurper.parseText(responseFailString)
//		
//		println (response1)
//		println(response1.getClass())
//		println(response2.getClass())
//		println (response2)
//		println response1['success']
//		/*
//		 * Tests
//		 */
//		if (response1['error'] != null){
//			render view:"error", model:[error:response1['error']]
//		} else {
//			render view:"show", model:response1['success']
//		}
//	}
//
//	def edit(Flashcard flashcard) {
//		def flashcardString=(flashcard as JSON) as String
//		def flashcardInstance=jsonSlurper.parseText(flashcard)
//		model:flashcardInstance
//	}
//
//	@Transactional
//	def update(Flashcard flashcardInstance) {
//		
//	}
//
//	@Transactional
//	def delete(Flashcard flashcardInstance) {
//
//	
//	}
//}
