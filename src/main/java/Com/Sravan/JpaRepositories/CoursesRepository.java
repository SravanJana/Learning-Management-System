package Com.Sravan.JpaRepositories;


import Com.Sravan.Entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CoursesRepository  extends JpaRepository<Course, Integer> {

    @Query(value = "select * from courses order by course_id desc limit 8", nativeQuery = true)
    List<Course> findLastEightUsersNative();
}
