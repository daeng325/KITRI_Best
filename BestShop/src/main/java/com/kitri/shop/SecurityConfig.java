package com.kitri.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.kitri.shop.db.service.CustomUserDetailsService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Configuration
@Log
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;

//	@Autowired
//	OAuth2ClientContext oauth2ClientContext;
	
	// Password Encoder 등록
	@Bean
	public PasswordEncoder passwordEncoder() {
	  return new BCryptPasswordEncoder();
	}
	
	// 인증방식
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		log.info("build Auth global.............");
		auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
	}
	
	// Security 제외 패턴 
	@Override
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/css/**", "/jpg/**", "/movie/**", "/fonts/**", "lib/**");
	}
	
	// 각종 시큐어 패턴등록
	@Override
    protected void configure(HttpSecurity http) throws Exception {
		log.info("security config....................");
        http.authorizeRequests()
                // 페이지 권한 설정
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/user/mypage").hasRole("MEMBER")
                .antMatchers("/**").permitAll()
                .antMatchers("/board/**").authenticated()
//                .anyRequest().authenticated()
            .and() // 로그인 설정
                .formLogin()
                .loginPage("/user/login")
                .loginProcessingUrl("/user/login")
                .defaultSuccessUrl("/")
                .usernameParameter("id")
                .failureUrl("/login")
                .permitAll()
            .and() // 로그아웃 설정
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
//                .deleteCookies("login")
            .and()
                // 403 예외처리 핸들링
                .exceptionHandling().accessDeniedPage("/user/denied");
    }
	
//	@Bean
//	public AuthenticationSuccessHandler successHandler() {
//	    return new CustomLoginSuccessHandler("/"); //default로 이동할 url
//	}

	
	
//	private Filter ssoFilter() {
//		  CompositeFilter filter = new CompositeFilter();
//		  List<Filter> filters = new ArrayList<>();
//		  filters.add(ssoFilter(facebook(), "/login/facebook"));
//		  filters.add(ssoFilter(github(), "/login/github"));
//		  filter.setFilters(filters);
//		  return filter;
//		}
//		
//		private Filter ssoFilter(ClientResources client, String path) {
//		  OAuth2ClientAuthenticationProcessingFilter filter = new OAuth2ClientAuthenticationProcessingFilter(path);
//		  OAuth2RestTemplate template = new OAuth2RestTemplate(client.getClient(), oauth2ClientContext);
//		  filter.setRestTemplate(template);
//		  UserInfoTokenServices tokenServices = new UserInfoTokenServices(
//		      client.getResource().getUserInfoUri(), client.getClient().getClientId());
//		  tokenServices.setRestTemplate(template);
//		  filter.setTokenServices(tokenServices);
//		  return filter;
//		}
//		
//		class ClientResources {
//		  @NestedConfigurationProperty
//		  private AuthorizationCodeResourceDetails client = new AuthorizationCodeResourceDetails();
//		  @NestedConfigurationProperty
//		  private ResourceServerProperties resource = new ResourceServerProperties();
//		  public AuthorizationCodeResourceDetails getClient() {
//		    return client;
//		  }
//		  public ResourceServerProperties getResource() {
//		    return resource;
//		  }
//		}
//		
//		@Bean
//		@ConfigurationProperties("github")
//		public ClientResources github() {
//		  return new ClientResources();
//		}
//		@Bean
//		@ConfigurationProperties("facebook")
//		public ClientResources facebook() {
//		  return new ClientResources();
//		}
//		
//		@Bean
//		public FilterRegistrationBean oauth2ClientFilterRegistration(
//		    OAuth2ClientContextFilter filter) {
//		  FilterRegistrationBean registration = new FilterRegistrationBean();
//		  registration.setFilter(filter);
//		  registration.setOrder(-100);
//		  return registration;
//		}
}