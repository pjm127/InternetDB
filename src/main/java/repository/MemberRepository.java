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
        String sql = "insert into Member(member_name,member_pd,member_num,mem_created_t,mem_role) values( ?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;

        String re_pas = en.getEnc(member.getPassword());
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, member.getName());
            pstmt.setString(2,re_pas);
            pstmt.setInt(3, member.getStudentID());
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

    //학번찾기 학번중복확인
    public boolean findByStudentId(Integer studentId) throws SQLException {
        String sql = "SELECT member_num FROM member WHERE member_num = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isStudentIdDuplicate = false;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, studentId);
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

    // 로그인한 사용자 세션로 이메일 조회 후 작성자 표시
    public String getWriterNameById(String memberId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String writerEmail = "";

        String sql = "SELECT member_name FROM member WHERE member_id = ?";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                writerEmail = rs.getString("member_name");
            }
        } finally {
            close(con, pstmt, rs);
        }

        return writerEmail;
    }


    public int login(String name, String password, Integer studentId) {
        String SQL = "SELECT member_pd FROM MEMBER WHERE member_name = ? AND member_num = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String re_pas = en.getEnc(password);
        try {
            con = getConnection();
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, name);
            pstmt.setInt(2, studentId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(re_pas)) {
                    return 1; // 로그인 성공
                } else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(con, pstmt, rs);
        }

        return -2; // 데이터베이스 오류
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
