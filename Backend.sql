CREATE DATABASE Resume;


USE Resume;

CREATE TABLE Navbar_items(
    item_name VARCHAR(60),
    ID int IDENTITY(1,1) PRIMARY KEY,
)

INSERT INTO Navbar_items (item_name) VALUES('AboutMe');
INSERT INTO Navbar_items (item_name) VALUES('Skills');
INSERT INTO Navbar_items (item_name) VALUES('Passion');
INSERT INTO Navbar_items (item_name) VALUES('AboutMe');


CREATE TABLE users(
    username VARCHAR(60),
    Firname VARCHAR(60),
    Lastname VARCHAR(60),
    PASS VARCHAR(60),
    DateOfBirth DATE,
    addr VARCHAR(60),
    email VARCHAR(70),
    stat BIT DEFAULT 0,
    isAdmin int,
    userId INT IDENTITY(1,1) PRIMARY key
)

-- INSERT INTO users(username,Firname, Lastname,PASS,DateOfBirth,addr, email,isAdmin) VALUES('IsraRagheb','Isra','Ragheb','letsstart100%','1997-11-5','Maadi','israragheb@gmail.com',1);


SELECT * from users WHERE username='IsraRagheb' And PASS='letsstart100%';

CREATE TABLE carsoule_images(
 Caro_image VARCHAR(100),
 add_date DATE,
 ID INT IDENTITY(1,1) PRIMARY KEY 
)



INSERT INTO carsoule_images (Caro_image,add_date) VALUES('Caro1.JPG','2018-07-28');
INSERT INTO carsoule_images (Caro_image,add_date) VALUES('Caro2.JPG','2018-07-28');
INSERT INTO carsoule_images (Caro_image,add_date) VALUES('Caro3.JPG','2018-07-28');



/*insertions*/


CREATE TABLE Passion(
 image_1 VARCHAR(100),
 image_2 VARCHAR(100),
 image_3 VARCHAR(100),
 image_4 VARCHAR(100),
 passion_name VARCHAR(100) PRIMARY KEY
)


INSERT INTO Passion (image_1,image_2,image_3,image_4,passion_name) VALUES ('Pass1.JPG','Pass2.JPG','Pass3.JPG','','Photography');
INSERT INTO Passion (image_1,image_2,image_3,image_4,passion_name) VALUES ('Teaching');
INSERT INTO Passion (image_1,image_2,image_3,image_4,passion_name) VALUES ('Writing');



CREATE TABLE BlogPosts(
    Post VARCHAR(Max),
    Title VARCHAR(100),
    archive BIT DEFAULT 0,
    attache VARCHAR(100),
    pdate DATE,
    postID INT IDENTITY(1,1) PRIMARY KEY
)

INSERT INTO Archive (Post,Title,archive,attache,pdate,postID) Select Post,Title,archive,attache,pdate,postID from BlogPosts WHERE postID=2 ;
select * FROM BlogPosts;

-- ALETR TABLE DA PDATE
ALTER TABLE BlogPosts
ALTER COLUMN pdate DATE;

create TABLE PostLikes(
    LikerID INT,
    dislike INT,
    postId INT,
    heart INT,
    brokenheart INT,
    emo INT,
    Angry INT
)

INSERT into PostLikes (heart,postId) VALUES(1,1);

select * FROM PostLikes;

DROP TABLE PostLikes;

select count("Angru") As countoflikes FROM PostLikes  WHERE  postId=14;

CREATE TABLE Messages(
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Sub VARCHAR(100),
    mess VARCHAR(max),
    messdate DATE,
    Id INT IDENTITY(1,1) PRIMARY key
)

DROP TABLE Messages;
SELECT * FROM Messages;

CREATE TABLE Archive(
    Post VARCHAR(Max),
    Title VARCHAR(100),
    archive BIT DEFAULT 0,
    attache VARCHAR(500),
    pdate DATETIME,
    postID INT PRIMARY KEY
)

SELECT * FROM Archive;
DELETE From Archive WHERE postID=5;


CREATE TABLE ArchiveComments(
    cId INT IDENTITY(1,1),
    comment VARCHAR(60),
    Cdate VARCHAR(60),
    postID INT,
    PRIMARY KEY (cId,postID),
    FOREIGN KEY (postID) REFERENCES Archive(postID)
)

CREATE TABLE PostCommets(
    cId INT IDENTITY(1,1),
    comment VARCHAR(60),
    Cdate VARCHAR(60),
    postID INT,
    PRIMARY KEY (cId,postID),
    FOREIGN KEY (postID) REFERENCES BlogPosts(postID)
)


DROP TABLE PostCommets;
INSERT INTO PostCommets (comment, Cdate ,postID ) VALUES('llllll','2018-09-11',5)
select * from  PostCommets;