package com.library.bookhub.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer.FrameOptionsConfig;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebSecurity
public class SecurityConfigration implements WebMvcConfigurer {
	
	@Autowired
	private SecurityUserService service;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http
			// 사이트 위변조 방지 비활성화
			.csrf(CsrfConfigurer::disable)
			// X-Frame-Options 비활성화
			.headers(header -> header
					.frameOptions(FrameOptionsConfig::disable))
			// 로그인 설정
			.formLogin(config -> config
					.loginPage("/login")
					.defaultSuccessUrl("/", true)
					.failureUrl("/login?success=200")
	                .usernameParameter("username")
	                .passwordParameter("password")
                    .permitAll())
			// 로그아웃 설정
            .logout(config -> config
                    .logoutUrl("/logout")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .logoutSuccessUrl("/login?success=201"))
            // 인가 권한 설정
            .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                    .requestMatchers("/**").permitAll()
                    .requestMatchers("/h2-console/**").permitAll()
                    .requestMatchers(PathRequest.toH2Console()).permitAll()
                    .requestMatchers("/css/**", "/js/**", "/img/**", "/lib/**").permitAll());
		
		// 사용자 인증처리 컴포넌트 등록
		http.userDetailsService(service);
		
		return http.build();
			
	}
	
	
	// 비밀번호 암호화
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
}
