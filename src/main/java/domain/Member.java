package domain;

import java.sql.Date;
import java.time.LocalDateTime;

public class Member {

    private Integer id; //pk
    private String email; //이메일
    private String password; //비밀번호
    private String studentID;//학번
    private Date create_date; // 가입 기간
    private UserStatus userStatus; //권한


    public Member() {
    }


    public Member( String email, String password, String studentID,UserStatus userStatus) {

        this.email = email;
        this.password = password;
        this.studentID = studentID;
        this.userStatus = userStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }


    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }
}
