package com.edu.realestate.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.scheduling.annotation.EnableAsync;

@Configuration
@Import(ServiceConfig.class)
public class WebConfig {

	@Bean
	DataSource dataSource() {
		JndiDataSourceLookup ds = new JndiDataSourceLookup();
		ds.setResourceRef(true);
		return ds.getDataSource("java:/comp/env/jdbc/RealEstate");
	}

}
