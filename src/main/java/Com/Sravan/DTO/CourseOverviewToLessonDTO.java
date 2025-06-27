package Com.Sravan.DTO;

import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.SearchClass;

public class CourseOverviewToLessonDTO {
    Course course;
    int courseListSize;
    SearchClass searchClass;
    int firstNumber;
    String  courseName;
    String courseId;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(int firstNumber) {
        this.firstNumber = firstNumber;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getCourseListSize() {
        return courseListSize;
    }

    public void setCourseListSize(int courseListSize) {
        this.courseListSize = courseListSize;
    }

    public SearchClass getSearchClass() {
        return searchClass;
    }

    public void setSearchClass(SearchClass searchClass) {
        this.searchClass = searchClass;
    }


}
