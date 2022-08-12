SELECT * FROM animales WHERE name LIKE '%mon';

SELECT * FROM animales WHERE data_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animales WHERE neutered = true AND escape_attempts < 3;

SELECT name, data_of_birth FROM animales WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animales WHERE weight_kg > 10.5;

SELECT * FROM animales WHERE neutered = true;

SELECT * FROM animales WHERE name != 'Gabumon';

SELECT * FROM animales WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- SECOND DAY

BEGIN TRANSACTION;

UPDATE animales SET species = 'unspecified';

SELECT * FROM animales;

ROLLBACK;

BEGIN TRANSACTION;

UPDATE animales SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animales SET species = 'pokemon' WHERE species IS null;

COMMIT TRANSACTION;

SELECT * FROM animales;

BEGIN TRANSACTION;

DELETE FROM animales;

SELECT * FROM animales;

ROLLBACK;

SELECT * FROM animales;

BEGIN TRANSACTION;

DELETE FROM animales WHERE data_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animales SET weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE animales SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

SELECT * FROM animales;

COMMIT TRANSACTION;


-- DAY 2 QUARIES

SELECT COUNT(*) FROM animales;

SELECT COUNT(*) FROM animales WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animales;

SELECT neutered, SUM(escape_attempts) FROM animales GROUP BY neutered;

SELECT neutered, MAX(weight_kg) as Max_weight, MIN(weight_kg) as Min_weight  FROM animales GROUP BY neutered;

SELECT neutered, AVG(escape_attempts) as Average_escape_attempts FROM animales WHERE data_of_birth <= '2000-12-31' AND data_of_birth >= '1990-01-01' GROUP BY neutered;



-- Day 3


SELECT full_name AS owner, name AS animal FROM owners 
JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';

SELECT A.name as animal, S.name as species FROM species S 
JOIN animals A ON S.id = A.species_id WHERE S.name = 'Pokemon';

SELECT O.full_name as Owner, A.name as Animals FROM owners O 
LEFT JOIN animals A ON O.id = A.owner_id;

SELECT S.name as Species, COUNT(A.name) as Total_number FROM species S 
JOIN animals A ON S.id = A.species_id
GROUP BY S.name;

SELECT O.full_name as owner, A.name as animal, S.name as type FROM owners O JOIN animals A ON O.id = A.owner_id
JOIN species S ON S.id = A.species_id
WHERE O.full_name = 'Jennifer Orwell' AND S.name = 'Digimon';

SELECT O.full_name as owner, A.name as animal 
FROM owners O JOIN animals A ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

SELECT agg.full_name as owner, count as Total_number FROM
(SELECT full_name, count(a.owner_id) FROM owners O
JOIN animals A ON O.id = A.owner_id GROUP BY O.full_name) AS agg 
WHERE count = (SELECT MAX(count) FROM (SELECT full_name, count(a.owner_id) FROM owners O
JOIN animals A ON O.id = A.owner_id GROUP BY O.full_name) AS agg); 


-- day 4

-- Who was the last animal seen by William Tatcher?

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Vet William Tatcher'
AND visits.date_of_visit = (SELECT MAX(visits.date_of_visit) FROM visits
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Vet William Tatcher');

-- How many different animals did Stephanie Mendez see?

SELECT DISTINCT COUNT(animals.name)
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Vet Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id
ORDER BY vets.id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Vet Stephanie Mendez'
    AND visits.date_of_visit BETWEEN '2020-04-01'
    AND '2020-08-30';


-- What animal has the most visits to vets?

SELECT animals.name, COUNT(animals.name) AS total_visits FROM animals
    LEFT JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY total_visits DESC;

-- Who was Maisy Smith's first visit?

SELECT
    animals.name
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vet_id
WHERE
    vets.name = 'Vet Maisy Smith'
    AND visits.date_of_visit = (
        SELECT
            MIN(visits.date_of_visit)
        FROM
            visits
            JOIN vets ON vets.id = visits.vet_id
        WHERE
            vets.name = 'Vet Maisy Smith'
    );


-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT animals.name as "Animal's_name",
    animals.date_of_birth as date_of_birth_of_animal,
    vets.name as Vet_name,
    species.name as Species,
    visits.date_of_visit as Date_of_visit
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vet_id
    JOIN species on species.id = animals.species_id
WHERE
    Date_of_visit = (
        SELECT
            MAX(Date_of_visit)
        FROM
            visits
            JOIN vets ON vets.id = visits.vet_id
    );


-- How many visits were with a vet that did not specialize in that animal's species?

SELECT
    count(vets.name)
FROM
    vets FULL
    JOIN specializations ON specializations.vet_id = vets.id FULL
    JOIN visits ON visits.vet_id = vets.id
where
    specializations.vet_id is null;

-- 9. What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT
    species.name AS "Species name",
    COUNT(*)
FROM
    animals
    JOIN visits on visits.animalS_id = animals.id
    JOIN vets on vets.id = visits.vet_id
    JOIN species on species.id = animals.species_id
WHERE
    vets.name = 'Vet Maisy Smith'
GROUP by
    species.name
ORDER BY
    count DESC
lIMIT 1;

