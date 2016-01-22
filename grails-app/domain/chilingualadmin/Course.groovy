package chilingualadmin

class Course {
	String courseTitle
	String courseCode

	static constraints = {
		courseTitle(blank:false,nullable:false)
		courseCode(blank:false,nullable:false,unique:true)
	}

	static hasMany=[lessons:Lesson]
	static belongsTo=[user:chilingual.security.User]

}