package Com.Sravan.Service;

import Com.Sravan.Entity.Course;

import java.util.List;


public interface CourseService {

    public List<Course> getCourses();

    public Course getCourse(int id);

    public void saveCourse(Course course);

    public void deleteCourse(int id);

    public List<Course> getLast8Courses();




}
