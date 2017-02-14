package app;

import java.sql.*;
import java.util.*;

/**
 * Database is a class that specifies the interface to the movie
 * database. Uses JDBC.
 */
public class Database {

    /**
     * The database connection.
     */
    private Connection conn;

    /**
     * Create the database interface object. Connection to the
     * database is performed later.
     */
    public Database() {
        conn = null;
    }

    /**
     * Open a connection to the database, using the specified user
     * name and password.
     */
    public boolean openConnection(String filename) {
        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:" + filename);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * Close the connection to the database.
     */
    public void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Check if the connection to the database has been established
     * 
     * @return true if the connection has been established
     */
    public boolean isConnected() {
        return conn != null;
    }

    /* --- insert own code here --- */

    public List<StudentInfo> studentInfo() {
        List<StudentInfo> found = new LinkedList<>();
        try {
            String sql =
                "SELECT s_id, s_name, gpa, size_hs\n" +
                "FROM   students";
            Statement s = conn.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                found.add(new StudentInfo(rs));
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
        }
        return found;
    }

    public List<ApplicationCount> getApplicationCount() {
        List<ApplicationCount> found = new LinkedList<>();
        try {
            String sql =
                "SELECT COUNT() AS count, c_name, major\n" +
                "FROM   applications\n" +
                "GROUP BY c_name, major\n" +
                "ORDER BY count DESC, c_name, major\n";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                found.add(new ApplicationCount(rs));
            }
            return found;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our PreparedStatement...
        }
        return found;
    }
}

/*

ApplicationCount
count : int
major : String
c_name -> college : String

*/

class ApplicationCount {

    public final int count;
    public final String major;
    public final String college;

    public ApplicationCount  (ResultSet rs) throws SQLException {
        this.count = rs.getInt("count");
        this.major = rs.getString("major");
        this.college = rs.getString("c_name");
    }
}

/*

StudentInfo
s_id -> studentId : int
s_name -> studentName : String
gpa : double
size_hs -> hsSize : int

*/

class StudentInfo {

    public final int studentId;
    public final String studentName;
    public final double gpa;
    public final int hsSize;

    public StudentInfo  (ResultSet rs) throws SQLException {
        this.studentId = rs.getInt("s_id");
        this.studentName = rs.getString("s_name");
        this.gpa = rs.getDouble("gpa");
        this.hsSize = rs.getInt("size_hs");
    }
}
