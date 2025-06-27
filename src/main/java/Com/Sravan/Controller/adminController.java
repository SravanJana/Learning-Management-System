package Com.Sravan.Controller;

import Com.Sravan.DAO.AdminDAO;
import Com.Sravan.Entity.Course;
import Com.Sravan.Service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class adminController {

    @Autowired
    AdminDAO adminDAO;

    @Autowired
    CourseService courseService;




    @GetMapping(value = "adminPage")
    public String adminPage(Authentication auth, Model model) {
        model.addAttribute("adminName", auth.getName());

        long usersCount = adminDAO.getUsersCount();
        model.addAttribute("usersCount", usersCount);

        long instructorsCount = adminDAO.getInstructorsCount();
        model.addAttribute("instructorsCount", instructorsCount);

        long coursesCount = adminDAO.getCoursesCount();
        model.addAttribute("coursesCount", coursesCount);


        System.out.println("In adminPage Handler Method");

        List<Course> last8Courses = courseService.getLast8Courses();
        model.addAttribute("courses", last8Courses);


        return "adminPage";
    }

}
