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
//    public List<Board> getBoard() throws SQLException {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        List<Board> boardList = new ArrayList<>();
//        String sql = "SELECT id, b_title, b_content, b_created_at, b_view, member_id FROM board";
//        try {
//            con = getConnection();
//            pstmt = con.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                int id = rs.getInt("id");
//                String title = rs.getString("b_title");
//                String content = rs.getString("b_content");
//                LocalDateTime created_at = rs.getTimestamp("b_created_at").toLocalDateTime();
//                int viewCount = rs.getInt("b_view");
//                int member_id = rs.getInt("member_id");
//
//                // 작성자 정보를 가져오는 코드 추가
//                String writer = getWriterByMemberId(member_id); // getWriterByMemberId()는 작성자를 가져오는 로직을 구현해야 함
//
//                boardList.add(new Board(id, title, content, writer, created_at, viewCount));
//            }
//        } finally {
//            close(con, pstmt, rs);
//        }
//
//        return boardList;
//    }

//    //member_id로 작성자 이메일 찾기
//    public String getWriterByMemberId(int memberId) throws SQLException {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        String writer = "";
//
//        String sql = "SELECT member_email FROM member WHERE member_id = ?";
//        try {
//            con = getConnection();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1, memberId);
//            rs = pstmt.executeQuery();
//
//            if (rs.next()) {
//                writer = rs.getString("member_email");
//            }
//        } finally {
//            close(con, pstmt, rs);
//        }
//
//        return writer;
//    }

    //게시글 단건 id로 조회
//    public Board getBoardById(int id) throws SQLException {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        Board board = null;
//        String sql = "SELECT id,title, content, create_date,writer FROM board where id = ?";
//        try {
//            con = getConnection();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setInt(1,id);
//            rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                String title = rs.getString("title");
//                String content = rs.getString("content");
//                String writer = rs.getString("writer");
//                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//                LocalDateTime create_date = LocalDateTime.parse(rs.getString("create_date"),formatter);
//                board = new Board(id, title, content, writer,create_date);
//            }
//        } finally {
//            close(con, pstmt, rs);
//        }
//
//        return board;
//    }

    //게시글 작성
    public void save(Board board, Integer user_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO board (b_title, b_content, member_id, b_created_at) VALUES (?, ?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, user_id);
            pstmt.setDate(4, new Date(System.currentTimeMillis()));
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("new ID: " + generatedId);
                }
            }
        } finally {
            close(con, pstmt, null);
        }
    }

    //게시글 조회
    public List<Board> getBoard() throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> boardList = new ArrayList<>();
        String sql = "SELECT board_id, b_title, b_content, b_created_at, b_view, member_id FROM board";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("board_id");
                String title = rs.getString("b_title");
                String content = rs.getString("b_content");
                Date created_at = rs.getDate("b_created_at");
                int viewCount = rs.getInt("b_view");
                String member_id = rs.getString("member_id");

                String writer = getWriterEmailById(member_id); // 작성자 이메일 조회

                boardList.add(new Board(id,title, content, writer, created_at, viewCount));
            }
        } finally {
            close(con, pstmt, rs);
        }

        return boardList;
    }


    //게시글 작성자로 이메일 조회
    public String getWriterEmailById(String memberId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String writerEmail = "";

        String sql = "SELECT member_email FROM member WHERE member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                writerEmail = rs.getString("member_email");
            }
        } finally {
            close(con, pstmt, rs);
        }

        return writerEmail;
    }
    //게시글 수정
    public void update(int id, String title, String content) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Board SET b_title = ?, b_content = ? WHERE board_id = ?";
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
        String sql = "delete from board where board_id=?";
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

    //조회수 조회
    public int getViewCount(int boardId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int viewCount = 0;
        String sql = "SELECT b_view FROM board WHERE board_id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                viewCount = rs.getInt("b_view");
            }
        } finally {
            close(con, pstmt, rs);
        }
        return viewCount;
    }

    //조회수 증가
    public void incrementViewCount(int boardId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE board SET b_view = b_view + 1 WHERE board_id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardId);
            pstmt.executeUpdate();
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
