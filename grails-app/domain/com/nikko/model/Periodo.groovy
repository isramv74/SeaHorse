package com.nikko.model

import util.*

class Periodo {

    static constraints = {
    }

    static transients = ['fechaImportacionDate']

    Integer fechaImportacion

    void setFechaImportacionDate(Date fecha){
      fechaImportacion = fecha?.format(Constants.DATE_FORMAT).toInteger()
    }

    Date getFechaImportacionDate(){
      new Date().parse(Constants.DATE_FORMAT,""+fechaImportacion)
    }

    public String toString(){
      getFechaImportacionDate().format(Constants.DISPLAY_DATE_FORMAT)
  }


}
