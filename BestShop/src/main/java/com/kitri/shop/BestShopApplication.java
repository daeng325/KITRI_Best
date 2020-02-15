package com.kitri.shop;

import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication(scanBasePackages= {"com.kitri.shop"})
public class BestShopApplication {
	
	//HTTP port
	@Value("${http.port}")
	private int httpPort;
	
	public static void main(String[] args) {
		SpringApplication.run(BestShopApplication.class, args);
	}
	
	// Let's configure additional connector to enable support for both HTTP and HTTPS
	@Bean
	public ServletWebServerFactory servletContainer() {
		TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
		tomcat.addAdditionalTomcatConnectors(createStandardConnector());
		return tomcat;
	}

	private Connector createStandardConnector() {
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
		connector.setPort(httpPort);
		return connector;
	}
	
//	@Configuration
//	public class ConnectorConfig {
//		@Bean
//	    public ServletWebServerFactory servletContainer() {
//
//	        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory(){
//	            @Override
//	            protected void postProcessContext(Context context) {
//	                SecurityConstraint securityConstraint = new SecurityConstraint();
//	                securityConstraint.setUserConstraint("CONFIDENTIAL");
//	                SecurityCollection collection = new SecurityCollection();
//	                collection.addPattern("/*");
//	                securityConstraint.addCollection(collection);
//	                context.addConstraint(securityConstraint);
//	            }
//	        };
//	        tomcat.addAdditionalTomcatConnectors(createSslConnector());
//	        return tomcat;
//	    }
//
//	    private Connector createSslConnector() {
//	        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
//	        connector.setScheme("http");
//	        connector.setSecure(false);
//	        connector.setPort(8080);
//	        connector.setRedirectPort(8443);
//	        return connector;
//	    }
//	}

}
