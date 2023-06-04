package domain;

public class Member {

    private String id; //아이디
    private String password; //비밀번호
    private String studentID;//학번
    private String name; //이름

    private UserStatus userStatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }

    public Member() {
    }

    public Member(String id, String name, String password, String studentID,UserStatus userStatus) {
        this.id=id;
        this.name = name;
        this.password = password;
        this.studentID = studentID;
        this.userStatus = userStatus;
    }
}
