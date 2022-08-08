SELECT * FROM animales WHERE name LIKE '%mon';

SELECT * FROM animales WHERE data_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animales WHERE neutered = true AND escape_attempts < 3;

SELECT name, data_of_birth FROM animales WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animales WHERE weight_kg > 10.5;

SELECT * FROM animales WHERE neutered = true;

SELECT * FROM animales WHERE name != 'Gabumon';

SELECT * FROM animales WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;