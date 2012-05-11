package com.nikko.model

class SecRequestmap {

   String url
   String configAttribute

   static mapping = {
      cache true
   }

   static constraints = {
      url blank: false, unique: true
      configAttribute blank: false
   }
}