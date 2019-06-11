package com.lauren.minible.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;


import com.lauren.miniblog.dao.*;
import com.lauren.miniblog.model.*;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/")
@MultipartConfig(maxFileSize= 16177216)
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO;
	private UserDAO userDAO;
	final Base64.Encoder encoder = Base64.getEncoder();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	postDAO = new PostDAO();
    	userDAO = new UserDAO();
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
			case "/add":
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
			case "/about":
				listAllUsers(request, response, con);
				break;
			case "/login":
				showLoginForm(request, response, con);
				break;
			case "/toLogin":
				toLogin(request, response, con);
				break;
			case "/logout":
				toLogout(request, response, con);
				break;
			case "/signup":
				showSignupForm(request, response, con);
				break;
			case "/doSignup":
				addNewUser(request, response, con);
				break;
			case "/profile":
				showProfileEditForm(request, response, con);
				break;
			case "/updateProfile":
				updateProfile(request, response, con);
				break;
			case "/showPostImage":
				showPostImage(request, response);
				break;
			case "/showUserImage":
				showUserImage(request, response, con);
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
		if(listPosts.size() >= 5) {
			listPosts = listPosts.subList(0, 5);
		}
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
		HttpSession session = request.getSession();
		request.setAttribute("isAdminPage", true);
		int author = (int) session.getAttribute("currentUser");
		List<Post> listPosts = postDAO.selectPostsByAuthor(con, author);
		request.setAttribute("listAdminPosts", listPosts);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}
	
	private void showPost(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("post_id"));
		int previousID = id - 1;
		int nextID = id + 1;
		Post currentPost = postDAO.selectPost(con, id);
		Post previousPost = postDAO.selectPost(con, previousID);
		Post nextPost = postDAO.selectPost(con, nextID);
		HttpSession session = request.getSession();
		session.setAttribute("current", currentPost);
		request.setAttribute("currentPost", currentPost);
		request.setAttribute("previousPost", previousPost);
		request.setAttribute("nextPost", nextPost);
		request.getRequestDispatcher("single.jsp").forward(request, response);
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		request.getRequestDispatcher("form.jsp").forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("post_id"));
		Post currentPost = postDAO.selectPost(con, id);
		request.setAttribute("currentPost", currentPost);
		HttpSession session = request.getSession();
		session.setAttribute("curretPostImage", currentPost.getPostImage());
		request.getRequestDispatcher("form.jsp").forward(request, response);
	}
	
	private void addPost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		int author = (int)session.getAttribute("currentUser");
		String title = request.getParameter("post_title");
		String[] allCategories = request.getParameterValues("post_categories");
		String categories = "";
		for(int i=0; i<allCategories.length - 1; i++) {
			categories += allCategories[i] + ", ";
		}
		categories += allCategories[allCategories.length - 1];
		String content = request.getParameter("post_content");
		Blob postImage;
		
		if(request.getPart("post_image") != null) {
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
			postImage = new SerialBlob(buffer.toByteArray());
		} else {
			postImage = null;
		}
		
		Post newPost = new Post(title, categories, content, author, postImage);
		postDAO.insertPost(con, newPost);
		response.sendRedirect("admin");
	}
	
	private void updatePost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException, ServletException {
		int postID = Integer.parseInt(request.getParameter("post_id"));
		HttpSession session = request.getSession();
		int author = (int)session.getAttribute("currentUser");
		String title = request.getParameter("post_title");
		String[] allCategories = request.getParameterValues("post_categories");
		String categories = "";
		for(int i=0; i<allCategories.length - 1; i++) {
			categories += allCategories[i] + ", ";
		}
		categories += allCategories[allCategories.length - 1];
		String content = request.getParameter("post_content");
		Blob postImage;
		
		if(request.getPart("post_image") != null) {
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
			postImage = new SerialBlob(buffer.toByteArray());
		} else {
			postImage = null;
		}
		
		Post post = new Post(postID, title, categories, content, author, postImage);
		postDAO.updatePost(con, post);
		response.sendRedirect("admin");
	}
	
	private void deletePost(HttpServletRequest request, HttpServletResponse response, Connection con) 
			throws SQLException, IOException {
		int postID = Integer.parseInt(request.getParameter("post_id"));
		postDAO.deletePost(con, postID);
		response.sendRedirect("admin");

	}
	
//	==========================  Users Controller  ================================
	
	private void listAllUsers(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		List<User> listUsers = userDAO.selectAllUsers(con);
		request.setAttribute("listAllUsers", listUsers);
		request.getRequestDispatcher("about.jsp").forward(request, response);
	}
	
	private void showLoginForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	
	private void toLogin(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		request.getRequestDispatcher("admin").forward(request, response);
	}
	
	private void toLogout(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getRequestDispatcher("/").forward(request, response);
	}
	
	private void showSignupForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}
	
	private void addNewUser(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		byte[] passwordByte = password.getBytes();
		String encodedPassword = encoder.encodeToString(passwordByte);
		User newUser = new User(username, email, encodedPassword);
		userDAO.insertUser(con, newUser);
		request.getRequestDispatcher("login").forward(request, response);
	}
	
	private void showProfileEditForm(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		int authorID = (int)session.getAttribute("currentUser");
		User currentUser = userDAO.selectUser(con, authorID);
		request.setAttribute("currentUserProfile", currentUser);
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	
	private void updateProfile(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		int authorID = (int)session.getAttribute("currentUser");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String introduction = request.getParameter("introduction");
		Blob userImage;
		
		if(request.getPart("image") != null) {
			InputStream inputStream = null;
			Part image = request.getPart("image");
			if(image != null) {
				inputStream = image.getInputStream();
			}
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			int nRead;
			byte[] data = new byte[16384];
			while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
			  buffer.write(data, 0, nRead);
			}
			userImage = new SerialBlob(buffer.toByteArray());
		} else {
			userImage = null;
		}
		
		User updateUser = new User(authorID, username, email, nickname, introduction, userImage);
		userDAO.updateUser(con, updateUser);
		request.getRequestDispatcher("admin").forward(request, response);
	}
	
//	=====================  show image  =============================
	
	private void showPostImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		Post current = (Post)session.getAttribute("current");
		Blob image = current.getPostImage();
		byte[] byteArr = image.getBytes(1, (int)image.length());
		response.setContentType("image/jpg");
		OutputStream os = response.getOutputStream();
		os.write(byteArr);
	}
	
	private void showUserImage(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("user_id"));
		User current = userDAO.selectUser(con, id);
		Blob image = current.getUserImage();
		byte[] byteArr = image.getBytes(1, (int)image.length());
		response.setContentType("image/jpg");
		OutputStream os = response.getOutputStream();
		os.write(byteArr);
	}
}












