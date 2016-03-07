package chilingualadmin
import chilingual.security.*
import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class UserController {

   def restClient
	def index() { }
	def create(){
		User userInstance=new User()
		render view:"create",model:[userInstance:userInstance]
	}

	def save(User userInstance){
		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}
		userInstance.save(flush:true,failOnError:true)

		def admin=Role.findByAuthority("ROLE_ADMIN")
		UserRole.create(userInstance,admin,true)

		def response = restClient.post(path:'user/save'){
			urlenc username:userInstance.username,password:userInstance.password
		}
		println response
		flash.message = "The new account is created. Please log in."
		redirect controller:"login",action:"auth",method:"GET"

	}
}
