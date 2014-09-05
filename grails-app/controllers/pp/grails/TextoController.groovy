package pp.grails

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.*

@Secured(['IS_AUTHENTICATED_FULLY'])
class TextoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [textoInstanceList: Texto.list(params), textoInstanceTotal: Texto.count()]
    }

    def create() {
        [textoInstance: new Texto(params)]
    }

    def save() {
        def textoInstance = new Texto(params)
        if (!textoInstance.save(flush: true)) {
            render(view: "create", model: [textoInstance: textoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'texto.label', default: 'Texto'), textoInstance.id])
        redirect(action: "show", id: textoInstance.id)
    }

    def show(Long id) {
        def textoInstance = Texto.get(id)
        if (!textoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "list")
            return
        }

        [textoInstance: textoInstance]
    }

    def edit(Long id) {
        def textoInstance = Texto.get(id)
        if (!textoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "list")
            return
        }

        [textoInstance: textoInstance]
    }

    def update(Long id, Long version) {
        def textoInstance = Texto.get(id)
        if (!textoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (textoInstance.version > version) {
                textoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'texto.label', default: 'Texto')] as Object[],
                          "Another user has updated this Texto while you were editing")
                render(view: "edit", model: [textoInstance: textoInstance])
                return
            }
        }

        textoInstance.properties = params

        if (!textoInstance.save(flush: true)) {
            render(view: "edit", model: [textoInstance: textoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'texto.label', default: 'Texto'), textoInstance.id])
        redirect(action: "show", id: textoInstance.id)
    }

    def delete(Long id) {
        def textoInstance = Texto.get(id)
        if (!textoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "list")
            return
        }

        try {
            textoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'texto.label', default: 'Texto'), id])
            redirect(action: "show", id: id)
        }
    }
}
