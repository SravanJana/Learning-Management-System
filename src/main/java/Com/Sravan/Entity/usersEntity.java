package Com.Sravan.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class usersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    String username;
    String password;
    boolean enabled;





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

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "usersEntity{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                '}';
    }
}
