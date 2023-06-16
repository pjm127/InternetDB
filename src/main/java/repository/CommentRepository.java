package repository;

import config.DBConnectionUtil;
import domain.Board;
import domain.Comment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentRepository {

    private static final CommentRepository instance = new CommentRepository();

    private CommentRepository() {
    }

    public static CommentRepository getInstance() {
        return instance;
    }

    MemberRepository memberRepository = MemberRepository.getInstance();


    //댓글 작성
    public void save(String content, int member_id, int board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO comment (member_id, board_id, c_content, com_created_at) VALUES (?, ?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, member_id);
            pstmt.setInt(2, board_id);
            pstmt.setString(3, content);
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

    // 게시글 id로 설정된 댓글리스트 보기
    public List<Comment> getCommentList(int board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Comment> commentList = new ArrayList<>();
        String sql = "SELECT member_id, c_content, com_created_at FROM comment where board_id =? ";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String member_id = rs.getString("member_id");
                String content = rs.getString("c_content");
                Date created_at = rs.getDate("com_created_at");


                String writer = memberRepository.getWriterNameById(member_id); // 작성자 이메일 조회

                commentList.add(new Comment(content, writer, created_at));
            }
        } finally {
            close(con, pstmt, rs);
        }

        return commentList;
    }


    //댓글 수정
    public void updateComment(int comment_id, String content, int member_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE comment SET c_content = ? WHERE comment_id = ? AND member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);
            pstmt.setInt(2, comment_id);
            pstmt.setInt(3, member_id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("댓글 수정이 완료되었습니다.");
            } else {
                System.out.println("댓글 수정에 실패하였습니다.");
            }
        } finally {
            close(con, pstmt, null);
        }
    }

    //댓글 삭제
    public void deleteComment(int comment_id, int member_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM comment WHERE comment_id = ? AND member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, comment_id);
            pstmt.setInt(2, member_id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("댓글 삭제가 완료되었습니다.");
            } else {
                System.out.println("댓글 삭제에 실패하였습니다.");
            }
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
