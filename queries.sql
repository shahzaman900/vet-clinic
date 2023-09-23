/*Queries that provide answers to the questions from all projects.*/

SELECT name
      FROM animals
      WHERE name LIKE '%mon%';
-- ///////////////////////////////////////////////////////////
SELECT name
FROM animals
WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01';
-- //////////////////////////////////////////////////////////
SELECT name
FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;
-- ////////////////////////////////////////////////////////////
SELECT date_of_birth
FROM animals
WHERE name = 'Agumon' OR name = 'Pikachu';
-- ///////////////////////////////////////////////////////////
SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;
-- ///////////////////////////////////////////////////////////
SELECT *
FROM animals
WHERE neutered = true;
-- ///////////////////////////////////////////////////////////
SELECT *
FROM animals
WHERE name != 'Gabumon';
-- ///////////////////////////////////////////////////////////
SELECT *
FROM animals
WHERE weight_kg >= 10.5 AND weight_kg <= 17.3;
-- //////////////////////////////////////////////////////////
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- ///////////////////////////////////////////////////////////
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
SELECT * FROM animals;
UPDATE animals
SET species = 'pokemon'
WHERE species IS null;
SELECT * FROM animals;
COMMIT;
-- ///////////////////////////////////////////////////////////
BEGIN;
TRUNCATE animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- //////////////////////////////////////////////////////////
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2020-01-01';
SAVEPOINT sp1;
SELECT * FROM animals;
UPDATE animals
SET weight_kg = weight_kg * (-1);
SELECT * FROM animals;
ROLLBACK TO sp1;
SELECT * FROM animals;
COMMIT;
-- //////////////////////////////////////////////////////////
SELECT count (*) FROM animals;
-- -- /////////////////
SELECT count (*) FROM animals
WHERE escape_attempts = 0;
-- -- //////////////////
SELECT AVG(weight_kg) FROM animals;
-- -- //////////////////
SELECT neutered, COUNT(*) AS escape_count
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;
-- -- //////////////////
SELECT max(weight_kg), min(weight_kg)
FROM animals;
-- ///////////////////////
SELECT avg(escape_attempts)
FROM animals
WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01'
-- /////////////////////////////////////////////

SELECT * FROM animals LEFT JOIN owners
ON  owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT * FROM animals LEFT JOIN species
ON  species_id = species.id
WHERE species.name = 'Pokemon';

SELECT *
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, count(animals.name)
FROM species
INNER JOIN animals
ON species.id = animals.species_id
GROUP BY species.name

SELECT owners.full_name, count(animals.id)
FROM animals
JOIN species on animals.species_id = species.id
JOIN owners on animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell'
GROUP BY owners.full_name

SELECT owners.full_name, COUNT(animals.id)
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id AND animals.escape_attempts = 0
WHERE owners.full_name = 'Dean Winchester'
GROUP BY owners.full_name;

SELECT owners.full_name, count(animals.id) AS animal_count
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

--------------------------------------
-- QUERIES
-- ----------------------------------------
-- Who was the last animal seen by William Tatcher?
SELECT animals.name AS last_animal_seen
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

-------------------------------------------------------
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT aNIMALS.id) AS different_animals_seen
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez';

-------------------------------------------------------
-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet_name, species.name AS specialty_name
FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vet_id
LEFT JOIN species
ON specializations.species_id = species.id
ORDER BY vets.name, species.name;

-----------------------------------------------------------------
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT DISTINCT animals.name AS animal_name, visits.visit_date AS visit_date
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez'
  AND visits.visit_date >= '2020-04-01'
  AND visits.visit_date <= '2020-08-30';

------------------------------------------------------------------
-- What animal has the most visits to vets?
SELECT animals.name AS animal_name, COUNT(*) AS visit_count
FROM visits
JOIN animals
ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

----------------------------------------------------------------
-- Who was Maisy Smith's first visit?
SELECT animals.name AS first_visit_animal
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date
LIMIT 1;

-----------------------------------------------------------------
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
    animals.name AS animal_name,
    vets.name AS vet_name,
    visits.visit_date AS visit_date
FROM visits
JOIN vets
ON visits.vet_id = vets.id
JOIN animals
ON visits.animal_id = animals.id
ORDER BY visits.visit_date DESC
LIMIT 1;

-------------------------------------------------------------------
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS visits_without_specialty
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id
WHERE specializations.vet_id IS NULL;

-------------------------------------------------------------------
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS potential_specialty, COUNT(*) AS visit_count
FROM visits
JOIN vets
ON visits.vet_id = vets.id
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visit_count DESC
LIMIT 1;