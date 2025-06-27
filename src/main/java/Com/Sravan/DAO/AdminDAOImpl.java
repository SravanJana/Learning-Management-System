package Com.Sravan.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(transactionManager = "hibernateTransactionManager")
public class AdminDAOImpl implements AdminDAO {

    private final SessionFactory sessionFactory;

    public AdminDAOImpl(@Qualifier("hibernateSessionFactory") SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional("hibernateTransactionManager")
    public int getUsersCount() {
        Session session = sessionFactory.getCurrentSession();
        Number usersCount = (Number) session.createNativeQuery("SELECT COUNT(*) FROM userDetails").getSingleResult();
        return usersCount.intValue();
    }






    @Override
    public int getInstructorsCount() {
        Session session = sessionFactory.getCurrentSession();
        Number count = (Number) session.createNativeQuery("SELECT COUNT(*) FROM instructor").getSingleResult();
        return count.intValue();
    }

    @Override
    public int getCoursesCount() {
        Session session = sessionFactory.getCurrentSession();
        Number count = (Number) session.createNativeQuery("SELECT COUNT(*) FROM courses").getSingleResult();
        return count.intValue();
    }

}
