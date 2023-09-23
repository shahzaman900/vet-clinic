/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  ( 1, 'Agumon', '03-02-2020', 0, true, 10.23),
  ( 2, 'Gabumon', '15-11-2020', 0, true, 10.23),
  ( 3, 'Pikachu', '07-01-2020', 0, true, 10.23),
  ( 4, 'Devimon', '12-05-2020', 0, true, 10.23);


INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (5, 'Charmander', '2020-02-08', 0, false, -11),
  (6, 'Plantmon', '2021-11-15', 2, true, -5.7),
  (7, 'Squirtle', '1993-04-02', 3, false, -12.13),
  (8, 'Angemon', '2005-06-12', 1, true, -45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17),
  (11, 'Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34 ),
('Jennifer Orwell', 19 ),
('Bob ', 45 ),
('Melody Pond', 14 ),
('Dean Winchester', 14 ),
('Jodie Whittaker', 38 );

INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');


 UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Digimon')
   WHERE name like '%mon';

UPDATE animals AS a
SET species_id = s.id
FROM species AS s
WHERE a.species_id IS NULL AND s.name = 'Pokemon';


UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

-------------------------------------------
-- insert data in vets table
------------------------------------------
INSERT INTO vets(
  name, age, date_of_graduation
)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');