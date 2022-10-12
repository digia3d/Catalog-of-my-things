CREATE TABLE Item (
  id INT GENERATED ALWAYS AS DEFAULT,
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES author (id),
  source_id INT REFERENCES source (id),
  label_id INT REFERENCES label (id),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY id,
)
