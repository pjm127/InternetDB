package repository;

import config.DBConnectionUtil;
import config.Encrypt;
import domain.Member;
import domain.UserStatus;

import java.sql.*;
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
    public Member join(Member member) throws SQLException {
        String sql = "insert into Member(name,id,password,studentID,role) values(?, ?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        String s = en.getSalt();
        String re_pas = en.getEnc(member.getPassword(),s);
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getId());
            pstmt.setString(3,re_pas);
            pstmt.setString(4, member.getStudentID());
            pstmt.setString(5, String.valueOf(UserStatus.USER));
            pstmt.executeUpdate();
            return member;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            close(con, pstmt, null);
        }
    }

    //id찾기
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
    //학번찾기
    public boolean findByStudentId(String studentId) throws SQLException {
        String sql = "SELECT studentId FROM member WHERE studentId = ?";
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
