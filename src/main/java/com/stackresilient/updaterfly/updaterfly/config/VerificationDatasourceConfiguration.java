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
public class VerificationDatasourceConfiguration {

  @Value("${spring.app.datasource.verification.locations}")
  private String locations;

  @Bean
  @ConfigurationProperties("spring.app.datasource.verification")
  public DataSourceProperties verificationDataSourceProperties() {
    return new DataSourceProperties();
  }

  @Bean
  @ConfigurationProperties("spring.app.datasource.verification")
  public DataSource verificationDataSource() {
    return verificationDataSourceProperties().initializeDataSourceBuilder()
            .type(HikariDataSource.class).build();
  }

  @PostConstruct
  public void  migrateFlyway(){
    final DataSource dataSource = verificationDataSource();
    Flyway.configure()
            .dataSource(dataSource)
            .locations(locations)
            .load()
            .migrate();
  }
}

