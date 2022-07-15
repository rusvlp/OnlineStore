

package com.example.onlinestore.configs;

import com.example.onlinestore.services.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.CachingUserDetailsService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;


@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final CustomUserDetailsService userDetailsService;


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http.authorizeRequests()
                .antMatchers("/registration", "/login").not().fullyAuthenticated()
                .antMatchers("/question/ask", "question/add, /question/*/addAnswer", "/test").hasAnyRole()
                .antMatchers( "/", "/question/*", "/images/**", "/static/**", "/user/*", "/user", "/user/activate/*").permitAll()
                .anyRequest().authenticated()
            .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
            .and()
                .logout()
                .permitAll();
        return http.build();
    }

   /*@Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticationManagerBuilder builder) throws Exception {
        return builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder()).and().build();
    }*/

    /*@Bean
    AuthenticationManager authenticationManager(AuthenticationManagerBuilder builder) throws Exception {
        return builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder()).and().build();
    } */


    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(8);
    }
}
