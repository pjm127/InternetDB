package domain;

import java.sql.Date;
import java.time.LocalDateTime;

public class Member {

    private Integer id; //pk
    private String name; //이름
    private String password; //비밀번호
    private Integer studentID;//학번
    private Date create_date; // 가입 기간
    private UserStatus userStatus; //권한


    public Member() {
    }


    public Member( String name, String password, Integer studentID) {

        this.name = name;
        this.password = password;
        this.studentID = studentID;

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStudentID() {
        return studentID;
    }

    public void setStudentID(Integer studentID) {
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
