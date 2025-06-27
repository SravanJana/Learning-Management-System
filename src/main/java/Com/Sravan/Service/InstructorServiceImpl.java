package Com.Sravan.Service;

import Com.Sravan.DAO.InstructorDAO;
import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.Lesson;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(transactionManager = "hibernateTransactionManager")
public class InstructorServiceImpl implements InstructorService {
    @Autowired
    InstructorDAO instructorDAO;

    @Override
    public List<InstructorEntity> getAllInstructors() {
        List<InstructorEntity> list = new ArrayList<InstructorEntity>();
        list = instructorDAO.getAllInstructors();
        for (InstructorEntity instructor : list) {
            Hibernate.initialize(instructor.getCourses());
            for (Course course : instructor.getCourses()) {
                Hibernate.initialize(course.getLessons());
            }
        }

        return list;
    }

    @Override
    public void saveInstructor(InstructorEntity instructor) {
        instructorDAO.saveInstructor(instructor);
    }

    @Override
    public List<InstructorEntity> getInstructorByName(String instructorName) {
        List<InstructorEntity> list = instructorDAO.getInstructorsByName(instructorName);
        return list;

    }

    @Override
    public InstructorEntity updateInstructor(int instructorId) {
         return instructorDAO.updateInstructor(instructorId);
    }

    @Override
    public void processUpdateInstructor(InstructorEntity instructor, int userID) {
        instructorDAO.processUpdateInstructor(instructor,userID);
    }

    @Override
    public void deleteInstructor(int userID) {
        instructorDAO.deleteInstructor(userID);
    }

    @Override
    public Course getCourse(int courseId) {
        return instructorDAO.getCourse(courseId);
    }

    @Override
    public Lesson getLesson(int lessonId) {
        return instructorDAO.getLesson(lessonId);
    }

    @Override
    public int saveCourse(Course course) {
        return instructorDAO.saveCourse(course);
    }

    @Override
    public int saveLesson(Lesson lesson) {
        return instructorDAO.saveLesson(lesson);
    }

    @Override
    public void deleteLesson(int lessonId) {
        instructorDAO.deleteLesson(lessonId);
    }
}
