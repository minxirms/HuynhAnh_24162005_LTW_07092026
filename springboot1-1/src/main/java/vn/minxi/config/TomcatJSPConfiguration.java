package vn.minxi.config;

import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TomcatJSPConfiguration {

	@Bean
	public WebServerFactoryCustomizer<TomcatServletWebServerFactory> staticResourceCustomizer() {
		return factory -> factory.addContextCustomizers(
				context -> context.addLifecycleListener(new JSPStaticResourceConfigurer(context))
		);
	}
}