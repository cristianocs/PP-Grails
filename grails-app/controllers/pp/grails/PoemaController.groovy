package pp.grails

import org.springframework.dao.DataIntegrityViolationException

class PoemaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [poemaInstanceList: Poema.list(params), poemaInstanceTotal: Poema.count()]
    }

    def create() {
        [poemaInstance: new Poema(params)]
    }

    def save() {
        def poemaInstance = new Poema(params)
        if (!poemaInstance.save(flush: true)) {
            render(view: "create", model: [poemaInstance: poemaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'poema.label', default: 'Poema'), poemaInstance.id])
        redirect(action: "show", id: poemaInstance.id)
    }

    def show(Long id) {
        def poemaInstance = Poema.get(id)
        if (!poemaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "list")
            return
        }

        [poemaInstance: poemaInstance]
    }

    def edit(Long id) {
        def poemaInstance = Poema.get(id)
        if (!poemaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "list")
            return
        }

        [poemaInstance: poemaInstance]
    }

    def update(Long id, Long version) {
        def poemaInstance = Poema.get(id)
        if (!poemaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (poemaInstance.version > version) {
                poemaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'poema.label', default: 'Poema')] as Object[],
                          "Another user has updated this Poema while you were editing")
                render(view: "edit", model: [poemaInstance: poemaInstance])
                return
            }
        }

        poemaInstance.properties = params

        if (!poemaInstance.save(flush: true)) {
            render(view: "edit", model: [poemaInstance: poemaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'poema.label', default: 'Poema'), poemaInstance.id])
        redirect(action: "show", id: poemaInstance.id)
    }

    def delete(Long id) {
        def poemaInstance = Poema.get(id)
        if (!poemaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "list")
            return
        }

        try {
            poemaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'poema.label', default: 'Poema'), id])
            redirect(action: "show", id: id)
        }
    }
}
