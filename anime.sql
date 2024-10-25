create database db_webanime
go
use db_webanime
go
-- Bảng Account
CREATE TABLE Account (
    accountName VARCHAR(255) PRIMARY KEY,
    passWord VARCHAR(255) NOT NULL,
    userName NVARCHAR(255),
    role int
);
go

-- thể loại
Create Table Type_anime(
	  id_type INT PRIMARY KEY IDENTITY(1,1) ,
	  name_type NVARCHAR(50)
)
go

-- Quốc gia
Create Table Nation(
	  id_Nation INT PRIMARY KEY IDENTITY(1,1) ,
	  name_type NVARCHAR(50)
)
go
--
-- Bảng Anime
CREATE TABLE Anime (
    id_anime INT PRIMARY KEY IDENTITY(1,1) ,
    name NVARCHAR(255) NOT NULL,
    year INT,
    author NVARCHAR(255),
    content TEXT,
    status NVARCHAR(50),
    type VARCHAR(50),
	number_episode int,
	image_outside text,
	image_inside text,
	number_like int,
	number_watch int,
	id_Nation int,
	id_type int,
	foreign key (id_Nation) references Nation(id_Nation),
	foreign key (id_type) references Type_anime(id_type)
   
);
go
-- Tập
CREATE TABLE Episode (
    id_episode INT PRIMARY KEY IDENTITY(1,1) ,
    id_anime INT,
	season int,
    name_episode VARCHAR(255),
    video VARCHAR(255),
    FOREIGN KEY (id_anime) REFERENCES Anime(id_anime)
);
go
-- Bảng Comment
CREATE TABLE Comment (
	id_commnet INT PRIMARY KEY IDENTITY(1,1) ,
    accountName VARCHAR(255),
	id_episode INT,
    content TEXT,
	FOREIGN KEY (id_episode) REFERENCES Anime(id_anime),
	FOREIGN KEY (accountName) REFERENCES  Account(accountName)

);
go
-- Bảng Repose_Comment
CREATE TABLE Repose_Comment (
	id_repose INT PRIMARY KEY IDENTITY(1,1) ,
    id_comment INT ,
    accountName VARCHAR(255),
	content TEXT,
    FOREIGN KEY (id_comment) REFERENCES Comment(id_commnet),
    FOREIGN KEY (accountName) REFERENCES Account(accountName)
);




