CREATE DATABASE catalog;

CREATE TABLE Label (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR,
  color VARCHAR
);

CREATE TABLE author (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR,
  last_name VARCHAR
);

CREATE TABLE genres (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE item (
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 genre_id INT,
 author_id INT,
 label_id INT,
 publish_date DATE,
  archived BOOLEAN,
 FOREIGN KEY (genre_id) REFERENCES genres(id),
 FOREIGN KEY (author_id) REFERENCES author(id),
 FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE Book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR,
  cover_state VARCHAR,
  FOREIGN KEY (id) REFERENCES item(id)
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY, 
  multiplayer BOOLEAN,
  last_played_at DATE NOT NULL,
  archived BOOLEAN,
  FOREIGN KEY (id) REFERENCES item(id)  
);

CREATE TABLE music_albums (
    id  INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY(id) REFERENCES item(id)
);