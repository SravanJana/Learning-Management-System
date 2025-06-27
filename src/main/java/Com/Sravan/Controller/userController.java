package Com.Sravan.Controller;

import Com.Sravan.DTO.CourseOverviewToLessonDTO;
import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.InstructorEntity;
import Com.Sravan.Entity.Lesson;
import Com.Sravan.Entity.SearchClass;
import Com.Sravan.Service.InstructorService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class userController {


    @Autowired
    InstructorService instructorService;

    @GetMapping(value = "/userPage")
    public String userPage() {
        System.out.println("In userPage Handler Method");

        return "userPage";
    }

    @GetMapping(value = "/userPageNext")
    public String userPageNext() {
        System.out.println("In userPageNext Handler Method");
        return "userPageNext";
    }

    @GetMapping(value = "/userInstructors")
    public String userInstructors(Model model) {
        System.out.println("In userInstructors Handler Method");
        List<InstructorEntity> instructors = instructorService.getAllInstructors();
        instructors.forEach(System.out::println);
        model.addAttribute("instructors", instructors);
        model.addAttribute("searchClass", new SearchClass());
        return "userInstructorsPage";
    }

    @RequestMapping(value = "/userCourseOverview")
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

        return "userCourseOverview";

    }

    @RequestMapping(value = "/userLessonPage")
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

        return "userLessonPage";
    }

    @RequestMapping(value = "/UserSearchInstructor")
    public String searchInstructor(@ModelAttribute("searchClass")SearchClass search, Model model) {
        System.out.println(search.getName());
        List<InstructorEntity> list = instructorService.getInstructorByName(search.getName());
        model.addAttribute("instructors", list);
        model.addAttribute("searchedName", search.getName());

        System.out.println(list);

        return "userSearchPage";
    }







}
