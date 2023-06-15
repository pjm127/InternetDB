package repository;

import config.DBConnectionUtil;
import domain.Board;
import domain.Member;

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

    MemberRepository memberRepository = MemberRepository.getInstance();


    //게시글 작성
    //작성
    public void save(Board board, Integer studentId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO board (b_title, b_content, member_id, b_created_at,b_view,b_image,youtube_id) VALUES (?, ?, ?, ?,?,?,?)";
        int memberIdByStudentId = memberRepository.getMemberIdByStudentId(studentId);
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, memberIdByStudentId);
            pstmt.setDate(4, new Date(System.currentTimeMillis()));
            pstmt.setInt(5, 0);
            pstmt.setString(6, board.getFilepath());
            pstmt.setString(7, board.getYoutube());

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

    //게시글 전체 조회 세션 member_id 로 로그인한 email 표시
    //게시글 전체 표시
    public List<Board> getBoardList() throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> boardList = new ArrayList<>();
        String sql = "SELECT b_image FROM board";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                String b_image =rs.getString("b_image");
                boardList.add(new Board(b_image));
            }
        } finally {
            close(con, pstmt, rs);
        }

        return boardList;
    }

    //게시글 단건 조회 baord_id로 조회
    public Board getBoard(int board_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b_title, b_content, b_created_at, b_view, member_id,b_image,youtube_id FROM board where board_id = ?";
        Board board = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("b_title");
                String content = rs.getString("b_content");
                Date created_at = rs.getDate("b_created_at");
                int viewCount = rs.getInt("b_view");
                String member_id = rs.getString("member_id");
                String image = rs.getString("b_image");
                String youtube_id = rs.getString("youtube_id");

                String writer = memberRepository.getWriterNameById(member_id); // �ۼ��� �̸��� ��ȸ

                board = new Board(title, content, writer, created_at, viewCount,image,youtube_id);
                incrementViewCount(board_id);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(con, pstmt, rs);
        }

        return board;
    }



    //게시글 수정
    public void update(int id, String title, String content,String image, String youtube) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Board SET b_title = ?, b_content = ?,b_image = ?, youtube_id = ? WHERE board_id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, image);
            pstmt.setString(4, youtube);
            pstmt.setInt(5, id);

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
    public int getViewCount(int board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int viewCount = 0;
        String sql = "SELECT b_view FROM board WHERE board_id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_id);
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
    public void incrementViewCount(int board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE board SET b_view = b_view + 1 WHERE board_id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_id);
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
