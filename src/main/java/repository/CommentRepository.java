package repository;

import config.DBConnectionUtil;
import domain.Board;
import domain.Comment;

import java.sql.*;

public class CommentRepository {

    //댓글 작성

    public void save(Comment comment, Integer member_id, Integer board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO comment (member_id, board_id, c_content, com_created_at) VALUES (?, ?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, member_id);
            pstmt.setInt(2, board_id);
            pstmt.setString(3, comment.getContent());
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

    //댓글 수정
    public void updateComment(int commentId, String content, int userId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE comment SET c_content = ? WHERE comment_id = ? AND member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);
            pstmt.setInt(2, commentId);
            pstmt.setInt(3, userId);
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
    public void deleteComment(int commentId, int userId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM comment WHERE comment_id = ? AND member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, commentId);
            pstmt.setInt(2, userId);
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
