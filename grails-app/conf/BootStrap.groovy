import com.nikko.model.*
import util.*

class BootStrap {

  def springSecurityService

  def init = { servletContext ->

    environments {
      production {
        seguridad()
      }


      development {
        seguridad()

        comisiones()

      }
    }
  }

  def seguridad = {
    def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = Agencia.findByUsername('admin') ?: new Agencia(
                username: 'admin',
                password: springSecurityService.encodePassword('admin'),
                enabled: true,
                iataCorpNo:'NA',
                email:'svazquez@nikko.com.mx'
        ).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
          SecUserSecRole.create adminUser, adminRole
        }

        if (!adminUser.authorities.contains(userRole)) {
          SecUserSecRole.create adminUser, userRole
        }

        new SecRequestmap(url: '/comision/**', configAttribute: 'ROLE_USER').save()
        new SecRequestmap(url: '/comision/create', configAttribute: 'ROLE_ADMIN').save()
        new SecRequestmap(url: '/comision/edit', configAttribute: 'ROLE_ADMIN').save()

        new SecRequestmap(url: '/agencia/**', configAttribute: 'ROLE_ADMIN').save()

        //Derechos para poder modificar password propio
        new SecRequestmap(url: '/agencia/changepasswd', configAttribute: 'ROLE_USER').save()
        new SecRequestmap(url: '/agencia/updatepasswd', configAttribute: 'ROLE_USER').save()
        new SecRequestmap(url: '/agencia/index', configAttribute: 'ROLE_USER').save()


        new SecRequestmap(url: '/dbUtil/**', configAttribute: 'ROLE_ADMIN').save()




        def agencia86812353 = Agencia.findByUsername('agencia86812353') ?: new Agencia(
                username: 'agencia86812353',
                password: springSecurityService.encodePassword('x'),
                enabled: true,
                iataCorpNo:'86812353',
                email:'israel_ma@hotmail.com',
                nombreCompleto:'Israel Martinez',
                saludo: 'Sr.',
                nombreAgencia:'Viajes Internacionales'
                ).save(failOnError: true)

        if (!agencia86812353.authorities.contains(userRole)) {
          SecUserSecRole.create agencia86812353, userRole
        }
  }

  def comisiones = {

    def fechaImportacion =  new Date()
    Periodo periodo = new Periodo()

    periodo.setFechaImportacionDate(fechaImportacion-1)
    periodo.save(flush: true)

    def data = [
          'travelAgentId':0
          ,'resvNameId':0
          ,'travelAgentName':'Dummy 01'
          ,'travelAgentDisplayName':'Dummy 01'
          ,'iataCorpNo':'1'
          , 'bankId':0
          ,'address1':'address1 address1'
          ,'address2':'address2'
          ,'address3':'address3'
          ,'address4':'address4'
          ,'zipCode':'zip code'
          ,'city':'city'
          ,'state':'state'
          ,'country':'country'
          ,'grossCommAmt':100
          ,'vatAmount':14
          ,'prepaidComm':0
          ,'commissionableRevenue':2000
          ,'taCommCode':'COM'
          ,'guestFirstName':'Sharon'
          ,'guestLastName':'Vazquez'
          ,'arrival':new Date()
          ,'departure':new Date()
          ,'rateCode':'RATE'
          ,'currencyCode':'MEX'
          ,'room':'2010'
          ,'marketCode':'EU'
          ,'rateAmount':1000
          ,'periodo':periodo
        ]

    def comision = new Comision(data)
		save(comision)

        (1..10).each{
          comision = new Comision(data)
		  save(comision)
        }

        comision = new Comision([
	          'travelAgentId':0
	          ,'resvNameId':0
	          ,'travelAgentName':'Dummy 02'
	          ,'travelAgentDisplayName':'Dummy 02'
	          ,'iataCorpNo':'86812353'
	          , 'bankId':0
	          ,'address1':'address1  address1'
	          ,'address2':'address2'
	          ,'address3':'address3'
	          ,'address4':'address4'
	          ,'zipCode':'zip code'
	          ,'city':'city'
	          ,'state':'state'
	          ,'country':'country'
	          ,'grossCommAmt':100
	          ,'vatAmount':14
	          ,'prepaidComm':0
	          ,'commissionableRevenue':2000
	          ,'taCommCode':'COM'
	          ,'guestFirstName':'Guadalupe'
	          ,'guestLastName':'Vera'
	          ,'arrival':new Date()
	          ,'departure':new Date()
	          ,'rateCode':'RATE'
	          ,'currencyCode':'MEX'
	          ,'room':'2010'
	          ,'marketCode':'EU'
	          ,'rateAmount':1000
              ,'periodo':periodo
	        ])
		save(comision)


        periodo = new Periodo()
        periodo.setFechaImportacionDate(fechaImportacion)
        periodo.save(flush: true)
		
		comision = new Comision([
	          'travelAgentId':0
	          ,'resvNameId':0
	          ,'travelAgentName':'Dummy 02'
	          ,'travelAgentDisplayName':'Dummy 02'
	          ,'iataCorpNo':'86812353'
	          , 'bankId':61
	          ,'address1':'address1  address1'
	          ,'address2':'address2'
	          ,'address3':'address3'
	          ,'address4':'address4'
	          ,'zipCode':'zip code'
	          ,'city':'city'
	          ,'state':'state'
	          ,'country':'country'
	          ,'grossCommAmt':100
	          ,'vatAmount':14
	          ,'prepaidComm':0
	          ,'commissionableRevenue':2000
	          ,'taCommCode':'COM'
	          ,'guestFirstName':'Guadalupe'
	          ,'guestLastName':'Vera'
	          ,'arrival':new Date()
	          ,'departure':new Date()
	          ,'rateCode':'RATE'
	          ,'currencyCode':'MEX'
	          ,'room':'2010'
	          ,'marketCode':'EU'
	          ,'rateAmount':1000
              ,'periodo':periodo
	        ])

			save(comision)


        comision = new Comision([
	          'travelAgentId':0
	          ,'resvNameId':0
	          ,'travelAgentName':'Extranjera 01'
	          ,'travelAgentDisplayName':'Extranjera 01'
	          ,'iataCorpNo':'555'
	          , 'bankId':100
	          ,'address1':'address1  address1'
	          ,'address2':'address2'
	          ,'address3':'address3'
	          ,'address4':'address4'
	          ,'zipCode':'zip code'
	          ,'city':'city'
	          ,'state':'state'
	          ,'country':'country'
	          ,'grossCommAmt':100
	          ,'vatAmount':14
	          ,'prepaidComm':0
	          ,'commissionableRevenue':2000
	          ,'taCommCode':'COM'
	          ,'guestFirstName':'Israel'
	          ,'guestLastName':'MArtinez'
	          ,'arrival':new Date()
	          ,'departure':new Date()
	          ,'rateCode':'RATE'
	          ,'currencyCode':'US'
	          ,'room':'2010'
	          ,'marketCode':'EU'
	          ,'rateAmount':1000
              ,'periodo':periodo
	        ])

			save(comision)
      
  }

	def save = { comision ->
		if (comision.validate()) {
	        // do something with user
	      }
	      else {
	        comision.errors.allErrors.each {
	          println it
	        }
	      }

	      comision.save(flush: true)
	}

  def destroy = {
  }
}
