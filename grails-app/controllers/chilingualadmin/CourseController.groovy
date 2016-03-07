//
//package chilingualadmin
//import grails.plugin.springsecurity.annotation.Secured
//import grails.converters.JSON
//import static org.springframework.http.HttpStatus.*
//import grails.transaction.Transactional
//import groovy.json.JsonSlurper
//import chilingual.security.*
//
///**
// * Manage courses
// * @author lenovo
// *
// */
//@Transactional(readOnly = true)
//@Secured("ROLE_ADMIN")
//class CourseController {
//	
//	def springSecurityService
//	def jsonSlurper = new JsonSlurper()
//
//	/**
//	 * Course List
//	 * @return
//	 */
//	def index() {
//		User user=springSecurityService.currentUser
//		def list=user.courses
//		def listString=(list as JSON)as String
//		def listArray=jsonSlurper.parseText(listString)
//		[list:listArray]
//	}
//
//	/**
//	 * Show detailed information of a specific course
//	 * @param course
//	 * @return
//	 */
//	def show(Course courseInstance) {
//		def map=[course:courseInstance,lessonList:courseInstance.lessons]
//		def mapString=(map as JSON)as String
//		def mapParse=jsonSlurper.parseText(mapString)				
//		model:mapParse
//		
//	}
//
//	/**
//	 * Ajax. Open create-new-course dialog
//	 * @return
//	 */
//	def create() {
//		
//	}
//
//	/**
//	 * Save a created course
//	 * @param courseInstance
//	 * @return
//	 */
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
//		def mockCourseSuccess=new Course(courseTitle:"hi",courseCode:"succeggss")
//		def user=springSecurityService.currentUser
//		user.addToCourses(mockCourseSuccess).save(flush:true)
//		mockCourseSuccess.save(flush:true)
//		(1..5).each{
//			Lesson l=new Lesson(lessonTitle:"h",lessonNo:it)
//			mockCourseSuccess.addToLessons(l).save(flush:true)
//			l.save(flush:true)
//		}
//		def mockLessonList=mockCourseSuccess.lessons
//		def responseSuccessMap=[error:null,success:[course:mockCourseSuccess,lessonList:mockLessonList]]
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
//		
//		
//	}
//
//	/**
//	 * Ajax. Edit a course
//	 * @param courseInstance
//	 * @return
//	 */
//	def edit() {
//		def courseCode=params.courseCode
//		def courseString=(Course.findByCourseCode(courseCode)as JSON)as String
//		def course=jsonSlurper.parseText(courseString)
//		println course.getClass()
//		model:course
//	}
//		
//
//
//	/**
//	 * Save an edited course
//	 * @param courseInstance
//	 * @return
//	 */
//	@Transactional
//	def update() {
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
//		def mockCourseSuccess=new Course(courseTitle:"hi",courseCode:"sucjjkce")
//		def user=springSecurityService.currentUser
//		user.addToCourses(mockCourseSuccess).save(flush:true)
//		mockCourseSuccess.save(flush:true)
//		(1..5).each{
//			Lesson l=new Lesson(lessonTitle:"h",lessonNo:it)
//			mockCourseSuccess.addToLessons(l).save(flush:true)
//			l.save(flush:true)
//		}
//		def mockLessonList=mockCourseSuccess.lessons
//		def responseSuccessMap=[error:null,success:[course:mockCourseSuccess,lessonList:mockLessonList]]
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
//		if (response2['error'] != null){
//			render view:"error", model:[error:response2['error']]
//		} else {
//			render view:"show", model:response2['success']
//		}
//		
//		
//		
//		/*if (course == null) {
//			notFound()
//			return
//		}
//
//		if (course.hasErrors()) {
//			render view:'show', model:[course:course, error:course.errors]
//			return
//		}
//
//		course.save flush:true
//
//		request.withFormat {
//			form multipartForm {
//				flash.message = "Course ${course.courseTitle} is updated."
//				redirect course
//			}
//			'*'{ respond course, [status: OK] }
//		}*/
//	}
//
//	/**
//	 * Delete a specific course
//	 * @param courseInstance
//	 * @return
//	 */
//	@Transactional
//	def delete() {
//		/*
//		 * Pass params.courseCode to the API server
//		 */
//		println params
//		
//		/*
//		 * Get a course list from the API server
//		 */
//		User user=springSecurityService.currentUser
//		def mockList=user.courses
//		def courseListString=(mockList as JSON)as String
//		def courseList=jsonSlurper.parseText(courseListString)
//		println courseList.getClass()
//		flash.message="Course ${params.courseCode} is deleted."
//		render view:"index",model:[list:courseList]
//	}
//}