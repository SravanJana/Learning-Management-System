package Com.Sravan.Service;

import Com.Sravan.DTO.RegistrationDTO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(transactionManager = "hibernateTransactionManager")
public class RegistrationServiceImpl implements RegistrationService{
    @Autowired
    JdbcUserDetailsManager jdbcUserDetailsManager;
    @Autowired
    PasswordEncoder passwordEncoder;

    public final SessionFactory sessionFactory;

    public RegistrationServiceImpl(JdbcUserDetailsManager jdbcUserDetailsManager, PasswordEncoder passwordEncoder,@Qualifier("hibernateSessionFactory") SessionFactory sessionFactory) {
        this.jdbcUserDetailsManager = jdbcUserDetailsManager;
        this.passwordEncoder = passwordEncoder;
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void saveMainUser(RegistrationDTO regDTO) {
        String encodedPassword = passwordEncoder.encode(regDTO.getPassword());
        System.out.println(regDTO);

        ArrayList<GrantedAuthority> roles = new ArrayList<>();
        GrantedAuthority role1 = new SimpleGrantedAuthority("ROLE_USER");
        roles.add(role1);

        UserDetails user = User.withUsername(regDTO.getUserName()).password(encodedPassword).authorities(roles).build();

        jdbcUserDetailsManager.createUser(user);


    }

    @Override
    public void saveUserDetails(RegistrationDTO regDTO) {
        String encodedPassword = passwordEncoder.encode(regDTO.getPassword());

        System.out.println(regDTO);

        List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));

        Session session = sessionFactory.getCurrentSession();

        String sql = "INSERT INTO userDetails (yourname, username, email, password) VALUES (:name, :username, :email, :password)";

        NativeQuery<?> query = session.createNativeQuery(sql);
        query.setParameter("name", regDTO.getName());
        query.setParameter("username", regDTO.getUserName());
        query.setParameter("email", regDTO.getEmail());
        query.setParameter("password", encodedPassword);

        query.executeUpdate();
    }
}
