package Com.Sravan.Entity;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;



@Entity
@Table(name = "userDetails")
public class userDetailsEntity {

    @EmbeddedId
    userDetailsCPK userDetailsCPK;

    String yourname;
    String email;

    public userDetailsCPK getUserDetailsCPK() {
        return userDetailsCPK;
    }

    public void setUserDetailsCPK(userDetailsCPK userDetailsCPK) {
        this.userDetailsCPK = userDetailsCPK;
    }

    public String getYourname() {
        return yourname;
    }

    public void setYourname(String yourname) {
        this.yourname = yourname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "userDetailsEntity{" +
                "userDetailsCPK=" + userDetailsCPK.toString() +
                ", yourname='" + yourname + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
