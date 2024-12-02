package com.org.CRMUniq.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.org.CRMUniq.service.securityseervice.CustomAuthenticationSuccessHandler;
import com.org.CRMUniq.service.securityseervice.CustomLogoutSuccessHandler;

/**
 *
 * @author raitis
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

	private static final String[] WHITELIST = { "/","/views/**", "/views/css/**", "/views/fragments/**"

	};

	@Bean
	public PasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	
	@Autowired private 
	CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	@Autowired private 
	CustomLogoutSuccessHandler customLogoutSuccessHandler;
	@Bean
	public SecurityFilterChain config(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests((auth) -> auth.requestMatchers(WHITELIST).permitAll().anyRequest().authenticated()
		)
		.formLogin(form ->
		form .loginPage("/") .
		loginProcessingUrl("/login") .
		usernameParameter("username") .
		passwordParameter("password") 
		.successHandler(customAuthenticationSuccessHandler). // Use custom success handler
		//defaultSuccessUrl("/AdminHome", true) .
		failureUrl("/login?error") .
		permitAll() ) 
		.logout(logout -> logout 
				.logoutUrl("/logout") 
				.logoutSuccessHandler(customLogoutSuccessHandler) // Use custom success handler
				//.logoutSuccessUrl("/logout?success")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()) 
		.csrf(csrf -> csrf.disable())
		;
        
		
		return http.build();
	}
}
