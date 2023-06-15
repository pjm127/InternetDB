package domain;

import java.time.LocalDateTime;
import java.util.Date;

public class Comment {

    private Integer id; //pk

    private String content; //내용
    private String writer; //작성자
    private Date create_date;//작성일

    public Comment(Integer id, String content, String writer ){
        this.id = id;

        this.content = content;
        this.writer = writer;

    }

    public Comment( String content, String writer, Date create_date) {

        this.content = content;
        this.writer = writer;
        this.create_date = create_date;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }
}
