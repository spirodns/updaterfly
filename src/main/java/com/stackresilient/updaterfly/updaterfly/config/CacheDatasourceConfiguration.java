package com.stackresilient.updaterfly.updaterfly.config;

import com.zaxxer.hikari.HikariDataSource;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;


@Configuration
public class CacheDatasourceConfiguration {

  @Value("${spring.app.datasource.cache.locations}")
  private String locations;

  @Bean
  @ConfigurationProperties("spring.app.datasource.cache")
  public DataSourceProperties CacheDataSourceProperties() {
    return new DataSourceProperties();
  }

  @Bean
  @ConfigurationProperties("spring.app.datasource.cache")
  public DataSource CacheDataSource() {
    return CacheDataSourceProperties().initializeDataSourceBuilder()
            .type(HikariDataSource.class).build();
  }

  @PostConstruct
  public void  migrateFlyway(){
    final DataSource dataSource = CacheDataSource();
    Flyway.configure()
            .dataSource(dataSource)
            .locations(locations)
            .load()
            .migrate();
  }


}

