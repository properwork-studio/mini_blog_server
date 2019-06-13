package com.lauren.miniblog.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lauren.miniblog.model.Post;

public class PostDAO {
	
	private static final String INSERT_POSTS_SQL = "INSERT INTO Posts" + "  (post_title, post_categories, post_content, post_image, author_id) VALUES "
			+ " (?, ?, ?, ?, ?);";

	private static final String SELECT_POST_BY_ID = "SELECT post_id,post_title,post_categories,post_content,author_id,post_image FROM Posts WHERE post_id =?";
	private static final String SELECT_POSTS_BY_AUTHOR_ID = "SELECT post_id,post_title,post_categories,post_content,post_image FROM Posts WHERE author_id =? ORDER BY post_id DESC";
	private static final String SELECT_ALL_POSTS = "SELECT * FROM Posts ORDER BY post_id DESC";
	private static final String DELETE_POSTS_SQL = "DELETE FROM Posts WHERE post_id = ?;";
	private static final String UPDATE_POSTS_SQL = "UPDATE Posts SET post_title = ?,post_categories= ?, post_content =?, post_image =? WHERE post_id = ?;";
	private static final String CALC_NUM_OF_POSTS = "SELECT count(*) AS total FROM posts WHERE author_id=?";
	
	public PostDAO() {
		
	}
	
	public void insertPost(Connection con, Post post) throws SQLException {
		System.out.println(INSERT_POSTS_SQL);
		// try-with-resource statement will auto close the connection.
		try (
			PreparedStatement preparedStatement = con.prepareStatement(INSERT_POSTS_SQL)) {
			preparedStatement.setString(1, post.getPostTitle());
			preparedStatement.setString(2, post.getPostCategories());
			preparedStatement.setString(3, post.getPostContent());
			preparedStatement.setBlob(4, post.getPostImage());
			preparedStatement.setInt(5, post.getAuthorID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public Post selectPost(Connection con, int id) {
		Post post = null;
		try (
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_POST_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step: Process the ResultSet object.
			while (rs.next()) {
				String postTitle = rs.getString("post_title");
				String postCategories = rs.getString("post_categories");
				String postContent = rs.getString("post_content");
				int postAuthor = rs.getInt("author_id");
				Blob postImage = rs.getBlob("post_image");
				post = new Post(id, postTitle, postCategories, postContent, postAuthor, postImage);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return post;
	}
	
	public List<Post> selectPostsByAuthor(Connection con, int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Post> posts = new ArrayList<>();
		try (
			// Step :Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_POSTS_BY_AUTHOR_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step : Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step : Process the ResultSet object.
			while (rs.next()) {
				int postID = rs.getInt("post_id");
				String postTitle = rs.getString("post_title");
				String postCategories = rs.getString("post_categories");
				String postContent = rs.getString("post_content");
				Blob postImage = rs.getBlob("post_image");
				posts.add(new Post(postID, postTitle, postCategories, postContent, postImage));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return posts;
	}
	
	public List<Post> selectAllPosts(Connection con) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Post> posts = new ArrayList<>();
		try (
			// Step :Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_POSTS);) {
			System.out.println("From <selectAllPosts> " + preparedStatement);
			// Step : Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step : Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("post_id");
				String postTitle = rs.getString("post_title");
				String postCategories = rs.getString("post_categories");
				String postContent = rs.getString("post_content");
				Blob postImage = rs.getBlob("post_image");
				posts.add(new Post(id, postTitle, postCategories, postContent, postImage));
			}
			
			System.out.println(posts.size());
		} catch (SQLException e) {
			printSQLException(e);
		}
		return posts;
	}
	
	public boolean deletePost(Connection con, int id) throws SQLException {
		boolean rowDeleted;
		try (
			PreparedStatement statement = con.prepareStatement(DELETE_POSTS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public boolean updatePost(Connection con, Post post) throws SQLException {
		boolean rowUpdated;
		try (
			PreparedStatement statement = con.prepareStatement(UPDATE_POSTS_SQL);) {
			statement.setString(1, post.getPostTitle());
			statement.setString(2, post.getPostCategories());
			statement.setString(3, post.getPostContent());
			statement.setBlob(4, post.getPostImage());
			statement.setInt(5, post.getPostID());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	public int calcNumOfPosts(Connection con, int id) throws SQLException {
		int postNum = 0;
		try (
			PreparedStatement statement = con.prepareStatement(CALC_NUM_OF_POSTS);) {
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				postNum = rs.getInt("total");
			}
		}
		return postNum;
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
