// UserDao (Dao)

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/sample";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection jdbcConnection;

    // 데이터베이스 연결
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // 데이터베이스 연결 해제
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // tbl_user 테이블의 모든 사용자 가져오기
    public List<User> listAllUsers() throws SQLException {
        List<User> userList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_user";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
        	String userId = rs.getString("userId");
            String name = rs.getString("name");
            String status = rs.getString("status");

            User user = new User(userId, name, status);
            userList.add(user);
        }

        rs.close();
        statement.close();
        disconnect();

        return userList;
    }
}