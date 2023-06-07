package domain;

import java.util.Date;

public class Profile {

    private Integer id; //pk
    private String name; // 닉네임
    private Date create_date; // 작성일


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Profile( String name, Date create_date) {

        this.name = name;
        this.create_date = create_date;
    }
}
