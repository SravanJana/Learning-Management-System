package Com.Sravan.JpaRepositories;

import Com.Sravan.Entity.usersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepository extends JpaRepository<usersEntity, String> {


}
