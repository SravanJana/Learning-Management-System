package Com.Sravan.Configuration;

import Com.Sravan.DetermineTargetUrl.CustomLoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity(debug = true)
public class SecurityConfig {

    @Autowired
    HttpSecurity httpSecurity;

    @Autowired
    DataSource dataSource;


    @Bean
    public SecurityFilterChain chain(CustomLoginSuccessHandler successHandler) throws Exception {

        httpSecurity.authorizeHttpRequests(customizer -> {
            customizer.requestMatchers("/", "/index", "/home", "/customLogin", "/WEB-INF/**", "/webapp/**", "/processLogin", "/register",
                    "/processRegistration", "/springCourse", "/javaCourse", "/mlCourse").permitAll();

            customizer.requestMatchers("/editCourse", "/processAddCoursePage", "/processEditCourse",
                    "/addNewCourse", "/addInstructorPage", "adminPage", "/courses",
                    "/students", "instructor", "/courseOverview", "/addLesson", "/editLesson",
                    "/updateInstructor", "/processAddInstructorPage",
                    "/processAddLessonPage", "processEditLessonPage", "/processEditStudent", "/processUpdateInstructor").hasRole("ADMIN");

            customizer.requestMatchers("/deleteStudent", "/deleteInstructor", "/deleteCourse", "/deleteLesson").hasAuthority("DeleteAccess");

            customizer.anyRequest().authenticated();
        });

        httpSecurity.formLogin(customizer -> {
            customizer
                    .loginPage("/customLogin").permitAll()
                    .loginProcessingUrl("/processLogin").permitAll()
                    .successHandler(successHandler);
        });
        httpSecurity.logout(Customizer.withDefaults());
        httpSecurity.httpBasic(Customizer.withDefaults());
        httpSecurity.csrf(AbstractHttpConfigurer::disable);

        httpSecurity.exceptionHandling(exception -> {
            exception.accessDeniedPage("/403");
        });


        return httpSecurity.build();

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Bean
    public JdbcUserDetailsManager userDetailsManager(DataSource dataSource) {
        JdbcUserDetailsManager userDetailsManager = new JdbcUserDetailsManager();
        userDetailsManager.setDataSource(dataSource);
        return userDetailsManager;
    }


}
