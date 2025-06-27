package Com.Sravan.DAO;

import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.Lesson;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import java.util.List;

@Repository
@Transactional(transactionManager = "hibernateTransactionManager")
public class InstructorDAOImpl implements InstructorDAO {

    private final
    SessionFactory sessionFactory;

    public InstructorDAOImpl(@Qualifier("hibernateSessionFactory") SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<InstructorEntity> getAllInstructors() {
        System.out.println("Checking session factory: " + (sessionFactory != null));
        System.out.println("Is Spring transaction active? " + TransactionSynchronizationManager.isActualTransactionActive());

        Session session = sessionFactory.getCurrentSession();
        System.out.println("Is Hibernate session open? " + session.isOpen());
        System.out.println("Is Hibernate transaction active? " + session.getTransaction().isActive());
        System.out.println("Session Active: " + session.isOpen());
        System.out.println("Transaction Active: " + session.getTransaction().isActive());
        Query<InstructorEntity> query = session.createQuery("from InstructorEntity", InstructorEntity.class);
        List<InstructorEntity> list = query.list();




        return list;


    }

    @Override
    public void saveInstructor(InstructorEntity instructor) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(instructor);
    }

    @Override
    public List<InstructorEntity> getInstructorsByName(String instructorName) {
        Session session = sessionFactory.getCurrentSession();
        Query<InstructorEntity> query = session.createQuery("from InstructorEntity where instructorName like lower( :instructorName)",InstructorEntity.class);
        query.setParameter("instructorName","%"+ instructorName.toLowerCase()+"%");
        List<InstructorEntity> list = query.getResultList();
        for (InstructorEntity instructor : list) {
            Hibernate.initialize(instructor.getCourses());
        }
        return list;

    }

    @Override
    public InstructorEntity updateInstructor(int instructorId) {
        Session session = sessionFactory.getCurrentSession();
        InstructorEntity instructor = session.getReference(InstructorEntity.class,instructorId);
        Hibernate.initialize(instructor);
        return instructor;
    }

    @Override
    public void processUpdateInstructor(InstructorEntity instructor, int userID) {
        Session session = sessionFactory.getCurrentSession();
        InstructorEntity instructorEntity = session.getReference(InstructorEntity.class, userID);
        instructorEntity.setInstructorName(instructor.getInstructorName());
        instructorEntity.setInstructorEmail(instructor.getInstructorEmail());
        instructorEntity.setInstructorEXP(instructor.getInstructorEXP());
    }

    @Override
    public void deleteInstructor(int userID) {
        Session session = sessionFactory.getCurrentSession();
        InstructorEntity instructor = session.getReference(InstructorEntity.class,userID);
        session.remove(instructor);
    }

    @Override
    public Course getCourse(int courseId) {
        Session session = sessionFactory.getCurrentSession();
        Course course = session.getReference(Course.class, courseId);
        List<Lesson> lessons = course.getLessons();
        for (Lesson lesson : lessons) {
            Hibernate.initialize(lesson);
        }
        return course;
    }

    @Override
    public Lesson getLesson(int lessonId) {
        Session session = sessionFactory.getCurrentSession();
        Lesson lesson = session.getReference(Lesson.class,lessonId);
        Hibernate.initialize(lesson.getCourse());
        return lesson;
    }

    @Override
    public int saveCourse(Course course) {
        Session session = sessionFactory.getCurrentSession();
        Course persistCourse =new Course();
        persistCourse.setCourseName(course.getCourseName());
        persistCourse.setCourseDescription(course.getCourseDescription());
        persistCourse.setCourseDuration(course.getCourseDuration());
        persistCourse.setInstructor(course.getInstructor());
        System.out.println(persistCourse);
         session.persist(persistCourse);
        System.out.println(persistCourse.getInstructor());
         int id = persistCourse.getCourse_id();
        return id;
    }

    @Override
    public int saveLesson(Lesson lesson) {
        Session session = sessionFactory.getCurrentSession();
        if (lesson.getLesson_id()==0){
            session.persist(lesson);
        }
        else {
            Lesson persistLesson = session.getReference(Lesson.class,lesson.getLesson_id());
            persistLesson.setLessonName(lesson.getLessonName());
            persistLesson.setLessonText(lesson.getLessonText());
            persistLesson.setLessonLink(lesson.getLessonLink());
        }
        return lesson.getLesson_id();
    }

    @Override
    public void deleteLesson(int lessonId) {

        Session session = sessionFactory.getCurrentSession();
        Lesson lesson = session.getReference(Lesson.class,lessonId);
        session.remove(lesson);
    }


}
