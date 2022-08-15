/* Populate database with  rows. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, True, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, True, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, False, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, True, 11);

-- DAY 2

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, False, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Planton', '2021-11-15', 2, True, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '2005-04-02', 3, False, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, True, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, True, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, True, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, True, 22);


-- day 3

INSERT INTO owners (full_name ,age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name ,age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name ,age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name ,age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name ,age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name ,age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS Null;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Planton';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';



-- Day 4


INSERT INTO vets(name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, '2000-04-23');

INSERT INTO vets(name, age, date_of_graduation)
VALUES ('Vet Maisy Smith', 26, '2019-01-17');

INSERT INTO vets(name, age, date_of_graduation)
VALUES ('Vet Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets(name, age, date_of_graduation)
VALUES ('Vet Jack Harkness', 38, '2008-06-08');



INSERT INTO specializations(vet_id, species_id)
 VALUES((SELECT V.id FROM vets V WHERE V.name = 'Vet William Tatcher'),
(SELECT S.id FROM species S WHERE S.name = 'Pokemon'));

INSERT INTO specializations(vet_id, species_id)
VALUES((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
(SELECT S.id FROM species S WHERE S.name = 'Digimon'));

INSERT INTO specializations(vet_id, species_id)
VALUES((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
(SELECT S.id FROM species S WHERE S.name = 'Pokemon'));

INSERT INTO specializations(vet_id, species_id)
VALUES((SELECT V.id FROM vets V WHERE V.name = 'Vet Jack Harkness'),
(SELECT S.id FROM species S WHERE S.name = 'Digimon'));

ALTER TABLE visits ADD date_of_visit date;


INSERT INTO visits (vet_id, animals_id, date_of_visit)
VALUES ((SELECT V.id FROM vets V WHERE V.name = 'Vet William Tatcher'),
(SELECT A.id FROM animals A WHERE A.name = 'Agumon'), '2020-05-24');

INSERT INTO visits (vet_id, animals_id, date_of_visit)
VALUES ((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
        (SELECT A.id FROM animals A WHERE A.name = 'Agumon'), '2020-07-22'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Jack Harkness'),
        (SELECT A.id FROM animals A WHERE A.name = 'Gabumon'), '2021-02-02'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Pikachu'), '2020-01-05'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Pikachu'), '2020-03-08'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Pikachu'), '2020-05-14'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
        (SELECT A.id FROM animals A WHERE A.name = 'Devimon'), '2021-05-04'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Jack Harkness'),
        (SELECT A.id FROM animals A WHERE A.name = 'Charmander'), '2021-02-24'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Planton'), '2019-12-21'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet William Tatcher'),
        (SELECT A.id FROM animals A WHERE A.name = 'Planton'), '2020-08-10'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Planton'), '2021-04-07'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
        (SELECT A.id FROM animals A WHERE A.name = 'Squirtle'), '2020-10-03'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Jack Harkness'),
        (SELECT A.id FROM animals A WHERE A.name = 'Agumon'), '2020-10-03'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Jack Harkness'),
        (SELECT A.id FROM animals A WHERE A.name = 'Agumon'), '2020-11-04'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Boarmon'), '2019-01-24'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Boarmon'), '2019-05-15'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Boarmon'), '2020-02-27'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Maisy Smith'),
        (SELECT A.id FROM animals A WHERE A.name = 'Boarmon'), '2020-08-03'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet Stephanie Mendez'),
        (SELECT A.id FROM animals A WHERE A.name = 'Blossom'), '2020-05-24'),
        ((SELECT V.id FROM vets V WHERE V.name = 'Vet William Tatcher'),
        (SELECT A.id FROM animals A WHERE A.name = 'Blossom'), '2021-01-11');




        -- second week first day

        
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';





