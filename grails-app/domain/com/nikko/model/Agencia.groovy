package com.nikko.model

class Agencia extends SecUser {

    static constraints = {
		iataCorpNo blank:false
        nombreCompleto nullable:true
        saludo nullable:true
        nombreAgencia nullable:true
    }

	String iataCorpNo
    String nombreCompleto
    String nombreAgencia
    String saludo
}
