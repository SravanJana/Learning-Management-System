package Com.Sravan.Controller;

import Com.Sravan.Entity.Course;
import Com.Sravan.Entity.Lesson;
import Com.Sravan.Service.InstructorService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller()
public class TestController {

    @Autowired
    InstructorService instructorService;

    @RequestMapping(value = "/test")
    public String testHandlerMethod(@RequestParam("pageNumber") int pageNumber, HttpServletRequest request, Model model) {

        if (pageNumber == 0) {
            Course course = instructorService.getCourse(101);
            List<Lesson> lessons = course.getLessons();
            System.out.println(lessons);
            PagedListHolder<Lesson> pagedListHolder = new PagedListHolder<>();

            pagedListHolder.setSource(lessons);

            pagedListHolder.setPage(pageNumber);
            pagedListHolder.setPageSize(3);
            List<Lesson> lessonList = pagedListHolder.getPageList();

            HttpSession session = request.getSession();
            session.setAttribute("pageHolder", pagedListHolder);

            lessonList.forEach(System.out::println);

            System.out.println("Page Ended");
        } else {
            PagedListHolder<Lesson> pagedListHolder = (PagedListHolder<Lesson>) request.getSession().getAttribute("pageHolder");
            pagedListHolder.setPage(pageNumber);
            pagedListHolder.setPageSize(3);
            List<Lesson> pageList = pagedListHolder.getPageList();

            pageList.forEach(System.out::println);

            System.out.println("Page Ended");
        }

        return "testPage";

    }
}
