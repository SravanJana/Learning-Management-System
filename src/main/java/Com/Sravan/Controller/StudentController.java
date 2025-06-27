package Com.Sravan.Controller;

import Com.Sravan.Entity.userDetailsCPK;
import Com.Sravan.Entity.userDetailsEntity;
import Com.Sravan.Entity.usersEntity;
import Com.Sravan.Service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    @GetMapping(value = "students")
    public String students(Model model) {
        List<userDetailsEntity> usersEntityList = studentService.getStudents();

        model.addAttribute("students", usersEntityList);
        return "AdminStudents";
    }

    @GetMapping(value = "editStudent")
    public String editStudent(@RequestParam("studentUserName") String username ,@RequestParam("password") String password ,Model model) {

        userDetailsCPK userDetailsCPK = new userDetailsCPK();
        userDetailsCPK.setUsername(username);
        userDetailsCPK.setPassword(password);

        userDetailsEntity student = studentService.getStudent(userDetailsCPK);
        System.out.println("inside editStudent");
        System.out.println(student);

        model.addAttribute("student", student);
        model.addAttribute("username", username);
        return "AdminEditStudentPage";

    }

    @PostMapping(value = "processEditStudent")
    public String processEditStudent(@RequestParam("username") String username, @Valid @ModelAttribute userDetailsEntity student, BindingResult bs , Model model) {
        if (bs.hasErrors()) {
            return "AdminEditStudentPage";
        }

        System.out.println("inside processEditStudent");
        System.out.println(student);


        studentService.saveStudent(student,username);

        return "redirect:/students";

    }

    @GetMapping(value = "/deleteStudent")
    public String deleteStudent(@RequestParam("studentUserName") String username ,@RequestParam("password") String password){

        userDetailsCPK userDetailsCPK = new userDetailsCPK();
        userDetailsCPK.setUsername(username);
        userDetailsCPK.setPassword(password);

        System.out.println("inside deleteStudent");
        studentService.deleteStudent(userDetailsCPK);
        return "redirect:/students";
    }




}
