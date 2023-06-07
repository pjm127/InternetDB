package domain;

import javax.xml.crypto.Data;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Board {

    private Integer id; //pk
    private String title; //제목
    private String content; //내용
    private String writer; //작성자
    private Date create_date;//작성일
    private Integer view;// 조회수





    public Board( Integer id, String title, String content, String writer,Date create_date,Integer view) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer= writer;
        this.create_date = create_date;
        this.view = view;
    }
    public Board(  String title, String content, String writer,Date create_date,Integer view) {

        this.title = title;
        this.content = content;
        this.writer= writer;
        this.create_date = create_date;
        this.view = view;
    }
    public Board(String title, String content,Date create_date, Integer view) {
        this.title = title;
        this.content = content;

        this.create_date = create_date;
        this.view = view;
    }

    public Board( String title, String content) {

        this.title = title;
        this.content = content;


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

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
}
