package repository;

import config.DBConnectionUtil;
import config.Encrypt;
import domain.Member;
import domain.UserStatus;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Logger;


public class MemberRepository {
    private static final MemberRepository instance = new MemberRepository();
    private MemberRepository() {
    }
    public static MemberRepository getInstance() {
        return instance;
    }

    Encrypt en = Encrypt.getInstance();

    //회원가입
    public void join(Member member) throws SQLException {
        String sql = "insert into Member(member_email,member_pd,member_num,mem_created_t,mem_role) values( ?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        String s = en.getSalt();
        String re_pas = en.getEnc(member.getPassword(),s);
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, member.getEmail());
            pstmt.setString(2,re_pas);
            pstmt.setString(3, member.getStudentID());
            pstmt.setDate(4, new Date(System.currentTimeMillis()));
            pstmt.setString(5, String.valueOf(UserStatus.USER));
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("new ID: " + generatedId);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            close(con, pstmt, null);
        }
    }

    //id찾기 id중복확인
    public boolean findByid(String id) throws SQLException {
        String sql = "SELECT id FROM member WHERE id = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isIdDuplicate = false;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                isIdDuplicate = true;
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            close(con, pstmt, rs);
        }
        return isIdDuplicate;
    }
    //학번찾기 학번중복확인
    public boolean findByStudentId(String studentId) throws SQLException {
        String sql = "SELECT member_num FROM member WHERE member_num = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isStudentIdDuplicate = false;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studentId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                isStudentIdDuplicate = true;
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            close(con, pstmt, rs);
        }
        return isStudentIdDuplicate;
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
