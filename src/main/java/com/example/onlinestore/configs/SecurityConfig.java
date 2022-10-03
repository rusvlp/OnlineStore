

package com.example.onlinestore.configs;

import com.example.onlinestore.services.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig{
    private final CustomUserDetailsService userDetailsService;


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{


        http.authorizeRequests()
                .antMatchers("/registration", "/login/*").not().fullyAuthenticated()
                .antMatchers("/product/*/edit", "/product/*/delete", "images/delete/*", "product/add").hasRole("ADMIN")
                .antMatchers("/logout/").hasAnyRole()
                .antMatchers( "/","/product/*","/images/**", "/static/**", "/user/*", "/user", "/user/activate/*", "/cart", "/testCsrfPost",
                        "/testCsrfFetch").permitAll()
                .anyRequest().authenticated()
            .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
            .and()
                .logout()
                .logoutSuccessUrl("/logout/success")
                .permitAll();

        return http.build();
    }







    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(8);
    }
}
