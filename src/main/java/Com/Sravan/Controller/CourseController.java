package Com.Sravan.Controller;

import Com.Sravan.DTO.CourseOverviewToLessonDTO;
import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.Lesson;
import Com.Sravan.Entity.SearchClass;
import Com.Sravan.Service.CourseService;
import Com.Sravan.Service.InstructorService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private InstructorService instructorService;



    @Autowired
    private CourseService courseService;


    @RequestMapping(value = "/courses")
    public String getList(Model model) {
        List<Course> courses = courseService.getCourses();
        model.addAttribute("courses", courses);
        model.addAttribute("searchClass", new SearchClass());
        return "AdminCourses";
    }

    @RequestMapping(value = "/courseOverview")
    public String viewLessons(@RequestParam("courseId") int courseId, @RequestParam(value = "pageNumber",required = false) String pageNumber, Model model, HttpServletRequest request) {

        PagedListHolder<Lesson> pagedListHolder = new PagedListHolder<>();
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("courseId", courseId);
        Course course = null;
        List<Lesson> lessons1a = null;
        if (pageNumber == null) {
            course = instructorService.getCourse(courseId);
            System.out.println(course);
            List<Lesson> lessons = course.getLessons();
            pagedListHolder.setSource(lessons);
            pagedListHolder.setPageSize(3);
            pagedListHolder.setPage(0);
            HttpSession session = request.getSession();
            session.setAttribute("course", course);
            session.setAttribute("lessons", pagedListHolder);
            model.addAttribute("lessons", pagedListHolder);
        } else if (pageNumber.equals("prev")) {
            HttpSession session = request.getSession();
            pagedListHolder = (PagedListHolder<Lesson>) session.getAttribute("lessons");
            pagedListHolder.previousPage();


        } else if (pageNumber.equals("next")) {
            HttpSession session = request.getSession();
            pagedListHolder = (PagedListHolder<Lesson>) session.getAttribute("lessons");
            pagedListHolder.nextPage();
        } else {
            HttpSession session = request.getSession();
            pagedListHolder = (PagedListHolder<Lesson>) session.getAttribute("lessons");
            pagedListHolder.setPage(Integer.parseInt(pageNumber));
            pagedListHolder.setPageSize(3);
        }


        course = (Course) request.getSession().getAttribute("course");
        CourseOverviewToLessonDTO courseOverviewToLessonDTO = new CourseOverviewToLessonDTO();
        courseOverviewToLessonDTO.setCourse(course);
        assert course != null;
        courseOverviewToLessonDTO.setCourseId(String.valueOf(course.getCourse_id()));
        courseOverviewToLessonDTO.setCourseListSize(course.getLessons().size());
        courseOverviewToLessonDTO.setSearchClass(new SearchClass());
        courseOverviewToLessonDTO.setCourseName(course.getCourseName());

        System.out.println(courseOverviewToLessonDTO.getCourseId());
        if (!course.getLessons().isEmpty()) {
            courseOverviewToLessonDTO.setFirstNumber(course.getLessons().get(0).getLesson_id());
        }
        model.addAttribute("courseOverviewToLessonDTO", courseOverviewToLessonDTO);
        model.addAttribute("searchClass", new SearchClass());

        return "AdminCourseOverview";

    }


    @RequestMapping(value = "/lessonPage")
    public String lessonPage(@RequestParam("lessonID") int lessonId,CourseOverviewToLessonDTO courseOverviewToLessonDTO,Model model) {
        Lesson lesson =instructorService.getLesson(lessonId);
        System.out.println(lesson);
        System.out.println(courseOverviewToLessonDTO.getCourseId());
        model.addAttribute("lesson", lesson);
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("courseName",courseOverviewToLessonDTO.getCourseName());
        model.addAttribute("courseListSize", courseOverviewToLessonDTO.getCourseListSize());
        model.addAttribute("firstNumber", courseOverviewToLessonDTO.getFirstNumber());
        model.addAttribute("courseId", courseOverviewToLessonDTO.getCourseId());

        return "AdminViewLessonPage";
    }

    @RequestMapping(value = "addNewCourse")
    public String  addNewCourse(Model model) {
        List<InstructorEntity> instructorList=instructorService.getAllInstructors();
        System.out.println(instructorList);
        model.addAttribute("instructorList", instructorList);
        model.addAttribute("searchClass", new SearchClass());
        model.addAttribute("course", new Course());
        return "AdminAddCoursePage";
    }

    @PostMapping(value = "processAddCoursePage")
    public String processAddCoursePage(@Valid @ModelAttribute("course") Course course, BindingResult bindingResult , Model model) {
        model.addAttribute("searchClass", new SearchClass());
        List<InstructorEntity> instructorList=instructorService.getAllInstructors();
        model.addAttribute("instructorList", instructorList);
        if (bindingResult.hasErrors()) {
            return "AdminAddCoursePage";
        }
        System.out.println(course);
        int newCourseID= instructorService.saveCourse(course);

        return "redirect:/courseOverview"+"?courseId=" +newCourseID;
    }


    @GetMapping(value = "editCourse")
    public String editCourse(@RequestParam("courseID") int courseID, Model model) {

        Course course = courseService.getCourse(courseID);
        System.out.println(course);
        Hibernate.initialize(course.getLessons());
        Hibernate.initialize(course.getInstructor());
        model.addAttribute("course", course);
        model.addAttribute("searchClass", new SearchClass());

        return "AdminUpdateCoursePage";

    }

    @PostMapping(value = "processEditCourse")
    public String processEditCourse(@RequestParam("courseID") int courseID,@ModelAttribute("course") Course course , BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "AdminUpdateCoursePage";
        }
        course.setCourse_id(courseID);

        System.out.println("inside processEditCourse");
        System.out.println(course);

        courseService.saveCourse(course);


        return "redirect:/courses";

    }

    @GetMapping(value = "deleteCourse")
    public String deleteCourse(@RequestParam("courseID") int courseID, Model model) {
        Course course = courseService.getCourse(courseID);
        courseService.deleteCourse(course.getCourse_id());
        return "redirect:/courses";
    }


    @RequestMapping(value = "/userCourses")
    public String userCourses(Model model) {
        List<Course> courses = courseService.getCourses();
        model.addAttribute("courses", courses);
        model.addAttribute("searchClass", new SearchClass());
        return "usesCoursesPage";
    }




}
