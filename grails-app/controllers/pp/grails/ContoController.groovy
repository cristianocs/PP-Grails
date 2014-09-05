package pp.grails

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.*

@Secured(['IS_AUTHENTICATED_FULLY'])
class ContoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contoInstanceList: Conto.list(params), contoInstanceTotal: Conto.count()]
    }

    def create() {
        [contoInstance: new Conto(params)]
    }

    def save() {
        def contoInstance = new Conto(params)
        if (!contoInstance.save(flush: true)) {
            render(view: "create", model: [contoInstance: contoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'conto.label', default: 'Conto'), contoInstance.id])
        redirect(action: "show", id: contoInstance.id)
    }

    def show(Long id) {
        def contoInstance = Conto.get(id)
        if (!contoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "list")
            return
        }

        [contoInstance: contoInstance]
    }

    def edit(Long id) {
        def contoInstance = Conto.get(id)
        if (!contoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "list")
            return
        }

        [contoInstance: contoInstance]
    }

    def update(Long id, Long version) {
        def contoInstance = Conto.get(id)
        if (!contoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contoInstance.version > version) {
                contoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conto.label', default: 'Conto')] as Object[],
                          "Another user has updated this Conto while you were editing")
                render(view: "edit", model: [contoInstance: contoInstance])
                return
            }
        }

        contoInstance.properties = params

        if (!contoInstance.save(flush: true)) {
            render(view: "edit", model: [contoInstance: contoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'conto.label', default: 'Conto'), contoInstance.id])
        redirect(action: "show", id: contoInstance.id)
    }

    def delete(Long id) {
        def contoInstance = Conto.get(id)
        if (!contoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "list")
            return
        }

        try {
            contoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conto.label', default: 'Conto'), id])
            redirect(action: "show", id: id)
        }
    }

    
}
