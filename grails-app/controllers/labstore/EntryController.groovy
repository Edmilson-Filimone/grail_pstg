package labstore

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import grails.gorm.DetachedCriteria
import labstore.Material
import static org.springframework.http.HttpStatus.*

class EntryController {

    EntryService entryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond entryService.list(params), model:[entryCount: entryService.count()]
    }

    def show(Long id) {
        respond entryService.get(id)
    }
    
    def create() {
        respond new Entry(params)

    }
    @Transactional
    def save(Entry entry) {
        if (entry == null) {
            notFound()
            return
        }

        try {
            entryService.save(entry)
            
            def criteria = new DetachedCriteria(Material).build{
                eq ("name", entry.material.name)
            } 
            
            def listMaterial = criteria.list()

            for(item in listMaterial){
            item.setQuantity(entry.getQuantity() + item.getQuantity())
            item.save() 
            }
         
        } catch (ValidationException e) {
            respond entry.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'entry.label', default: 'Entry'), entry.id])
                redirect entry
            }
            '*' { respond entry, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond entryService.get(id)
    }

    def update(Entry entry) {
        if (entry == null) {
            notFound()
            return
        }

        try {
            entryService.save(entry)
        } catch (ValidationException e) {
            respond entry.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'entry.label', default: 'Entry'), entry.id])
                redirect entry
            }
            '*'{ respond entry, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        entryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'entry.label', default: 'Entry'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
