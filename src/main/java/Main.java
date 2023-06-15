import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    /*
     * [JDBC - Java Database Connectivity]
     * - Java에서 데이터베이스에 접속할 수 있도록 하는 Java API
     */
    public static void main(String[] args) {
        //데이터베이스와 연결하는 객체
        Connection con = null;

        // 1. JDBC Driver Class
        String driver = "com.mysql.cj.jdbc.Driver";

        // 2. 데이터베이스에 연결하기 위한 정보
        String url = "jdbc:mysql://localhost:3306/jsp?serverTimezone=Asia/Seoul";     // 연결문자열, localhost - 127.0.0.1
        String user = "pjm";                                   // 데이터베이스 ID
        String pw = "jmjm1102";                                     // 데이터베이스 PW


        try {
            //1. JDBC 드라이버 로딩
            Class.forName(driver);

            // 2. Connection 생성
            con = DriverManager.getConnection(url, user, pw);        //데이터베이스 연결

            System.out.println("[Database 연결 성공]");

        } catch (SQLException e) {

            System.out.println("[SQL Error : " + e.getMessage() +"]");

        } catch (ClassNotFoundException e1) {

            System.out.println("[JDBC Connector Driver Error : " + e1.getMessage() + "]");
        } finally {
            //Connection 사용 후 Close
            if(con != null) {
                try {
                    con.close();
                } catch (Exception e) {

                }
            }
        }
    }
}