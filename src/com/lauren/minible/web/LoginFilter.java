package com.lauren.minible.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lauren.miniblog.dao.UserDAO;
import com.lauren.miniblog.model.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/toLogin")
public class LoginFilter implements Filter {
	private UserDAO userDAO;
	final Base64.Encoder encoder = Base64.getEncoder();
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		ServletContext ctx = request.getServletContext();
		Connection con = (Connection)ctx.getAttribute("dbconnection");
//		List<User> listUsers = userDAO.selectAllUsers(con);
		String username = request.getParameter("username");
		User user = userDAO.selectUserByUsername(con, username);
		String password = request.getParameter("password");
		byte[] passwordByte = password.getBytes();
		String encodedPassword = encoder.encodeToString(passwordByte);
		if(user != null) {
			System.out.println("login user checking prepare");
			if(user.getPassword().equals(encodedPassword)) {
				System.out.println("login user checked");
				HttpSession session = req.getSession();
				session.setAttribute("currentUser", user.getUserID());
				if(user.getNickname() != null) {
					session.setAttribute("currentUserName", user.getNickname());
				} else {
					session.setAttribute("currentUserName", user.getUsername());
				}
				chain.doFilter(req, res);
			} else {
				System.out.println("login error");
				res.sendRedirect("login?login_error=true");
			}
		} else {
			System.out.println("login error");
			res.sendRedirect("login?login_error=true");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		userDAO = new UserDAO();
	}

}
