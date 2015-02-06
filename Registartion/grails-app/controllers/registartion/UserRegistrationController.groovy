package registartion

import org.springframework.dao.DataIntegrityViolationException

class UserRegistrationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userRegistrationInstanceList: UserRegistration.list(params), userRegistrationInstanceTotal: UserRegistration.count()]
    }

    def create() {
        [userRegistrationInstance: new UserRegistration(params)]
    }

    def save() {
        def userRegistrationInstance = new UserRegistration(params)
        if (!userRegistrationInstance.save(flush: true)) {
            render(view: "create", model: [userRegistrationInstance: userRegistrationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), userRegistrationInstance.id])
        redirect(action: "show", id: userRegistrationInstance.id)
    }

    def show(Long id) {
        def userRegistrationInstance = UserRegistration.get(id)
        if (!userRegistrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "list")
            return
        }

        [userRegistrationInstance: userRegistrationInstance]
    }

    def edit(Long id) {
        def userRegistrationInstance = UserRegistration.get(id)
        if (!userRegistrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "list")
            return
        }

        [userRegistrationInstance: userRegistrationInstance]
    }

    def update(Long id, Long version) {
        def userRegistrationInstance = UserRegistration.get(id)
        if (!userRegistrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userRegistrationInstance.version > version) {
                userRegistrationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userRegistration.label', default: 'UserRegistration')] as Object[],
                          "Another user has updated this UserRegistration while you were editing")
                render(view: "edit", model: [userRegistrationInstance: userRegistrationInstance])
                return
            }
        }

        userRegistrationInstance.properties = params

        if (!userRegistrationInstance.save(flush: true)) {
            render(view: "edit", model: [userRegistrationInstance: userRegistrationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), userRegistrationInstance.id])
        redirect(action: "show", id: userRegistrationInstance.id)
    }

    def delete(Long id) {
        def userRegistrationInstance = UserRegistration.get(id)
        if (!userRegistrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "list")
            return
        }

        try {
            userRegistrationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userRegistration.label', default: 'UserRegistration'), id])
            redirect(action: "show", id: id)
        }
    }
}
