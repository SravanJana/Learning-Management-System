package Com.Sravan.JpaRepositories;

import Com.Sravan.Entity.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonRepository extends JpaRepository<Lesson, Integer> {
}
