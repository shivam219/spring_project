package com.timesheet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserPrincipalDetailsService userPrincipalDetailsService;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/js/**");
		web.ignoring().antMatchers("/css/**");
		web.ignoring().antMatchers("/images/**");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/forget-pass", "/forget-pass-get-otp", "/forget-pass-change-pass")
				.permitAll();
		http.rememberMe().userDetailsService(userPrincipalDetailsService);
//		http.authorizeRequests().antMatchers("/home").hasAuthority("Admin");
//		http.authorizeRequests().antMatchers("/home").hasRole("Admin");
//		http.authorizeRequests().antMatchers("/home").hasAnyRole("",""); 
//		http.formLogin().loginPage("").usernameParameter("empId").passwordParameter("");
		http.authorizeRequests().antMatchers("/resources/**").permitAll().anyRequest().authenticated().and().formLogin()
				.loginPage("/login").defaultSuccessUrl("/login-success").failureUrl("/login-error").permitAll().and()
				.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login").permitAll();
		http.csrf().disable();
	}

	@Bean
	DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
		daoAuthenticationProvider.setUserDetailsService(this.userPrincipalDetailsService);
		return daoAuthenticationProvider;
	}

	@Bean
	PasswordEncoder passwordEncoder() {
		return NoOpPasswordEncoder.getInstance();
//		return new BCryptPasswordEncoder();
	}
	/*
	 * 
	 * <bean id="messageSource"
	 * class="org.springframework.context.support.ResourceBundleMessageSource">
	 * <property name="basenames"> <list> <value>mymessages</value> </list>
	 * </property> </bean>
	 */

	@Bean
	public ResourceBundleMessageSource getLoginError() {
		ResourceBundleMessageSource error = new ResourceBundleMessageSource();
		error.setBasename("Bad Credentials employee id & password");
		return error;

	}

}
