package Com.Sravan.Configuration;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DriverManagerDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;

@Configuration
@PropertySource(value = "classpath:db.properties")
public class DataSourceConfig {

    @Value("${db_username}")
    String username;

    @Value("${db_password}")
    String password;

    @Bean
    public DataSource dataSource() throws PropertyVetoException {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://mysql-3074c864-spring-boot-mysql.i.aivencloud.com:19025/lms");
        dataSource.setUser(username);
        dataSource.setPassword(password);
        System.out.println("hello world");
        return dataSource;
    }

}
