package Com.Sravan.DAO;

import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.Lesson;

import java.util.List;

public interface InstructorDAO {
    List<InstructorEntity> getAllInstructors();
    void saveInstructor(InstructorEntity instructor);
    List<InstructorEntity> getInstructorsByName(String instructorName);
    InstructorEntity updateInstructor(int instructorId);

    void processUpdateInstructor(InstructorEntity instructor, int userID);

    void deleteInstructor(int userID);

    Course getCourse(int courseId);

    Lesson getLesson(int lessonId);

    int saveCourse(Course course);

    int saveLesson(Lesson lesson);

    void deleteLesson(int lessonId);
}
