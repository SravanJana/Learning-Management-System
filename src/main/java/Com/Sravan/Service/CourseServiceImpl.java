package Com.Sravan.Service;

import Com.Sravan.Entity.Course;
import Com.Sravan.JpaRepositories.CoursesRepository;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(transactionManager = "jpaTransactionManager" )
public class CourseServiceImpl  implements CourseService {


    @Autowired
    CoursesRepository coursesRepository;


    @Override
    public List<Course> getCourses() {

        List<Course> all = coursesRepository.findAll();

        return all;
    }

    @Override
    @Transactional(transactionManager = "jpaTransactionManager" )
    public Course getCourse(int id) {


        Course course = coursesRepository.findById(id).orElseThrow(() -> new RuntimeException("Course Not Found"));
        Hibernate.initialize(course.getInstructor());
        return course;
    }

    @Override
    public void saveCourse(Course course) {

        System.out.println("inside saveCourse");
        System.out.println(course);
        Course savedCourse = coursesRepository.save(course);
    }

    @Override
    public void deleteCourse(int id) {
        coursesRepository.deleteById(id);
    }

    @Override
    @Transactional(transactionManager = "jpaTransactionManager" )
    public List<Course> getLast8Courses() {

        List<Course> list = coursesRepository.findLastEightUsersNative();

        return list;
    }

}
