dataSource {
    pooled = true

}
hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
    //cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""

            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
    test {
        dataSource {
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            driverClassName = "net.sourceforge.jtds.jdbc.Driver"
            username = "imartinez"
            password = "iceman1974"
            dbCreate = "update"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
            //url = "jdbc:jtds:sqlserver://w2k3bodb02:1433/Comisiones"
            url = "jdbc:jtds:sqlserver://localhost:1433/Comisiones"
            
        }
    }
}
