
 CREATE TABLE animales(
  id            integer,
  name       varchar(500),
  data_of_birth           date,
  escape_attempts    integer,
  neutered     boolean,
  weight_kg    DECIMAL(4,2)
);

ALTER TABLE animales ADD species varchar(500);

-- DAY 3

CREATE TABLE owners(
  id      integer GENERATED ALWAYS AS IDENTITY,
  full_name     varchar(500),
  age      integer,
  PRIMARY KEY (id)
);

CREATE TABLE species(
  id  integer GENERATED ALWAYS AS IDENTITY,
  name   varchar(400),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS animales;

CREATE TABLE animals(
  id            integer GENERATED ALWAYS AS IDENTITY,
  name       varchar(500),
  date_of_birth           date,
  escape_attempts    integer,
  neutered     boolean,
  weight_kg    DECIMAL(4,2),
  species_id    integer references species(id),
  owner_id      integer  references owners(id)
);








