//
//package chilingualadmin
///**
// * Controls all lessons 
// */
//import grails.plugin.springsecurity.annotation.Secured
//
//
//import static org.springframework.http.HttpStatus.*
//import grails.transaction.Transactional
//@Secured("ROLE_ADMIN")
//@Transactional(readOnly = true)
//class LessonController {
//	def show(Lesson lessonInstance) {
//		def course=lessonInstance.course
//		[lessonInstance:lessonInstance,course:course]
//	}
//
//	def create() {
//		def course=Course.get(Long.parseLong(params.courseId))
//		def lessonNo=course.lessons.size()+1
//		[lessonInstance: new Lesson(),course:course,lessonNo:lessonNo]
//	}
//	def _tableFlashcard(){
//		def lId = params.lessonId as Long
//		def lessonInstance = Lesson.get(lId)
//		def flashcardInstanceList = Flashcard.list()
//		render view:'_tableFlashcard', model:[flashcardInstanceList: flashcardInstanceList, lessonInstance: lessonInstance]
//	}
//	
//	def addFlashcard(){
//		
//		def fId = params.flashcardId as Long
//		def lId = params.lessonId as Long
//		
//		def flashcardInstance = Flashcard.get(fId)
//		def lessonInstance = Lesson.get(lId)
//		lessonInstance.addToFlashcards(flashcardInstance).save(flush:true)
//		
//		render view:'_lessonFlashcard', model: [lessonInstance:lessonInstance]
//		
//	}
//	
//	def deleteFlashcard(){
//		def fId = params.flashcardId as Long
//		def lId = params.lessonId as Long
//		def flashcardInstance = Flashcard.get(fId)
//		def lessonInstance = Lesson.get(lId)
//		lessonInstance.removeFromFlashcards(flashcardInstance).save(flush:true)
//		
//		render view:'_lessonFlashcard', model: [lessonInstance:lessonInstance]
//	}
//	
//	@Transactional
//	def save(Lesson lessonInstance) {
//		lessonInstance.properties=params
//		def course=Course.get(Long.parseLong(params.courseId))
//		course.addToLessons(lessonInstance)
//		if (lessonInstance == null) {
//			notFound()
//			return
//		}
//
//		if (lessonInstance.hasErrors()) {
//			respond lessonInstance.errors, view:'create'
//			return
//		}
//		
//		course.addToLessons(lessonInstance).save(flush:true,failOnError:true)
//		lessonInstance.save flush:true,failOnError:true
//
//		request.withFormat {
//			form multipartForm {
//				flash.message = message(code: 'default.created.message', args: [message(code: 'lesson.label', default: 'Lesson'), lessonInstance.id])
//				redirect lessonInstance
//			}
//			'*' { respond lessonInstance, [status: CREATED] }
//		}
//	}
//
//	def edit(Lesson lessonInstance) {
//		respond lessonInstance
//	}
//
//	@Transactional
//	def update(Lesson lessonInstance) {
//		if (lessonInstance == null) {
//			notFound()
//			return
//		}
//
//		if (lessonInstance.hasErrors()) {
//			respond lessonInstance.errors, view:'edit'
//			return
//		}
//
//		lessonInstance.save flush:true
//
//		request.withFormat {
//			form multipartForm {
//				flash.message = "Lesson ${lessonInstance.lessonTitle} is updated"
//				redirect lessonInstance
//			}
//			'*'{ respond lessonInstance, [status: OK] }
//		}
//	}
//
//	@Transactional
//	def delete(Lesson lessonInstance) {
//
//		if (lessonInstance == null) {
//			notFound()
//			return
//		}
//		def courseId=lessonInstance.course.id
//		lessonInstance.delete flush:true
//
//		request.withFormat {
//			form multipartForm {
//				flash.message = "Lesson ${lessonInstance.lessonTitle} is deleted"
//				redirect action:"show",controller:"course", id:"${courseId}", method:"GET"
//			}
//			'*'{ render status: NO_CONTENT }
//		}
//	}
//
//	protected void notFound() {
//		request.withFormat {
//			form multipartForm {
//				flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), params.id])
//				redirect action: "index", method: "GET"
//			}
//			'*'{ render status: NOT_FOUND }
//		}
//	}
//}
