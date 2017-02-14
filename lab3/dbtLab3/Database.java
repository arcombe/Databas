package dbtLab3;

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

    public List<Movie> getMovies() {
        List<Movie> found = new LinkedList<>();
        try {
            String sql =
                "SELECT title\n" +
                "FROM   Movie";
            Statement s = conn.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                found.add(new Movie(rs));
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
        }
        return found;
    }

    public List<MoviePreformance> getMoviePreformances(String movie) {
        List<MoviePreformance> found = new LinkedList<>();
        try {
            String sql =
                "SELECT title, date, name, booked_seats\n" +
                "FROM   MoviePreformance \n" +
                "WHERE title = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, movie);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                found.add(new MoviePreformance(rs));
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
         }
        return found;
    }

    public List<MoviePreformance> getMoviePreformances(String movie, String date) {
        List<MoviePreformance> found = new LinkedList<>();
        try {
            String sql =
                "SELECT title, date, name, booked_seats\n" +
                "FROM   MoviePreformance \n" +
                "WHERE title = ? and date = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, movie);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                found.add(new MoviePreformance(rs));
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
         }
        return found;
    }

    public List<User> getUser(String username) {
        List<User> found = new LinkedList<>();
        try {
            String sql =
                "SELECT username, name, adress, telephone\n" +
                "FROM   User \n" +
                "WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                found.add(new User(rs));
            }
            return found;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
         }
        return found;
    }

    public int updateMoviePreformance(String title, String date) {
        List<User> found = new LinkedList<>();
        try {
            String sql =
                "update MoviePreformance\n" +
                "set booked_seats = booked_seats - 1\n" +
                "where title = ? and date = ? and booked_seats > 0";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, date);
            int n =  ps.executeUpdate();
            return n;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
         }
        return 0;
    }

    public void bookTicket(String title, String date, String username) {
        List<User> found = new LinkedList<>();
        try {
            String sql =
                "insert into Reservation(username, title, date)\n" +
                "values (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, title);
            ps.setString(3, date);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // code to clone our Statement...
        }
    }

}

class Movie {
    public final String title;

    public Movie(ResultSet rs) throws SQLException {
        this.title = rs.getString("title");
    }


}

class MoviePreformance {

    public final String title;
    public final String date;
    public final String name;
    public final Integer booked_seats;

    public MoviePreformance(ResultSet rs) throws SQLException {
        this.title = rs.getString("title");
        this.date = rs.getString("date");
        this.name = rs.getString("name");
        this.booked_seats = rs.getInt("booked_seats");
    }

}

class User {

    public final String username;
    public final String name;
    public final String adress;
    public final int telephone;

    public User(ResultSet rs) throws SQLException {
        this.username = rs.getString("username");
        this.name = rs.getString("name");
        this.adress = rs.getString("adress");
        this.telephone = rs.getInt("telephone");
    }
}

class Theater {

    public final String name;
    public final Integer seats;

    public Theater(ResultSet rs) throws SQLException {
        this.name = rs.getString("name");
        this.seats = rs.getInt("seats");
    }
}




