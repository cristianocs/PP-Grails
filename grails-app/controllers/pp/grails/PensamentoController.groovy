package pp.grails

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.*

@Secured(['IS_AUTHENTICATED_FULLY'])
class PensamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pensamentoInstanceList: Pensamento.list(params), pensamentoInstanceTotal: Pensamento.count()]
    }

    def create() {
        [pensamentoInstance: new Pensamento(params)]
    }

    def save() {
        def pensamentoInstance = new Pensamento(params)
        if (!pensamentoInstance.save(flush: true)) {
            render(view: "create", model: [pensamentoInstance: pensamentoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), pensamentoInstance.id])
        redirect(action: "show", id: pensamentoInstance.id)
    }

    def show(Long id) {
        def pensamentoInstance = Pensamento.get(id)
        if (!pensamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "list")
            return
        }

        [pensamentoInstance: pensamentoInstance]
    }

    def edit(Long id) {
        def pensamentoInstance = Pensamento.get(id)
        if (!pensamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "list")
            return
        }

        [pensamentoInstance: pensamentoInstance]
    }

    def update(Long id, Long version) {
        def pensamentoInstance = Pensamento.get(id)
        if (!pensamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pensamentoInstance.version > version) {
                pensamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pensamento.label', default: 'Pensamento')] as Object[],
                          "Another user has updated this Pensamento while you were editing")
                render(view: "edit", model: [pensamentoInstance: pensamentoInstance])
                return
            }
        }

        pensamentoInstance.properties = params

        if (!pensamentoInstance.save(flush: true)) {
            render(view: "edit", model: [pensamentoInstance: pensamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), pensamentoInstance.id])
        redirect(action: "show", id: pensamentoInstance.id)
    }

    def delete(Long id) {
        def pensamentoInstance = Pensamento.get(id)
        if (!pensamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "list")
            return
        }

        try {
            pensamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pensamento.label', default: 'Pensamento'), id])
            redirect(action: "show", id: id)
        }
    }
}
