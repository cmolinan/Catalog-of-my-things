-- Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
-- books table (add all properties and associations from the parent Item class as table columns)
-- labels table

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

CREATE TABLE item (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publish_date DATE,
  archived BOOLEAN,
	-- FOREIGN KEY (genre_id) REFERENCES genre(id),
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
  id INT GENERATED ALWAYS AS IDENTITY
  multiplayer BOOLEAN,
  last_played_at DATE NOT NULL,
  archived BOOLEAN,
  CONSTRAINT fk_authors FOREIGN KEY(id) REFERENCES authors(id)
);
