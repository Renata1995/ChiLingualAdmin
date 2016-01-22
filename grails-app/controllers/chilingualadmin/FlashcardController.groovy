package chilingualadmin

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured("ROLE_ADMIN")
class FlashcardController {


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Flashcard.list(params), model:[list:Flashcard.list()]
    }

    def show(Flashcard flashcardInstance) {
        respond flashcardInstance
    }

    def create() {
        respond new Flashcard(params)
    }

    @Transactional
    def save(Flashcard flashcardInstance) {
        if (flashcardInstance == null) {
            notFound()
            return
        }

        if (flashcardInstance.hasErrors()) {
            respond flashcardInstance.errors, view:'create'
            return
        }

        flashcardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'flashcard.label', default: 'Flashcard'), flashcardInstance.id])
                redirect flashcardInstance
            }
            '*' { respond flashcardInstance, [status: CREATED] }
        }
    }

    def edit(Flashcard flashcardInstance) {
        respond flashcardInstance
    }

    @Transactional
    def update(Flashcard flashcardInstance) {
        if (flashcardInstance == null) {
            notFound()
            return
        }

        if (flashcardInstance.hasErrors()) {
            respond flashcardInstance.errors, view:'error'
            return
        }

        flashcardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Flashcard ${flashcardInstance.symbol} is updated"
                redirect flashcardInstance
            }
            '*'{ respond flashcardInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Flashcard flashcardInstance) {

        if (flashcardInstance == null) {
            notFound()
            return
        }

        flashcardInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Flashcard ${flashcardInstance.symbol} is deleted"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'flashcard.label', default: 'Flashcard'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
