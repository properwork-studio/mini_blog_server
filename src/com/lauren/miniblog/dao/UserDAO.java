package com.lauren.miniblog.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lauren.miniblog.model.User;

public class UserDAO {

	private static final String INSERT_USERS_SQL = "INSERT INTO Users" + "  (username, user_password, email) VALUES "
			+ " (?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "SELECT user_id,username,user_password,email,nickname,introduction,user_image FROM Users WHERE user_id =?";
	private static final String SELECT_USER_BY_USERNAME = "SELECT user_id,username,user_password,email,nickname,introduction,user_image FROM Users WHERE username =?";
	private static final String SELECT_ALL_USERS = "SELECT * FROM Users";
	private static final String DELETE_USERS_SQL = "DELETE FROM Users WHERE user_id = ?;";
	private static final String UPDATE_USERS_SQL = "UPDATE Users SET nickname = ?,email= ?, introduction =?, user_image =? WHERE user_id = ?;";
	
	public UserDAO() {
		
	}
	
	public void insertUser(Connection con, User user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		System.out.println(user.getEmail());
		// try-with-resource statement will auto close the connection.
		try (
			PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public User selectUser(Connection con, int id) {
		User user = null;
		try (
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step: Process the ResultSet object.
			while (rs.next()) {
				String userName = rs.getString("username");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String introduction = rs.getString("introduction");
				Blob userImage = rs.getBlob("user_image");
				user = new User(id, userName, email, nickname, introduction, userImage);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	
	public User selectUserByUsername(Connection con, String username) {
		User user = null;
		try (
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_USERNAME);) {
			preparedStatement.setString(1, username);
			System.out.println(preparedStatement);
			// Step: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String userName = rs.getString("username");
				String password = rs.getString("user_password");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String introduction = rs.getString("introduction");
				Blob userImage = rs.getBlob("user_image");
				user = new User(id, userName, password, email, nickname, introduction, userImage);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	
	public List<User> selectAllUsers(Connection con) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		try (
			// Step :Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step : Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step : Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String userName = rs.getString("username");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String introduction = rs.getString("introduction");
				Blob userImage = rs.getBlob("user_image");
				users.add(new User(id, userName, email, nickname, introduction, userImage));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
	
	public boolean deleteUser(Connection con, int id) throws SQLException {
		boolean rowDeleted;
		try (
			PreparedStatement statement = con.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public boolean updateUser(Connection con, User user) throws SQLException {
		boolean rowUpdated;
		try (
			PreparedStatement statement = con.prepareStatement(UPDATE_USERS_SQL);) {
			statement.setString(1, user.getNickname());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getIntroduction());
			statement.setBlob(4, user.getUserImage());
			statement.setInt(5, user.getUserID());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	
	
//  ================================================================================================  //
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
