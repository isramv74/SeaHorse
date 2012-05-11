package com.nikko.model

import util.*

class Comision {

	
    static constraints = {
      bookerName nullable:true
      source nullable:true
      origen nullable:true
      confirmationCxlNo nullable:true
      crsNo nullable:true
      notas nullable:true
      status(blank:false,inList:[IMPORTADA, PROCESADA] ,defaultValue:IMPORTADA)
      grossCommAmtNew nullable:true
      vatAmountNew nullable:true
      commissionableRevenueNew nullable:true
      rateAmountNew nullable:true
    }

    static belongsTo =[periodo:Periodo]

    Integer travelAgentId
    Integer resvNameId
	String travelAgentName
	String travelAgentDisplayName
	String iataCorpNo
    Integer bankId
	String address1
	String address2
	String address3
	String address4
	String zipCode
	String city
	String state
	String country

    //Replicado
	BigDecimal grossCommAmt
    BigDecimal grossCommAmtNew

    //Replicado
	BigDecimal vatAmount
    BigDecimal vatAmountNew


	BigDecimal prepaidComm

    //Replicado
	BigDecimal commissionableRevenue
    BigDecimal commissionableRevenueNew

    String taCommCode
    String guestFirstName
    String guestLastName
    Date arrival
    Date departure
    String rateCode
    String currencyCode
    String room
    String marketCode

    //Replicado
    BigDecimal rateAmount
    BigDecimal rateAmountNew

    String bookerName
    String source
    String origen
    String confirmationCxlNo
    String crsNo
	
	String status = IMPORTADA
    boolean pagada = false
    boolean facturada = false

    String notas

    static String IMPORTADA = 'IMPORTADA'
    static String PROCESADA = 'PROCESADA'

    static transients = ['nights','commAmt']

    int getNights(){
      (departure.time - arrival.time)/ (24 * 60 * 60 * 1000)
    }

    BigDecimal getCommAmt(){
      def result = 0
      if( grossCommAmtNew != null){
        result+= grossCommAmtNew
      }else{
        result+= grossCommAmt
      }

      if( vatAmountNew != null){
        result+= vatAmountNew
      }else{
        result+= vatAmount
      }
      result
    }

}
