package labstore

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional
import labstore.RefreshService.*
//import grails.gorm.DetachedCriteria
//import labstore.Material

class OutsController {

    OutsService outsService
    RefreshService refreshService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond outsService.list(params), model:[outsCount: outsService.count()]
    }

    def show(Long id) {
        respond outsService.get(id)
    }

    def create() {
        respond new Outs(params)
    }
    @Transactional
    def save(Outs outs) {
        if (outs == null) {
            notFound()
            return
        }

        try {
            if(refreshService.updateMaterial(outs)){
            flash.message="Nao dispomos da quantidade requesitada de ${outs.material.name}"
            forward action:"create"
            }
            outsService.save(outs)
            }
        catch (ValidationException e) {
            respond outs.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'outs.label', default: 'Outs'), outs.id])
                redirect outs
            }
            '*' { respond outs, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond outsService.get(id)
    }
    @Transactional
    def update(Outs outs) {
        if (outs == null) {
            notFound()
            return
        }

        try {
            if(refreshService.updateMaterial(outs)){
            flash.message="Nao dispomos da quantidade requesitada de ${outs.material.name}"
            forward action:"edit"
            }
            outsService.save(outs)
            }
        catch (ValidationException e) {
            respond outs.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'outs.label', default: 'Outs'), outs.id])
                redirect outs
            }
            '*'{ respond outs, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        outsService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'outs.label', default: 'Outs'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'outs.label', default: 'Outs'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
