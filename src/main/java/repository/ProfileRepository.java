package repository;

import config.DBConnectionUtil;
import domain.Board;
import domain.Profile;

import java.sql.*;

public class ProfileRepository {

    private static final ProfileRepository instance = new ProfileRepository();
    private ProfileRepository() {
    }
    public static ProfileRepository getInstance() {
        return instance;
    }


    //프로필 작성 세션 user_id 넣음 6/7/3
    public void save(Profile profile, Integer member_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO profile (profile_name, member_id, profile_created_at) VALUES (?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, profile.getname());
            pstmt.setInt(2, member_id);
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

    //세션id로 로그인한 사용자 프로필 보기
    public Profile getProfile(int member_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT profile_name, profile_created_at FROM profile where member_id = ?";
        Profile profile = null;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, member_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("profile_name");
                Date created_at = rs.getDate("profile_created_at");


                profile = new Profile(name, created_at);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(con, pstmt, rs);
        }

        return profile;
    }

    //세션 member_id로 프로필 찾아서 수정











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
