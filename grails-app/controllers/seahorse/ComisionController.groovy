package seahorse

import com.nikko.model.*
import groovy.sql.*
import util.*


class ComisionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def scaffold = Comision

    def springSecurityService
	
	def userAgentIdentService

    def mailService

    def index = {
        redirect(action: "list", params: params)
    }

  def nvl={value,base->
    if( value == null){
      return base
    }else{
      return value
    }
  }

    def listx = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [comisionInstanceList: Comision.list(params), comisionInstanceTotal: Comision.count()]
    }

    def test = {
      params.max = Math.min(params.max ? params.int('max') : 10, 100)
      def fecha = new Date().format(Constants.DATE_FORMAT)


      render(view: "list", model:[comisionInstanceList: Comision.findAllByFechaImportacionBetween(fecha,fecha), comisionInstanceTotal: Comision.count()])
    }

	def importar = {

      def fechaImportacion = new Date()

      def intfecha = fechaImportacion.format(Constants.DATE_FORMAT)

    def already = Periodo.findByFechaImportacion(intfecha)

    if( !already ){
      //Produccion
      def sql = Sql.newInstance("jdbc:oracle:thin:@172.16.3.65:1521:OPERA", "OPERA","OPERA", "oracle.jdbc.driver.OracleDriver")
      //Training
      //def sql = Sql.newInstance("jdbc:oracle:thin:@172.16.3.62:1521:OPERA", "OPERA","OPERA", "oracle.jdbc.driver.OracleDriver")

    def query = """
select distinct
	      cc.resort
	      ,cc.travel_agent_id
	      ,cc.resv_name_id
	      ,nva.name as travel_agent_name
	      , nva.display_name as travel_agent_display_name
	      ,nva.iata_corp_no
	      --,cc.resv_name_id
	      ,NAME_REF.get_comm_account_id(cc.travel_agent_id,cc.resort) as bank_id
	      , nva.address1, nva.address2, nva.address3, nva.address4
	      ,nva.zip_code , nva.city, nva.state, nva.country
	      ,cc.gross_comm_amt,cc.vat_amount,cc.prepaid_comm,cc.commissionable_revenue
	      , cc.ta_comm_code
	      , rn.guest_first_name, rn.guest_last_name
	      , rn.begin_date as arrival, rn.end_date as departure
	      , rden.rate_code, rden.currency_code
	      , rde.room, rde.market_code, rde.rate_amount
          , rn.UDFC04 as booker_name
          , rde.external_reference as crs_no
          , rn.CHANNEL as channel
        , rde.ORIGIN_OF_BOOKING as origin_of_booking

        --, na.*
        , na.address_type
        , na.address1 as saddress1, na.address2 as saddress2
        , na.address3 as saddress3, na.address4 as saddress4
	      ,na.zip_code as szip_code , na.city as scity
        , na.state as sstate, na.country as scountry
	from computed_commissions cc
	    , name_view nva
	    , reservation_name rn
	    , reservation_daily_element_name rden
	    , reservation_daily_elements rde
      , name_address na
	    , (select resort, resv_name_id, max(resv_daily_el_seq) as resv_daily_el_seq from reservation_daily_element_name
	group by resort, resv_name_id) rden_max

	where comm_status = 'O'
	    and cc.travel_agent_id = nva.name_id
	    and cc.resv_name_id = rn.resv_name_id
	    and rn.resort = rden.resort
	    and rn.resv_name_id = rden.resv_name_id
	    and rden.resort = rden_max.resort
	    and rden.resv_name_id = rden_max.resv_name_id
	    and rden.resv_daily_el_seq = rden_max.resv_daily_el_seq
	    --and rden.reservation_date = DECODE(SIGN(rn.trunc_end_date -COALESCE(TO_DATE(SYS_CONTEXT('CLIENTCONTEXT','BUSINESS_DATE'),'RRRRMMDD'),TRUNC(SYSTIMESTAMP AT TIME ZONE COALESCE(SYS_CONTEXT('CLIENTCONTEXT','RESORT_TIME_ZONE'),DBTIMEZONE)))), 1,greatest(COALESCE(TO_DATE(SYS_CONTEXT('CLIENTCONTEXT','BUSINESS_DATE'),'RRRRMMDD'),TRUNC(SYSTIMESTAMP AT TIME ZONE COALESCE(SYS_CONTEXT('CLIENTCONTEXT','RESORT_TIME_ZONE'),DBTIMEZONE))), rn.trunc_begin_date ), rn.trunc_end_date)
	    and rden.resort = rde.resort
	    and rden.resv_daily_el_seq = rde.resv_daily_el_seq
	    and rden.reservation_date = rde.reservation_date
	    and cc.ta_comm_code != 'NON'
      and na.name_id (+) = cc.travel_agent_id
      and na.address_type(+) = 'SHIPPING'

	    --and NAME_REF.get_comm_account_id(cc.travel_agent_id,cc.resort) = 61

	    --and cc.commissionable_revenue > 0

	    order by nva.name desc, rn.guest_last_name
    """
    
      def comisiones = sql.rows(query)

      Periodo periodo = new Periodo()

      periodo.setFechaImportacionDate(fechaImportacion)

      periodo.save(flush: true)

      comisiones.each{row->

          def comision = new Comision([
            'travelAgentId':nvl(row.travel_agent_id,0)
            ,'resvNameId':nvl(row.resv_name_id,0)
            ,'travelAgentName':nvl(row.travel_agent_name,'')
            ,'travelAgentDisplayName':nvl(row.travel_agent_display_name,'')
            ,'iataCorpNo':nvl(row.iata_corp_no,'')
            , 'bankId':nvl(row.bank_id,0)
            ,'address1': row.address_type ?nvl(row.saddress1,''):nvl(row.address1,'')
            ,'address2': row.address_type ?nvl(row.saddress2,''):nvl(row.address2,'')
            ,'address3': row.address_type ?nvl(row.saddress3,''):nvl(row.address3,'')
            ,'address4': row.address_type ?nvl(row.saddress4,''):nvl(row.address4,'')
            ,'zipCode': row.address_type ?nvl(row.szip_code,''):nvl(row.zip_code,'')
            ,'city':row.address_type ?nvl(row.scity,''):nvl(row.city,'')
            ,'state':row.address_type ?nvl(row.sstate,''):nvl(row.state,'')
            ,'country':row.address_type ?nvl(row.scountry,''):nvl(row.country,'')
            ,'grossCommAmt':nvl(row.gross_comm_amt,0)
            ,'vatAmount':nvl(row.vat_amount,0)
            ,'prepaidComm':nvl(row.prepaid_comm,0)
            ,'commissionableRevenue':nvl(row.commissionable_revenue,0)
            ,'taCommCode':nvl(row.ta_comm_code,'')
            ,'guestFirstName':nvl(row.guest_first_name,'')
            ,'guestLastName':nvl(row.guest_last_name,'')
            ,'arrival':nvl(row.arrival, new Date())
            ,'departure':nvl(row.departure,new Date())
            ,'rateCode':nvl(row.rate_code,'')
            ,'currencyCode':nvl(row.currency_code,'')
            ,'room':nvl(row.room,'')
            ,'marketCode':nvl(row.market_code,'')
            ,'rateAmount':nvl(row.rate_amount,0)
            , 'periodo':periodo
            ,'crsNo':nvl(row.crs_no,'')
            ,'bookerName':nvl(row.booker_name,'')
            ,'source':nvl(row.origin_of_booking,'')
            ,'origen':nvl(row.channel,'')
          ])
          //println row.address1 + comision

        /*
        if( "PEA".equalsIgnoreCase( comision.rateCode) || "PSFIN".equalsIgnoreCase( comision.rateCode) ){
          comision.rateAmount = comision.rateAmount/1.19
          comision.grossCommAmt = comision.nights *  comision.rateAmount /10
          comision.vatAmount = comision.grossCommAmt * 0.16

        } */

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
        //render 'Se importaron '+comisiones.size()

      params.max = Math.min(params.max ? params.int('max') : 10, 100)

      flash.message = 'Se importaron '+comisiones.size() + ' registros.'

    }else{
      flash.message = 'Se ha importado previamente, favor de eliminar primero el perido.'
    }

    chain(action:'list')
    }


  def data = {
    def periodo = periodoActual(params)

    def pagada
    def status
    def nacionales
    def iata



    if( params.pagada){
      if ( params.pagada == 'true')
        pagada = true
      if ( params.pagada == 'false')
        pagada = false
    }

    if( params.nacionales){
      if ( params.nacionales == 'true')
        nacionales = true
      if ( params.nacionales == 'false')
        nacionales = false
    }

    if( params.iata != null && params.iata != 'null' && params.iata.trim().length() > 0 ){
      iata = params.iata
    }

    if( params.status){
      if ( params.status == Comision.PROCESADA)
        status = Comision.PROCESADA
      if ( params.status == Comision.IMPORTADA )
        status = Comision.IMPORTADA
    }

    def agencia = Agencia.get(springSecurityService.principal.id)
    params.put('USER_NAME',agencia.username)

    def adminRole = SecRole.findByAuthority('ROLE_ADMIN')

    def results = Comision.createCriteria().list(params){
      if( periodo){
          eq('periodo',periodo)
      }
      if ( !agencia.authorities.contains(adminRole)){
        eq('iataCorpNo',agencia.iataCorpNo)
      }

      if( pagada != null ){
        eq('pagada',pagada)
      }

      if( status != null ){
        eq('status',status)
      }

      if( iata != null ){
        eq('iataCorpNo',iata)
      }

      if( nacionales != null){
        if( nacionales ){
          eq('bankId',61)
        }else {
          ne('bankId',61)
        }
      }

      if( params.sort == null )
	    order("travelAgentName", "asc")



    }

  }

  def report = {

    println "report.params: "+params

    params.put('IMAGES_DIR', request.requestURL.substring(0, request.requestURL.lastIndexOf(request.contextPath) + request.contextPath.length())
            + '/images/')
    params.put('SUBREPORT_DIR', request.requestURL.substring(0, request.requestURL.lastIndexOf(request.contextPath) + request.contextPath.length())
            + '/reports/')

    def results = data(params)
    results.each{row->
      if( row.grossCommAmtNew != null )
        row.grossCommAmt = row.grossCommAmtNew

      if( row.vatAmountNew != null)
        row.vatAmount = row.vatAmountNew

      if(row.commissionableRevenueNew != null)
        row.commissionableRevenue = row.commissionableRevenueNew

      if(row.rateAmountNew != null)
        row.rateAmount = row.rateAmountNew

    }

	chain(controller:'jasper',action:'index',model:[data:results],params:params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)

	//def msie = userAgentIdentService.isMsie()

    def periodo = periodoActual(params)

    def results = data(params)

    //[comisionInstanceList: results, periodo:periodo,params:params, msie:msie]
	[comisionInstanceList: results, periodo:periodo,params:params]
  }

    def create = {
        def comisionInstance = new Comision()
        comisionInstance.properties = params
        return [comisionInstance: comisionInstance]
    }

    def save = {
        def comisionInstance = new Comision(params)
        if (comisionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'comision.label', default: 'Comision'), comisionInstance.id])}"
            redirect(action: "show", id: comisionInstance.id)
        }
        else {
            render(view: "create", model: [comisionInstance: comisionInstance])
        }
    }

    def show = {
        def comisionInstance = Comision.get(params.id)
        if (!comisionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
            redirect(action: "list")
        }
        else {
            [comisionInstance: comisionInstance]
        }
    }

    def edit = {
        def comisionInstance = Comision.get(params.id)
        if (!comisionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [comisionInstance: comisionInstance]
        }
    }

    def update = {
        def comisionInstance = Comision.get(params.id)
        if (comisionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (comisionInstance.version > version) {
                    
                    comisionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'comision.label', default: 'Comision')] as Object[], "Another user has updated this Comision while you were editing")
                    render(view: "edit", model: [comisionInstance: comisionInstance])
                    return
                }
            }
            comisionInstance.properties = params
            if (!comisionInstance.hasErrors() && comisionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'comision.label', default: 'Comision'), comisionInstance.id])}"
                redirect(action: "show", id: comisionInstance.id)
            }
            else {
                render(view: "edit", model: [comisionInstance: comisionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def comisionInstance = Comision.get(params.id)
        if (comisionInstance) {
            try {
                comisionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comision.label', default: 'Comision'), params.id])}"
            redirect(action: "list")
        }
    }


    def periodoActual = {
      def periodos = Periodo.listOrderByFechaImportacion(max:1, order:'desc')

      def periodo
      if( params.periodo ){
        periodo = Periodo.get( params.periodo)
      } else{
        if( periodos.size > 0){
          periodo = periodos[0]
        }
      }
      periodo
    }

    def pagar = {
      def periodo = periodoActual(params)

      def results = Comision.executeUpdate("update Comision c set c.pagada = true where c.periodo.id = ${periodo.id}")

      flash.message = "Se marcaron como pagadas ${results} comisiones."
      chain(action:'list')
    }

    def facturar = {
      def periodo = periodoActual(params)

      def results = Comision.executeUpdate("update Comision c set c.facturada = true where c.periodo.id = ${periodo.id}")

      flash.message = "Se marcaron como facturadas ${results} comisiones."
      chain(action:'list')
    }

    def procesar = {



      def periodo = periodoActual(params)

      def results = Comision.executeUpdate("update Comision c set c.status = '${Comision.PROCESADA}' where c.periodo.id = ${periodo.id}")

      ///////////////
      def c = Comision.createCriteria()
      def iatas = c.listDistinct {
        eq('periodo',periodo)
        projections {
          distinct "iataCorpNo"
        }
    }

      println "iata: "+iatas

      iatas.each { iata ->
        def agencias = Agencia.findAllByIataCorpNo(iata)
        agencias.each {agencia->
          notifica(agencia,periodo)
        }

      }
      //////////////

      flash.message = "Se procesaron ${results} comisiones."
      chain(action:'list')
    }


    def notifica(agencia,periodo){

      mailService.sendMail {
         to agencia.email
         //from "john@g2one.com"
         //cc "marge@g2one.com", "ed@g2one.com"
         //bcc "joe@g2one.com"
         subject "Informe Comisiones Nikko "
         // body 'this is some text'
         body( view:"mail",
          plugin:"email-confirmation",
          model:[contact:agencia.nombreCompleto, saludo:agencia.saludo,nombreAgencia:agencia.nombreAgencia, 'periodo':periodo])
      }
    }

    def eliminarImportadas = {
      def periodo = periodoActual(params)

      def message = periodo.toString()

      def results = Comision.executeUpdate("delete from Comision where periodo.id = ${periodo.id} and status = '${Comision.IMPORTADA}'")
      periodo.delete(flush:true)

      flash.message = "Se elimino el periodo ${message}, y ${results} comisiones."
      chain(action:'list')
    }

    def csv = {
      //println 'csv.params: '+params

      /*response.setHeader("Content-disposition", "attachment; filename=" +
      session.userid + ".csv");
      render(contentType: "text/csv", text: "my,comma,seperated,variable,file");*/

      response.contentType = "text/csv"
      response.setHeader("Content-disposition", "attachment; filename=" +
      "nkmex"+new Date().format('MMyydd') + ".csv");
      def hotel = "Hotel Nikko Mexico SA de CV"
      def pattern = "MM-dd-yy"
      def export = data(params)
      export.each{row->
        def rowe = "${row.iataCorpNo},${clean(row.travelAgentDisplayName)},"
            rowe += "${row.commAmt},"
            rowe += "${clean(row.address1)},${clean(row.address2)},${clean(row.address3)},"
            rowe += "${clean(row.city)},${clean(row.state)},${clean(row.zipCode)},"
            rowe += "${clean(row.country)},${hotel},${clean(row.guestFirstName)},"
            rowe += "${clean(row.guestLastName)},${row.arrival.format(pattern)},${row.departure.format(pattern)}"
            rowe +="\r\n"
        response.outputStream << rowe
        //render(rowe)
      }

      if( export.size() == 0 )
        response.outputStream << "No hay datos."

    }

    def clean(cadena){
      cadena.replaceAll("[^a-zA-Z 0-9]*",'')
    }


}
