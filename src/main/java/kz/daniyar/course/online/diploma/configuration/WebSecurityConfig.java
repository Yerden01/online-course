package kz.daniyar.course.online.diploma.configuration;

import kz.daniyar.course.online.diploma.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().ignoringAntMatchers("/webview/**")
        .and()
            .authorizeRequests()
//                .antMatchers("/**").authenticated()
                .antMatchers("/add-first-user").permitAll()
                .antMatchers("/data").permitAll()
                .antMatchers("/webview/**").permitAll()
                .antMatchers("/static/**").permitAll()
                .antMatchers("/webview-files/**").permitAll()
                .antMatchers("/images/**", "/css/**", "/assets/**", "/img/**", "/js/**", "/scss/**", "/vendor/**").permitAll()
                .antMatchers("/").permitAll()
                .antMatchers("/registration", "/login", "/default").permitAll()
            .anyRequest().authenticated()
        .and()
            .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/default", true)
        .and()
            .logout();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }
}
