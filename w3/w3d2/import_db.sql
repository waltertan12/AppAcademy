DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Ned","Stark"),
  ("John","Smith"),
  ("Jane","Doe"),
  ("Michael","Scott"),
  ("Jim","Halpert"),
  ("Pam","Beasley"),
  ("Dwight","Schrute"),
  ("Andrew","Bernard"),
  ("Sterling", "Archer");


INSERT INTO
  questions(title, body, author_id)
VALUES
  ("How many toads are in the world?", "How many?", 1),
  ("Which black bear is best?","Bears. Beets. Battlestar Galactica", 5),
  ("What's a gill?","What is it?", 9),
  ("Do  you think winter is coming?","Because Winter is Coming", 1);

INSERT INTO
  replies(body, question_id, user_id, parent_id)
VALUES
  ("Identity theft is not a joke, Jim.", 2, 7, null),
  ("There are many different kinds of toads", 1, 3, null),
  ("What are some kinds of toas?",1,2,2);

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7),
  (1, 8),
  (2, 4);


INSERT INTO
  question_follows(question_id, user_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 5),
  (1, 6);
