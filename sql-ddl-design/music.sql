-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INT REFERENCES artists(id) ON DELETE SET NULL,
  album INT REFERENCES album(id) ON DELETE SET NULL,
  producers INT REFERENCES producers(id) ON DELETE SET NULL,
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL,
);

CREATE TABLE album (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL,
  artist INT REFERENCES artists(id) ON DELETE SET NULL,
)

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

INSERT INTO artists (name)
VALUES ('Hanson'), ('Queen'), ('Avril Lavigne')

INSERT INTO album (name, artist)
VALUES ('Middle of Nowhere', 1), ('A Night at the Opera', 2), ('Let Go', 3);

INSERT INTO producers (name)
VALUES ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('The Matrix');

INSERT INTO songs (title, duration_in_seconds, release_date, artists, album, producers)
VALUES ('MMMBop', 238, '04-15-1997', 1, 1, 1), ('MMMBop', 238, '04-15-1997', 1, 1, 2), ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 3), ('Complicated', 244, '05-14-2002', 3, 3, 4);



