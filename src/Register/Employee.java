package Register;

import java.io.Serializable;

public class Employee implements Serializable {
    /**
     */
    private static final long serialVersionUID = 1L;
    public String first_name;
    public String last_name;
    public String username;
    public String password;
    public String error;
   
    public String getFirst_name() {
        return first_name;
    }
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    public String getLast_name() {
        return last_name;
    }
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
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
    public String getError() {
        return error;
    }
    public void setError(String error) {
        this.error = error;
    }
   
}