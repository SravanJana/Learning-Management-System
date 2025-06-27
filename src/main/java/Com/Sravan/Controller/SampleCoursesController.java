package Com.Sravan.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleCoursesController {

    @GetMapping(value = "springCourse")
    public String springCourse() {
        return "SpringPage";
    }

    @GetMapping(value = "javaCourse")
    public String javaCourse() {
        return "javaPage";
    }

    @GetMapping(value = "mlCourse")
    public String mlCourse() {
        return "mlPage";
    }
}
