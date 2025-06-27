package Com.Sravan.JpaRepositories;

import Com.Sravan.Entity.userDetailsCPK;
import Com.Sravan.Entity.userDetailsEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserDetailsRepository extends CrudRepository<userDetailsEntity, userDetailsCPK> {


    List<userDetailsEntity> getByUserDetailsCPK(userDetailsCPK userDetailsCPK);

    void deleteByUserDetailsCPK(userDetailsCPK userDetailsCPK);

}
