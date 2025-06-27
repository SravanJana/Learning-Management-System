package Com.Sravan.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

import java.util.List;

@Entity
@Table(name = "courses")
public class Course {
    @Id
    @Column(name = "course_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int course_id;

    @Column(name = "course_name")
    @NotEmpty(message = "*Not Null")
    private String courseName;

    @Column(name = "course_duration")
    @NotEmpty(message = "*Not NUll")
    private String courseDuration;



    @Column(name = "course_description")
    @NotEmpty(message = "*Not NUll")
    private String courseDescription;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "instructor_id")
    private InstructorEntity instructor;

    @OneToMany(mappedBy = "course",fetch = FetchType.EAGER)
    List<Lesson> lessons;

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(String courseDuration) {
        this.courseDuration = courseDuration;
    }

    public InstructorEntity getInstructor() {
        return instructor;
    }

    public void setInstructor(InstructorEntity instructor) {
        this.instructor = instructor;
    }
    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;

    }

    @Override
    public String toString() {
        return "Course{" +
                "course_id=" + course_id +
                ", courseName='" + courseName + '\'' +
                ", courseDuration='" + courseDuration + '\'' +
                ", courseDescription='" + courseDescription + '\'' +
                ", instructor=" + instructor +
                ", lessons=" + lessons +
                '}';
    }
}
