package domain;

import java.time.LocalDateTime;
import java.util.List;

public class Board {

    private Integer id; //pk
    private String title; //제목
    private String content; //내용

    private String writer; //작성자


    private LocalDateTime create_date;



    public Board(Integer id , String title, String content, String writer,LocalDateTime create_date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer= writer;
        this.create_date = create_date;
    }
    public Board( String title, String content,  String writer,LocalDateTime create_date) {

        this.title = title;
        this.content = content;
        this.writer = writer;
        this.create_date = create_date;
    }
    public Board() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
}
