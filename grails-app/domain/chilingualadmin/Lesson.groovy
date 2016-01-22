package chilingualadmin

class Lesson {
	int lessonNo
	String lessonTitle
	
	static belongsTo = [course:Course]
	static hasMany = [flashcards: Flashcard, questions: Question]
	static mapping = {
		flashcards cascade: "save-update"
	}
	
    static constraints = {
		lessonNo nullable: false, blank:false
		lessonTitle nullable: false,blank:false
    }
}
