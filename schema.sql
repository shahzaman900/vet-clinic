/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT PRIMARY KEY NOT NULL,
  name CHAR(50),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species varchar(500);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY NOT NULL,
  full_name VARCHAR(50),
  age INT
)

CREATE TABLE species(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50)
)