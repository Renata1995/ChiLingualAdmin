package chilingualadmin

class Answer {
	Boolean correct
	String choice
	static belongsTo = [question:Question]
    static constraints = {
		choice blank:false, nullable:false
		correct blank:false,nullable:false
    }
}
