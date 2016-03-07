import chilingualadmin.*
import chilingual.security.*

class BootStrap {
	def nameList="Language History,Pronunciation,Grammar,Writing".split(",")
	Random rand=new Random()
	
    def init = { servletContext ->
		User ablock=new User(username:"ablock@austincollege.edu",password:"ablock").save(flush:true)
		User mhiggs=new User(username:"mhiggs@austincollege.edu",password:"mhiggs").save(flush:true)
		Role admin=new Role(authority:"ROLE_ADMIN",enabled:true).save(flush:true)
		UserRole.create(ablock,admin,true)
		UserRole.create(mhiggs,admin,true)
	}	
	
    def destroy = {
    }
}
