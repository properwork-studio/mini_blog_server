package com.lauren.miniblog.model;

import java.sql.Blob;

public class Post {
	private int postID;
	private String postTitle;
	private String postCategories;
	private String postContent;
	private int authorID;
	private Blob postImage;
	
	
	public Post() {
		
	}
	
	public Post(int postID, String postTitle, String postCategories, String postContent, Blob postImage) {
		super();
		this.postID = postID;
		this.postTitle = postTitle;
		this.postCategories = postCategories;
		this.postContent = postContent;
		this.postImage = postImage;
	}
	
	public Post(int postID, String postTitle, String postCategories, String postContent, int authorID, Blob postImage) {
		super();
		this.postID = postID;
		this.postTitle = postTitle;
		this.postCategories = postCategories;
		this.postContent = postContent;
		this.authorID = authorID;
		this.postImage = postImage;
	}
	
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostCategories() {
		return postCategories;
	}
	public void setPostCategories(String postCategories) {
		this.postCategories = postCategories;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public Blob getPostImage() {
		return postImage;
	}
	public void setPostImage(Blob postImage) {
		this.postImage = postImage;
	}
	
	
}
