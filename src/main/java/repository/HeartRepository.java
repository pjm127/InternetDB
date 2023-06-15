package repository;

import config.DBConnectionUtil;
import domain.Board;
import domain.Comment;
import domain.Heart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HeartRepository {

    private static final HeartRepository instance = new HeartRepository();
    private HeartRepository() {
    }
    public static HeartRepository getInstance() {
        return instance;
    }

    //좋아요 눌렀는지 조회
    public void checkHeart(int member_id,int board_id) throws SQLException{

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM heart where member_id = ? and board_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,member_id);
            pstmt.setInt(2,board_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 이미 좋아요 기록이 존재하는 경우 -> 기록 삭제
                String deleteQuery = "DELETE FROM heart WHERE `board_id` = ? AND `member_id` = ?";
                PreparedStatement deleteStmt = con.prepareStatement(deleteQuery);
                deleteStmt.setInt(1, board_id);
                deleteStmt.setInt(2, member_id);
                deleteStmt.executeUpdate();
            } else {
                // 좋아요 기록이 없는 경우 -> 기록 추가
                String insertQuery = "INSERT INTO heart (`board_id`, `member_id`, `heart_created_at`) VALUES (?, ?, NOW())";
                PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                insertStmt.setInt(1, board_id);
                insertStmt.setInt(2, member_id);
                insertStmt.executeUpdate();
            }
        } finally {
            close(con, pstmt, rs);
        }

    }



 /*   //좋아요 누름
    public void clickHeart( int member_id, int board_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO heart (member_id, board_id, heart_created_at) VALUES (?, ?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, member_id);
            pstmt.setInt(2, board_id);
            pstmt.setDate(3, new Date(System.currentTimeMillis()));
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

*/



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
