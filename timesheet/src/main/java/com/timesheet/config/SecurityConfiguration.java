package com.timesheet.config;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.timesheet.repository.UserGroupMappingRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserPrincipalDetailsService userPrincipalDetailsService;

	@Autowired
	UserGroupMappingRepository rgmp;

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
		List<String[]> urlRoles = rgmp.findGroupSecurty();
		for (Iterator<String[]> it = urlRoles.iterator(); it.hasNext();) {
			String[] url = it.next();
			System.out.println(url[0]);
			String roles[] = url[1].split(",");
			for (int i = 0; i < roles.length; i++) {
				roles[i] = roles[i].replace(" ", "_");
				System.out.print(roles[i]+" ");
			}
			http.authorizeRequests().antMatchers("/"+url[0]).hasAnyRole(roles);
//			http.authorizeRequests().antMatchers(url[0]).hasAnyRole(roles);


//			System.out.println(roles);
//			
		}
		m1();

//		http.authorizeRequests().antMatchers("/user-master").hasAnyRole("adm","prjec");
//		http.authorizeRequests().antMatchers("/home").hasAuthority("Admin");
//		http.authorizeRequests().antMatchers("/user-master").hasAnyRole("",""); 
//		http.formLogin().loginPage("").usernameParameter("empId").passwordParameter("");
		http.authorizeRequests().antMatchers("/resources/**").permitAll().anyRequest().authenticated().and().formLogin()
				.loginPage("/login").defaultSuccessUrl("/login-success").failureUrl("/login-error").permitAll().and()
				.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
				.permitAll();
		http.csrf().disable();
	}

	@Bean
	DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
		daoAuthenticationProvider.setUserDetailsService(this.userPrincipalDetailsService);
		return daoAuthenticationProvider;
	}

	private void m1() {
		System.out.println("m1 lonig");
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
