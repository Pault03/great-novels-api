CREATE DATABASE novels;

CREATE USER 'novels_user'@'localhost' IDENTIFIED BY 'NovelBooks!';

GRANT ALL ON novels.* TO 'novels'@'localhost';

USE novels;

CREATE TABLE authors (
	id INT auto_increment,
	nameFirst VARCHAR(255),
	nameLast VARCHAR(255),
	createdAt DATETIME DEFAULT NOW(),
	updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
	deletedAt DATETIME,
	PRIMARY KEY(id)
);

CREATE Table genres (
	id INT auto_increment,
	name VARCHAR(255),
	createdAt DATETIME DEFAULT NOW(),
	updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
	deletedAt DATETIME,
	PRIMARY KEY(id)
);

CREATE TABLE novels (
	id INT auto_increment,
	title VARCHAR(255),
	authorId INT,
	createdAt DATETIME DEFAULT NOW(),
	updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
	deletedAt DATETIME,
	PRIMARY KEY(id),
	FOREIGN KEY(authorId) REFERENCES authors(id)
    );
CREATE TABLE novelsGenres(
	genreId INT,
	novelId INT,
	createdAt DATETIME DEFAULT NOW(),
	updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
	deletedAt DATETIME,
	PRIMARY KEY(genreId, novelId),
	FOREIGN KEY(genreId) REFERENCES genres(id),
	FOREIGN KEY(novelId) REFERENCES novels(id)
);

INSERT INTO authors (nameFirst, nameLast) 
VALUES ("Bram", "Stoker"),
("Oscar","Wilde"),
("Alice","Walker"),
("Leo","Tolstoy"),
("Charles","Dickens"),
("Arthur","Miller"),
("Alexandre","Dumas"),
("Arthur Conan","Doyle"),
("Robert Louis","Stevenson"),
("Fyodor","Dostoyevsky"),
("Agatha","Christie"),
("Ray","Bradbury"),
("George","Orwell"),
("H.G.","Wells"),
("Chinua","Achebe");

INSERT INTO genres (name) 
VALUES ("Adventure"),
("African Literature"),
("Crime"),
("Drama"),
("Dystopia"),
("Fantasy"),
("Fiction"),
("French Literature"),
("Gothic"),
("Historical Fiction"),
("Horror"),
("Mystery"),
("Plays"),
("Russian Literature"),
("Science Fiction"),
("Thriller"),
("Time Travel"),
("War");

INSERT INTO novels (title,authorId) 
VALUES ("Dracula",1),
("The Picture of Dorian Gray",2),
("The Color Purple",3),
("War and Peace",4),
("A Tale of Two Cities",5),
("The Crucible",6),
("The Three Musketeers",7),
("The Hound of the Baskervilles",8),
("The Strange Case of Dr. Jekyll and Mr. Hyde",9),
("Crime and Punishment",10),
("Murder on the Orient Express",11),
("Fahrenheit 451",12),
("Animal Farm",13),
("The Time Machine",14),
("Things Fall Apart",15);