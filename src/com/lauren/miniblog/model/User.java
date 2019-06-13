package com.lauren.miniblog.model;

import java.sql.Blob;

public class User {
	private int userID;
	private String username;
	private String password;
	private String email;
	private String nickname;
	private String introduction;
	private Blob userImage;
	private int numOfPosts;
	
	public User() {
		
	}
	
	public User(String username, String email, String password) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
	public User(int userID, String username, String email, String password) {
		super();
		this.userID = userID;
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
	public User(int userID, String username, String email, String nickname, String introduction,
			Blob userImage) {
		super();
		this.userID = userID;
		this.username = username;
		this.email = email;
		this.nickname = nickname;
		this.introduction = introduction;
		this.userImage = userImage;
	}
	
	public User(int userID, String username, String email, String nickname, String introduction,
			Blob userImage, int numOfPost) {
		super();
		this.userID = userID;
		this.username = username;
		this.email = email;
		this.nickname = nickname;
		this.introduction = introduction;
		this.userImage = userImage;
		this.numOfPosts = numOfPost;
	}
	
	public User(int userID, String username, String password, String email, String nickname, String introduction,
			Blob userImage) {
		super();
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.introduction = introduction;
		this.userImage = userImage;
	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Blob getUserImage() {
		return userImage;
	}
	public void setUserImage(Blob userImage) {
		this.userImage = userImage;
	}

	public int getNumOfPosts() {
		return numOfPosts;
	}

	public void setNumOfPosts(int numOfPosts) {
		this.numOfPosts = numOfPosts;
	}
	
	
	
}
