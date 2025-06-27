package Com.Sravan.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import org.hibernate.query.Query;

@Entity
@Table(name = "lessons")
public class Lesson {
    @Id
    @Column(name = "lesson_id")
    private int lesson_id;
    @Column(name = "lesson_text")
    @NotEmpty(message = "Not Null")
    private String lessonText;
    @Column(name = "lesson_link")
    @NotEmpty(message = "Not Null")
    private String lessonLink;
    @Column(name = "lesson_name")
    @NotEmpty(message = "Not Null")
    private String lessonName;

    @ManyToOne
    @JoinColumn(name = "course_id",nullable = false)
    private Course course;

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getLessonText() {
        return lessonText;
    }

    public void setLessonText(String lessonText) {
        this.lessonText = lessonText;
    }

    public String getLessonLink() {
        return lessonLink;
    }

    public void setLessonLink(String lessonLink) {
        this.lessonLink = lessonLink;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    @Override
    public String toString() {
        return "Lesson{" +
                "lesson_id=" + lesson_id +
                ", lessonLink='" + lessonLink + '\'' +
                ", lessonName='" + lessonName + '\'' +
                '}';
    }
}
