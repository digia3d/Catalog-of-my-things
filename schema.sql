CREATE TABLE item (
  id INT GENERATED ALWAYS AS DEFAULT,
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES author (id),
  source_id INT REFERENCES source (id),
  label_id INT REFERENCES label (id),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY id,
)

CREATE TABlE book (
  id INT GENERATED ALWAYS AS DEFAULT,
  publisher VARCHAR(200),
  cover_state VARCHAR(20),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY id,
)

CREATE TABLE label (
  id INT GENERATED ALWAYS AS DEFAULT,
  title VARCHAR(200),
  color VARCHAR(200),
  PRIMARY KEY id,
)
