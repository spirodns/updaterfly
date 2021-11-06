package com.stackresilient.updaterfly.updaterfly.config;

import com.zaxxer.hikari.HikariDataSource;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

@Configuration
public class BusinessDatasourceConfiguration {

  @Value("${spring.app.datasource.business.locations}")
  private String locations;

  @Primary
  @Bean
  @ConfigurationProperties("spring.app.datasource.business")
  public DataSourceProperties businessDataSourceProperties() {
    return new DataSourceProperties();
  }

  @Primary
  @Bean
  @ConfigurationProperties("spring.app.datasource.business")
  public DataSource businessDataSource() {
    return businessDataSourceProperties().initializeDataSourceBuilder()
            .type(HikariDataSource.class).build();
  }

  @PostConstruct
  public void  migrateFlyway(){
    final DataSource dataSource = businessDataSource();
    Flyway.configure()
            .dataSource(dataSource)
            .locations(locations)
            .load()
            .migrate();
  }
}

