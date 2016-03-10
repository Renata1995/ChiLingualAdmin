package chilingualadmin
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.json.JsonSlurper
import chilingual.security.*
import wslite.rest.*


@Transactional(readOnly = true)
@Secured("ROLE_ADMIN")
class CourseController {

	def springSecurityService
	def jsonSlurper = new JsonSlurper()
	def restClient

	/**
	 * Course List
	 * @return
	 */
	def index() {
		String username=springSecurityService.currentUser.username
		def response=restClient.get(path:'courses',query:[username:username],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is an arrayList of course objects
		[list:list]
	}

	/**
	 * Show a specific course and its lessons
	 * @return
	 */
	def show() {
		String username=springSecurityService.currentUser.username
		def courseCode=params.courseCode
		def response=restClient.get(path:"courses/lessons",query:[courseCode:courseCode],accept: ContentType.JSON)
		println response
		def lessons=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a map: [course:course,lessons:lessons(an arrayList of lessons)]
		[courseCode:courseCode,courseTitle:params.courseTitle,lessons:lessons]

	}
	/**
	 * Ajax. Open create-new-course dialog
	 * @return
	 */
	def create() {
	}

	/**
	 * Save a created course
	 * @return
	 */
	def save() {
		def username=springSecurityService.currentUser.username
		def response=restClient.post(path:'courses'){
			urlenc courseTitle:params.courseTitle,courseCode:params.courseCode,adminEmail:username
		}
		def courseAPI=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a course object
		render view:"show",model:courseAPI

	}
	/**
	 * Edit a specific course
	 * @return
	 */
	def edit() {
		[courseCode:params.courseCode,courseTitle:params.courseTitle]
	}

	/**
	 * Update a specific course
	 * @return
	 */
	def update() {
		def username=springSecurityService.currentUser.username
		def courseCode=params.courseCode;
		def response=restClient.put(path:'courses/${courseCode}'){
			urlenc courseTitle:params.courseTitle,adminEmail:username
		}
		flash.message = "Course ${courseCode} is updated."
		def courseAPI=jsonSlurper.parseText(response.getContentAsString())
		//Assume the response is a course object
		render view:"show",model:courseAPI
	}

	/**
	 * Delete a specific course
	 * @return
	 */
	def delete() {
		def username=springSecurityService.currentUser.username
		def courseCode=params.courseCode
		def response=restClient.delete(path:"courses/${courseCode}",query:[adminEmail:username],accept: ContentType.JSON)
		def list=jsonSlurper.parseText(response.getContentAsString())
		flash.message = "Course ${courseCode} is deleted."
		//Assume the response is an arrayList of course objects
		render view:"index",model:[list:list]
	}
}