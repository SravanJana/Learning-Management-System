package Com.Sravan.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;

@Entity
@Table(name = "instructor")
public class InstructorEntity {
    @Id
    @Column(name = "Instructor_id")
    private int id;
    @NotBlank(message = "*Not null")
    @Column(name = "Instructor_name")
    private String instructorName;
    @Min(value = 1,message = "*>=1")
    @Column(name = "Instructor_EXP")
    private Integer instructorEXP;
    @NotBlank(message = "*Not null")
    @Column(name = "Instructor_email")
    private String instructorEmail;

    @OneToMany(mappedBy = "instructor",fetch = FetchType.EAGER)
    List<Course> courses;

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    @Override
    public String toString() {
        return "Instructor{" +
                "id=" + id +
                ", instructorName='" + instructorName + '\'' +
                ", instructorEXP='" + instructorEXP + '\'' +
                ", instructorEmail='" + instructorEmail + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public Integer getInstructorEXP() {
        return instructorEXP;
    }

    public void setInstructorEXP(Integer instructorEXP) {
        this.instructorEXP = instructorEXP;
    }

    public String getInstructorEmail() {
        return instructorEmail;
    }

    public void setInstructorEmail(String instructorEmail) {
        this.instructorEmail = instructorEmail;
    }
}
