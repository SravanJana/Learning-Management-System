package Com.Sravan.Controller;

import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.SearchClass;
import Com.Sravan.Service.InstructorService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MyController {

    @Autowired
    InstructorService instructorService;

    @GetMapping(value = "/hello")
    @ResponseBody
    public String hello() {
        return "Hello to Leaning Management System";
    }

    @GetMapping("/")
    public String redirectToHome() {
        return "redirect:/home";
    }

    @GetMapping(value = "/home")
    public String homePage() {
        return "LmsHome";
    }


    @RequestMapping(value = "/instructor")
    public String getList(Model model) {
        List<InstructorEntity> instructors = instructorService.getAllInstructors();
        instructors.forEach(System.out::println);
        model.addAttribute("instructors", instructors);
        model.addAttribute("searchClass", new SearchClass());
        return "AdminInstructors";
    }


    @RequestMapping(value = "/addInstructorPage")
    public String addInstructorPage(@ModelAttribute("instructor") InstructorEntity instructor, Model model) {
        model.addAttribute("searchClass", new SearchClass());

        return "AdminAddInstructor";
    }

    @RequestMapping(value = "/processAddInstructorPage")
    public String processAddInstructorPage(@Valid @ModelAttribute("instructor") InstructorEntity instructor, BindingResult bindingResult, Model model) {
        model.addAttribute("searchClass", new SearchClass());
        if (bindingResult.hasErrors()) {
            return "AdminAddInstructor";
        }

        instructorService.saveInstructor(instructor);

        return "redirect:/instructor";

    }


    @RequestMapping(value = "/searchInstructor")
    public String searchInstructor(@ModelAttribute("searchClass") SearchClass search, Model model) {
        System.out.println(search.getName());
        List<InstructorEntity> list = instructorService.getInstructorByName(search.getName());
        model.addAttribute("instructors", list);
        model.addAttribute("searchedName", search.getName());

        System.out.println(list);

        return "SearchPage";
    }

    @RequestMapping(value = "/updateInstructor")
    public String updateStudent(@RequestParam("userID") int userID, Model model) {
        InstructorEntity instructor = instructorService.updateInstructor(userID);
        System.out.println(instructor);
        model.addAttribute("instructor", instructor);
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("userID", userID);
        return "AdminUpdateInstructorPage";
    }

    @RequestMapping(value = "/processUpdateInstructor")
    public String processUpdateInstructor(@RequestParam("userID") int userID, @Valid @ModelAttribute("instructor") InstructorEntity instructor, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "UpdatePage";
        }
        instructor.setId(userID);
        System.out.println(instructor);
        instructorService.processUpdateInstructor(instructor, userID);
        return "redirect:/instructor";

    }

    @RequestMapping(value = "/deleteInstructor")
    public String deleteInstructor(@RequestParam("userID") int userID) {
        System.out.println(userID);
        instructorService.deleteInstructor(userID);
        return "redirect:/instructor";
    }


}


