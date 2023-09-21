/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

-- Insert the new data
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-4-2', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES 
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals
SET species_id = 1
WHERE name ILIKE '%mon';

UPDATE animals
SET species_id = 2
WHERE NOT name ILIKE '%mon';

-- Set species_id based on animal names
UPDATE animals
SET species_id = 
    CASE 
        WHEN name ILIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END;

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