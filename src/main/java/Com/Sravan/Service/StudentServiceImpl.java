package Com.Sravan.Service;

import Com.Sravan.Entity.userDetailsCPK;
import Com.Sravan.Entity.userDetailsEntity;
import Com.Sravan.Entity.usersEntity;
import Com.Sravan.JpaRepositories.UserDetailsRepository;
import Com.Sravan.JpaRepositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(transactionManager = "jpaTransactionManager")
public class StudentServiceImpl implements StudentService {

    @Autowired
    UserDetailsRepository userDetailsRepository;

    @Autowired
    UsersRepository usersRepository;

    @Override
    public List<userDetailsEntity> getStudents() {

        List<userDetailsEntity> usersEntityList = (List<userDetailsEntity>) userDetailsRepository.findAll();

        return usersEntityList;
    }

    @Override
    public userDetailsEntity getStudent(userDetailsCPK userDetailsCPK) {

        List<userDetailsEntity> byUserDetailsCPK = userDetailsRepository.getByUserDetailsCPK(userDetailsCPK);
        return byUserDetailsCPK.get(0);

    }


    @Override
    public void saveStudent(userDetailsEntity student,String username) {

        System.out.println(student);
        System.out.println(student.getUserDetailsCPK().getUsername());


        usersEntity newEntity = new usersEntity();
        newEntity.setUsername(student.getUserDetailsCPK().getUsername());
        newEntity.setPassword(student.getUserDetailsCPK().getPassword());
        newEntity.setEnabled(true);




    }

    @Override
    public void deleteStudent(userDetailsCPK userDetailsCPK) {

        userDetailsRepository.deleteByUserDetailsCPK(userDetailsCPK);

    }


}
