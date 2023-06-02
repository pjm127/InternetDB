package repository;

import config.DBConnectionUtil;
import config.Encrypt;
import domain.Member;

import java.sql.*;
import java.util.logging.Logger;


public class MemberRepository {
    private static final MemberRepository instance = new MemberRepository();
    private MemberRepository() {
    }
    public static MemberRepository getInstance() {
        return instance;
    }

    Encrypt en = Encrypt.getInstance();

    public Member save(Member member) throws SQLException {
        String sql = "insert into Member(name,id,password,studentID) values(?, ?,?,?)";
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
            pstmt.executeUpdate();
            return member;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            close(con, pstmt, null);
        }
    }


    public Member findById(String id) throws SQLException {
        String sql = "select password from member where id = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("password"));

                return member;
            } else {
                throw new IllegalStateException();
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            close(con, pstmt, rs);
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
