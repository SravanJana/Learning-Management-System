package Com.Sravan.Controller;

import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.Lesson;
import Com.Sravan.Entity.SearchClass;
import Com.Sravan.Service.InstructorService;
import jakarta.validation.Valid;
import org.hibernate.grammars.hql.HqlParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class LessonController {
    @Autowired
    InstructorService instructorService;

    @RequestMapping(value = "/addLesson")
    public String addLessonHm(@RequestParam("courseId") int courseId, Model model) {

        Lesson lesson = new Lesson();
        Course course = instructorService.getCourse(courseId);
        lesson.setCourse(course);
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("lesson",lesson);
        System.out.println(lesson);
        model.addAttribute("course", course);


        return "AdminAddLessonPage";
    }


    @PostMapping(value = "processAddLessonPage")
    public String processAddLessonHm(@RequestParam("courseId") int courseId, @Valid @ModelAttribute("lesson") Lesson lesson, BindingResult bindingResult, Model model) {
        model.addAttribute("searchClass", new SearchClass());
        Course course =instructorService.getCourse(courseId);
        lesson.setCourse(course);
        model.addAttribute("lesson",lesson);
        if (bindingResult.hasErrors()) {
            return "AdminAddLessonPage";
        }
        System.out.println(course);
        System.out.println(lesson);
        System.out.println(lesson.getCourse().getCourse_id());
        instructorService.saveLesson(lesson);
        return "redirect:/courseOverview?courseId="+ courseId;
    }


    @RequestMapping(value = "/editLesson")
    public String editLesson(@RequestParam("lessonId") int lessonId,@RequestParam("courseId") int courseId, Model model) {
        Lesson lesson = instructorService.getLesson(lessonId);
        Course course = instructorService.getCourse(courseId);
        lesson.setCourse(course);
        lesson.setLesson_id(lessonId);
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("lesson",lesson);
        model.addAttribute("courseId", courseId);
        model.addAttribute("lessonId", lessonId);
        System.out.println(lesson);

        return "AdminEditLessonPage";
    }

    @PostMapping(value = "/processEditLessonPage")
    public String processEditLessonPage(@Valid @ModelAttribute("lesson") Lesson lesson,BindingResult bindingResult ,@RequestParam(value = "courseId") int courseId ,Model model) {
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("lesson",lesson);
        Course course = instructorService.getCourse(courseId);
        lesson.setCourse(course);
        if (bindingResult.hasErrors()) {
            return "AdminEditLessonPage";
        }
        System.out.println(course);
        System.out.println(lesson.getCourse().getCourse_id());
        System.out.println(lesson);
        instructorService.saveLesson(lesson);
        return "redirect:/courseOverview?courseId="+ courseId;
    }

    @GetMapping(value = "deleteLesson")
    public String deleteLesson(@RequestParam("lessonId") int lessonId,@RequestParam("courseId") String courseId, Model model) {

        instructorService.deleteLesson(lessonId);
        return "redirect:/courseOverview?courseId="+ courseId;
    }




}
