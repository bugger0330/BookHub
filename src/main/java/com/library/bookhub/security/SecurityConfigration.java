package com.library.bookhub.security;

import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer.FrameOptionsConfig;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.oidc.IdTokenClaimNames;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.library.bookhub.security.oauth.Oauth2UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfigration implements WebMvcConfigurer {
	
	@Autowired
	private SecurityUserService service;
	
	private final Oauth2UserService oAuth2UserService;
	
	public SecurityConfigration(Oauth2UserService oAuth2UserService) {
        this.oAuth2UserService = oAuth2UserService;
    }
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http
			// 사이트 위변조 방지 비활성화
			.csrf(CsrfConfigurer::disable)
			// X-Frame-Options 비활성화(h2 DB 사용하기 위함)
			.headers(header -> header
					.frameOptions(FrameOptionsConfig::disable))
			// 로그인 설정
			.formLogin(config -> config
					.loginPage("/login")
					.defaultSuccessUrl("/", true)
					.failureUrl("/login?success=401")
	                .usernameParameter("username")
	                .passwordParameter("password")
                    .permitAll())
			// 로그아웃 설정
            .logout(config -> config
                    .logoutUrl("/logout")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .logoutSuccessUrl("/login?success=200"))
            // 자동 로그인 설정
            .rememberMe(remember -> remember
                    .rememberMeParameter("remember")
                    .alwaysRemember(false)
                    .tokenValiditySeconds(60*60*24*30*3)
                    .key("rememberMe")
                    .userDetailsService(service))
            // 소셜 로그인 설정
            .oauth2Login(oauth -> oauth
            		.loginPage("/login")
            		.userInfoEndpoint(userInfo -> userInfo
            				.userService(oAuth2UserService))
            		.clientRegistrationRepository(clientRegistrationRepository())
            		.successHandler(successHandler())
    	            .failureUrl("/login?success=403")
    	            .permitAll())
            // 인가 권한 설정
            .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                    .requestMatchers("/**").permitAll()
                    .requestMatchers("/h2-console/**").permitAll()
                    .requestMatchers(PathRequest.toH2Console()).permitAll()
                    .requestMatchers("/user/**").permitAll()
                    .requestMatchers("/kakao/token/**").permitAll()
                    .requestMatchers("/kakao/**").permitAll()
                    .requestMatchers("/oauth2/**").permitAll()
                    .requestMatchers("/club/**").permitAll()
                    .requestMatchers("/ad/**").permitAll()
                    .requestMatchers("/myPage/**").permitAll()
                    .requestMatchers("/payment/**").permitAll()
                    .requestMatchers("/product-category/**").permitAll()
                    .requestMatchers("/api/**").permitAll()
                    .requestMatchers("/sc-product/**").permitAll()
                    .requestMatchers("/point-product/**").permitAll()
                    .requestMatchers("/css/**", "/js/**", "/img/**", "/lib/**").permitAll());
		
		// 사용자 인증처리 컴포넌트 등록
		http.userDetailsService(service);
		
		return http.build();
			
	}
	
	@Bean
    public AuthenticationSuccessHandler successHandler() {
        return ((request, response, authentication) -> {
            DefaultOAuth2User defaultOAuth2User = (DefaultOAuth2User) authentication.getPrincipal();
 
            String id = defaultOAuth2User.getAttributes().get("id").toString();
            String body = """
                    {"id":"%s"}
                    """.formatted(id);
 
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            response.setCharacterEncoding(StandardCharsets.UTF_8.name());
 
            PrintWriter writer = response.getWriter();
            writer.println(body);
            writer.flush();
        });
    }
	
	
	// 비밀번호 암호화
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// RestTemplate 등록
	@Bean
    public RestTemplate restTemplate(RestTemplateBuilder restTemplateBuilder) {
        return restTemplateBuilder.build();
    }
	
	// 소셜 로그인 등록
	@Bean
	public ClientRegistrationRepository clientRegistrationRepository() {
	    return new InMemoryClientRegistrationRepository(
	        kakaoClientRegistration()
	        //googleClientRegistration(),
	        //naverClientRegistration()
	    );
	}
	
	// 카카오 소셜 로그인
	private ClientRegistration kakaoClientRegistration() {
	    return ClientRegistration.withRegistrationId("kakao")
	            .clientId("daa9133dd9b91f5965b4bdb82517dc70")
	            .clientSecret(null)
	            .redirectUri("http://localhost/login/oauth2/code/kakao")
	            .authorizationUri("https://kauth.kakao.com/oauth/authorize")
	            .tokenUri("https://kauth.kakao.com/oauth/token")
	            .userInfoUri("https://kapi.kakao.com/v2/user/me")
	            .userNameAttributeName("id")
	            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
	            .clientName("Kakao")
	            .build();
	}
	
	// 구글 소셜 로그인
	private ClientRegistration googleClientRegistration() {
	    return ClientRegistration.withRegistrationId("google")
	            .clientId("your-google-client-id")
	            .clientSecret("your-google-client-secret")
	            .redirectUri("your-google-redirect-uri")
	            .authorizationUri("https://accounts.google.com/o/oauth2/auth")
	            .tokenUri("https://www.googleapis.com/oauth2/v4/token")
	            .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
	            .userNameAttributeName(IdTokenClaimNames.SUB)
	            .clientName("Google")
	            .build();
	}
	
	// 네이버 소셜 로그인
	private ClientRegistration naverClientRegistration() {
	    return ClientRegistration.withRegistrationId("naver")
	            .clientId("your-naver-client-id")
	            .clientSecret("your-naver-client-secret")
	            .redirectUri("your-naver-redirect-uri")
	            .authorizationUri("https://nid.naver.com/oauth2.0/authorize")
	            .tokenUri("https://nid.naver.com/oauth2.0/token")
	            .userInfoUri("https://openapi.naver.com/v1/nid/me")
	            .userNameAttributeName("id")
	            .clientName("Naver")
	            .build();
	}
	
}
