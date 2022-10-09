-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT NOT NULL REFERENCES passenger(id) ON DELETE SET NULL,
  flighttime INT NOT NULL REFERENCES flightinfo(id) ON DELETE SET NULL,
  airline INT NOT NULL REFERENCES airlines(id) ON DELETE SET NULL,
  locations INT NOT NULL REFERENCES destination(id) ON DELETE SET NULL,
);

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL, 
  seat_number TEXT NOT NULL,
)

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
)

CREATE TABLE flightinfo (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL, 
  arrival TIMESTAMP NOT NULL,

)

CREATE TABLE destination (
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  to_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_country TEXT NOT NULL,
)

INSERT INTO passenger (first_name, last_name)
VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal');

INSERT INTO airlines (airline_name)
VALUES ('United'), ('British Airways'), ('Delta');

INSERT INTO flightinfo (departure, arrival)
VALUES ('2018-04-08 09:00:00', '2018-04-08 12:00:00'), ('2018-12-19 12:45:00', '2018-12-19 16:15:00');

INSERT INTO destination (from_city, to_city, from_country, to_country)
VALUES ('Washington DC', 'Seattle', 'United States', 'United States'), ('Tokyo', 'London', 'Japan', 'United Kingdom');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  