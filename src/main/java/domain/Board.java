package domain;

import java.time.LocalDateTime;
import java.util.List;

public class Board {

    private Long id;
    private String title;
    private String content;
    private LocalDateTime create_date;

    public Board(String title, String content, LocalDateTime create_date) {
        this.title = title;
        this.content = content;
        this.create_date = create_date;
    }

    public Board() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
}
