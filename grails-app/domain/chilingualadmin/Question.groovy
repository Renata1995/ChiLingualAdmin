package chilingualadmin

class Question {
	String questionText
	int questionNo
	
	static belongsTo = [lesson:Lesson]
	static hasMany = [answers: Answer]
    static constraints = {
		answers maxSize:5
		questionText nullable:false,blank:false
		questionNo nullable:false,blank:false
    }
}
