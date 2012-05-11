package seahorse

import com.nikko.model.*

class AgenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def scaffold = Agencia
	
	def springSecurityService
    def passwordGeneratorService
    def mailService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [agenciaInstanceList: Agencia.list(params), agenciaInstanceTotal: Agencia.count()]
    }

    def create = {
        def agenciaInstance = new Agencia()
        agenciaInstance.enabled =   true
        agenciaInstance.properties = params
        return [agenciaInstance: agenciaInstance]
    }

    def save = {
        params.password =  passwordGeneratorService.generateNew()
		def userRole = SecRole.findByAuthority('ROLE_USER')
        def agenciaInstance = new Agencia(params)
		if( params.password )
			agenciaInstance.password = springSecurityService.encodePassword(params.password)
        if (agenciaInstance.save(flush: true)) {
	
			if ( userRole && !agenciaInstance.authorities.contains(userRole)) {
	          SecUserSecRole.create agenciaInstance, userRole
	        }

            mailService.sendMail {
             to agenciaInstance.email
             subject "Usuario SeaHorse Nikko "

             body( view:"mail",
              plugin:"email-confirmation",
              model:[contact:agenciaInstance.nombreCompleto, saludo:agenciaInstance.saludo,nombreAgencia:agenciaInstance.nombreAgencia,'username':agenciaInstance.username, 'password':params.password])
            }
	
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'agencia.label', default: 'Agencia'), agenciaInstance.id])}"
            redirect(action: "show", id: agenciaInstance.id)
        }
        else {
            render(view: "create", model: [agenciaInstance: agenciaInstance])
        }
    }

    def show = {
        def agenciaInstance = Agencia.get(params.id)
        if (!agenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [agenciaInstance: agenciaInstance]
        }
    }

    def edit = {
        def agenciaInstance = Agencia.get(params.id)
        if (!agenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [agenciaInstance: agenciaInstance]
        }
    }

    def changepasswd = {
        def agenciaInstance = Agencia.get(springSecurityService.principal.id)
        if (!agenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [agenciaInstance: agenciaInstance]
        }
    }

    def update = {
        def agenciaInstance = Agencia.get(params.id)
        if (agenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (agenciaInstance.version > version) {
                    
                    agenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'agencia.label', default: 'Agencia')] as Object[], "Another user has updated this Agencia while you were editing")
                    render(view: "edit", model: [agenciaInstance: agenciaInstance])
                    return
                }
            }
            agenciaInstance.properties = params
            if( params.password )
			  agenciaInstance.password = springSecurityService.encodePassword(params.password)
            if (!agenciaInstance.hasErrors() && agenciaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'agencia.label', default: 'Agencia'), agenciaInstance.id])}"
                redirect(action: "show", id: agenciaInstance.id)
            }
            else {
                render(view: "edit", model: [agenciaInstance: agenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(action: "list")
        }
    }

    def updatepasswd = {
        def agenciaInstance = Agencia.get(params.id)
        if (agenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (agenciaInstance.version > version) {

                    agenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'agencia.label', default: 'Agencia')] as Object[], "Another user has updated this Agencia while you were editing")
                    render(view: "changepasswd", model: [agenciaInstance: agenciaInstance])
                    return
                }
            }
            agenciaInstance.properties = params
            if( params.password )
			  agenciaInstance.password = springSecurityService.encodePassword(params.password)
            if (!agenciaInstance.hasErrors() && agenciaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'agencia.label', default: 'Agencia'), agenciaInstance.id])}"
                redirect(controller: "comision", action: "list")
            }
            else {
                render(view: "changepasswd", model: [agenciaInstance: agenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(controller: "comision", action: "list")
        }
    }

    def delete = {
        def agenciaInstance = Agencia.get(params.id)
        if (agenciaInstance) {
            try {
                agenciaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agencia.label', default: 'Agencia'), params.id])}"
            redirect(action: "list")
        }
    }
}
