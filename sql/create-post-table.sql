create table Posts (
	post_id int not null AUTO_INCREMENT,
	post_title varchar(255) not null,
	post_categories varchar(255) not null,
	post_content text not null,
	author_id int not null,
	post_image mediumblob,
	PRIMARY KEY (post_id),
	FOREIGN KEY (author_id) REFERENCES Users (user_id)
);

