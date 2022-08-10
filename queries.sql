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

