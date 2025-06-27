package Com.Sravan.Configuration;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "Com.Sravan")
@Import(DataSourceConfig.class)
public class HibernateConfig {

    @Bean(name = "hibernateSessionFactory")
    public LocalSessionFactoryBean sessionFactory(DataSource dataSource) {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setPackagesToScan("Com.Sravan.Entity");
        sessionFactory.setHibernateProperties(getHibernateProperties());
        return sessionFactory;
    }

    private Properties getHibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.show_sql", "true");
        properties.put("hibernate.format_sql", "true");
        properties.put("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.current_session_context_class", "org.springframework.orm.hibernate5.SpringSessionContext");

        return properties;
    }

    @Bean(name = "hibernateTransactionManager")
    public PlatformTransactionManager hibernateTransactionManager(@Qualifier("hibernateSessionFactory") SessionFactory sessionFactory) {
        return new HibernateTransactionManager(sessionFactory);
    }
}
