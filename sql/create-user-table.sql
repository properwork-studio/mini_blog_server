create table Users (
	user_id int not null AUTO_INCREMENT,
	username varchar(255) not null,
	user_password varchar(255) not null,
	email varchar(255),
	nickname varchar(255),
	introduction text,
	user_image longblob,
	PRIMARY KEY (user_id)
);

