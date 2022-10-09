-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES orbits_around(id) ON DELETE CASCADE,
  galaxy INT REFERENCES galaxy(id) ON DELETE CASCADE,
  moons INT REFERENCES moons(id) ON DELETE CASCADE,
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY, 
  galaxy_name TEXT NOT NULL,
);

CREATE TABLE orbits_around (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

INSERT INTO moons(name)
VALUES ('The Moon'), ('Phobos'), ('Deimos');

INSERT INTO galaxy(galaxy_name)
VALUES ('Milky Way')

INSERT INTO orbits_around(name)
VALUES ('The Sun')

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES ('Earth', 1.00, 1, 1, 1), ('Mars', 1.88, 1, 1,2), ('Mars', 1.88, 1, 1, 3), ('Venus', 0.62, 1, 1, 0) 

