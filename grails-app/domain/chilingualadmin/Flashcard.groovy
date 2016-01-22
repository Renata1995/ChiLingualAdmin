package chilingualadmin

class Flashcard {
	String symbol
	String pronunciation
	String definition
	
	static hasMany = [lessons: Lesson]
	static belongsTo = Lesson
	
    static constraints = {
		symbol unique: true 
		pronunciation nullable: false
		definition nullable: false
    }
}
