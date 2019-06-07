package com.lauren.minible.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;


import com.lauren.miniblog.dao.PostDAO;
import com.lauren.miniblog.model.Post;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	postDAO = new PostDAO();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		ServletContext ctx = getServletContext();
		Connection con = (Connection)ctx.getAttribute("dbconnection");
		try {
			switch (action) {
			case "/new":
				showNewForm(request, response, con);
				break;
			case "/insert":
				addPost(request, response, con);
				break;
			case "/delete":
				deletePost(request, response, con);
				break;
			case "/edit":
				showEditForm(request, response, con);
				break;
			case "/update":
				updatePost(request, response, con);
				break;
			case "/list":
				listPosts(request, response, con);
				break;
			case "/admin":
				listAdminPosts(request, response, con);
				break;
			case "/post":
				showPost(request, response, con);
				break;
			default:
				indexPost(request, response, con);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void indexPost(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		List<Post> listPosts = postDAO.selectAllPosts(con);
		listPosts = listPosts.subList(0, 5);
		request.setAttribute("indexListPosts", listPosts);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	private void listPosts(HttpServletRequest request, HttpServletResponse response, Connection con)
			throws SQLException, IOException, ServletException {
		List<Post> listPosts = postDAO.selectAllPosts(con);
		request.setAttribute("listAllPosts", listPosts);
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}
	
	private void listAdminPosts(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("author_id"));
		List<Post> listPosts = postDAO.selectPostsByAuthor(con, id);
		request.setAttribute("listAdminPosts", listPosts);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}
	
	private void showPost(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("post_id"));
		Post currentPost = postDAO.selectPost(con, id);
		request.setAttribute("currentPost", currentPost);
		request.getRequestDispatcher("single.jsp").forward(request, response);
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		request.getRequestDispatcher("form.jsp").forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("post_id"));
		Post currentPost = postDAO.selectPost(con, id);
		request.setAttribute("currentPost", currentPost);
		request.getRequestDispatcher("form.jsp").forward(request, response);
	}
	
	private void addPost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		int author = (int)session.getAttribute("currentUser");
		String title = request.getParameter("post_title");
		String categories = request.getParameter("post_categories");
		String content = request.getParameter("post_content");
		
		InputStream inputStream = null;
		Part image = request.getPart("post_image");
		if(image != null) {
			inputStream = image.getInputStream();
		}
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[16384];
		while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
		  buffer.write(data, 0, nRead);
		}
		Blob postImage = new SerialBlob(buffer.toByteArray());
		
		Post newPost = new Post(title, categories, content, author, postImage);
		postDAO.insertPost(con, newPost);
		response.sendRedirect("list");
	}
	
	private void updatePost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException, ServletException {
		int postID = Integer.parseInt(request.getParameter("post_id"));
		HttpSession session = request.getSession();
		int author = (int)session.getAttribute("currentUser");
		String title = request.getParameter("post_title");
		String categories = request.getParameter("post_categories");
		String content = request.getParameter("post_content");
		
		InputStream inputStream = null;
		Part image = request.getPart("post_image");
		if(image != null) {
			inputStream = image.getInputStream();
		}
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[16384];
		while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
		  buffer.write(data, 0, nRead);
		}
		Blob postImage = new SerialBlob(buffer.toByteArray());
		
		Post post = new Post(postID, title, categories, content, author, postImage);
		postDAO.updatePost(con, post);
		response.sendRedirect("admin");
	}
	
	private void deletePost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException {
		int postID = Integer.parseInt(request.getParameter("post_id"));
		postDAO.deletePost(con, postID);
		response.sendRedirect("list");

	}
}












