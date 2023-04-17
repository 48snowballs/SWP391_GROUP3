package Context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBContext {

    protected Connection connection;
    
    public PreparedStatement createStatement(String sql, Object... params) {
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }
            return ps;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int executeUpdate(String sql, Object... params) {
        try {
            return createStatement(sql, params).executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public ResultSet executeQuery(String sql, Object... params) {
        try {
            return createStatement(sql, params).executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void execute(String sql, Object... params) {
        try {
            createStatement(sql, params).execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public DBContext() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    private final String serverName = "localhost";
    private final String dbName = "ProjectMobile";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "sa";

}
