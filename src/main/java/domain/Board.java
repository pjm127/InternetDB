package domain;

import javax.xml.crypto.Data;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Board {

    private Integer id; //pk
    private String title; //����
    private String content; //����
    private String writer; //�ۼ���
    private Date create_date;
    private Integer view;// 조회
    private String filepath;  //파일경로 저장
    private String youtube;    // 유튜브 url 저장

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public String getYoutube() {
        return youtube;
    }


    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }


    public String getFilepath() {
        return filepath;
    }


    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }


    public Board(String title, String content) {
        this.title = title;
        this.content = content;

    }


    public Board(Integer id, String title, String content, String writer, Date create_date, Integer view, String filename) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.create_date = create_date;
        this.view = view;
        this.filepath = filename;
    }

    public Board(String title, String content, String writer, Date create_date, Integer view, String filepath, String youtube) {

        this.title = title;
        this.content = content;
        this.writer = writer;
        this.create_date = create_date;
        this.view = view;
        this.filepath = filepath;
        this.youtube = youtube;
    }

    public Board(String title, String content, Date create_date, Integer view) {
        this.title = title;
        this.content = content;
        this.create_date = create_date;
        this.view = view;
    }

    public Board(String title, String content, Date create_date, Integer view, String filepath, String youtube) {
        this.title = title;
        this.content = content;
        this.create_date = create_date;
        this.view = view;
        this.filepath = filepath;
        this.youtube = youtube;
    }

    public Board(String title, String content, String filepath, String youtube) {
        this.title = title;
        this.content = content;
        this.filepath = filepath;
        this.youtube = youtube;
    }

    public Board(String filepath, Integer id) {

        this.filepath = filepath;
        this.id = id;
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
