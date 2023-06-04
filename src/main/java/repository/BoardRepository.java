package repository;

import config.DBConnectionUtil;
import domain.Board;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;



public class BoardRepository {

    private static final BoardRepository instance = new BoardRepository();
    private BoardRepository() {
    }
    public static BoardRepository getInstance() {
        return instance;
    }

    //전체 글 조회
    public List<Board> getBoard() throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> boardList = new ArrayList<>();
        String sql = "SELECT id,title, content, create_date, writer FROM board";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String writer = rs.getString("writer");
                LocalDateTime create_date = LocalDateTime.parse(rs.getString("create_date"),formatter);
                boardList.add(new Board(id, title, content, writer,create_date));
            }
        } finally {
            close(con, pstmt, rs);
        }

        return boardList;
    }

    //게시글 단건 id로 조회
    public Board getBoardById(int id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board = null;
        String sql = "SELECT id,title, content, create_date,writer FROM board where id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String writer = rs.getString("writer");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime create_date = LocalDateTime.parse(rs.getString("create_date"),formatter);
                board = new Board(id, title, content, writer,create_date);
            }
        } finally {
            close(con, pstmt, rs);
        }

        return board;
    }



    //게시글 저장
    public Board save(Board board) throws SQLException {
        String sql = "insert into Board(title,content, create_date,writer) values(?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setTimestamp(3, Timestamp.valueOf(board.getCreate_date()));
            pstmt.setString(4, board.getWriter());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("new ID: " + generatedId);
                }
            }
            return board;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            close(con, pstmt, null);
        }
    }

    //게시글 수정
    public void update(int id, String title, String content) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Board SET title = ?, content = ? WHERE id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();
        } finally {
            close(con, pstmt, null);
        }
    }

    //게시글 삭제
    public void delete(int id) throws SQLException {
        String sql = "delete from board where id=?";
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } finally {
            close(con, pstmt, null);
        }
    }













    private void close(Connection con, Statement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    private Connection getConnection() {
        return DBConnectionUtil.getConnection();
    }
}
