package Com.Sravan.JpaRepositories;

import Com.Sravan.Entity.InstructorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InstructorRepository extends JpaRepository<InstructorEntity, Integer> {
}
