package Com.Sravan.Entity;

import jakarta.persistence.Embeddable;

@Embeddable
public class userDetailsCPK {

    String username;
    String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "userDetailsCPK{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
