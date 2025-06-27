package Com.Sravan.Service;

import Com.Sravan.Entity.userDetailsCPK;
import Com.Sravan.Entity.userDetailsEntity;
import Com.Sravan.Entity.usersEntity;

import java.util.List;

public interface StudentService {

    public List<userDetailsEntity> getStudents();


    public userDetailsEntity getStudent(userDetailsCPK userDetailsCPK);




    public void saveStudent(userDetailsEntity student,String username);

    public void deleteStudent(userDetailsCPK userDetailsCPK);



}
