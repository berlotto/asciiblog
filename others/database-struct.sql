BEGIN TRANSACTION;
CREATE TABLE post (
	id INTEGER NOT NULL, 
	title VARCHAR(150), 
	slug VARCHAR(500), 
	resume VARCHAR(1000), 
	content TEXT, 
	date_created timestamp, 
	date_updated timestamp, 
	picture VARCHAR(200), 
	featured VARCHAR(1), tags varchar(500) null, 
	PRIMARY KEY (id), 
	UNIQUE (slug)
);
CREATE TABLE comment (
	id INTEGER NOT NULL, 
	content VARCHAR(2000), 
	date_created timestamp, 
	reply_for INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(reply_for) REFERENCES comment (id)
);
CREATE TABLE link (
	id INTEGER NOT NULL, 
	name VARCHAR(100), 
	url VARCHAR(1000), 
	PRIMARY KEY (id)
);
CREATE TABLE "like" (
	id INTEGER NOT NULL, 
	comment INTEGER, 
	post INTEGER, 
	link INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(comment) REFERENCES comment (id), 
	FOREIGN KEY(post) REFERENCES post (id), 
	FOREIGN KEY(link) REFERENCES link (id)
);
CREATE TABLE page (date_updated timestamp, date_created timestamp, id INTEGER PRIMARY KEY, title VARCHAR(150), slug VARCHAR(500), content TEXT);

COMMIT;
