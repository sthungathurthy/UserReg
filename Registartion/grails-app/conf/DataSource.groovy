dataSource {
    pooled = true
    driverClassName = "oracle.jdbc.driver.OracleDriver"
    dialect = "org.hibernate.dialect.Oracle10gDialect"
    properties {
        maxActive = 50
        maxIdle = 25
        minIdle = 5
        initialSize = 5
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000
        numTestsPerEvictionRun = 3
        testOnBorrow = true
        testWhileIdle = true
        testOnReturn = true
        validationQuery = "SELECT 1 FROM DUAL"
    }
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create"
            url = "jdbc:oracle:thin:@localhost:1521:orcl"
            username = "user_reg"
            password = "user_reg"
            loggingSql = true
            autoReconnect = true
        }
    }
    test {
        dataSource {
            url = "jdbc:oracle:thin:@localhost:1521:orcl"
            username = "user_reg"
            password = "user_reg"
        }
    }
    production {
        dataSource {
            dbCreate = "create"
            url = "jdbc:oracle:thin:@localhost:1521:orcl"
            username = "user_reg"
            password = "user_reg"
        }
    }
}
