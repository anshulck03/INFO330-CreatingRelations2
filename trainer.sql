-- create new table trainer contains first_name, last_name, and favorite_pokemon_types
CREATE TABLE trainer (
  first_name VARCHAR(80),
  last_name VARCHAR(80),
  favorite_pokemon_types TEXT);

-- insert data
INSERT INTO trainer(first_name, last_name, favorite_pokemon_types)
VALUES('Ted', 'Neward', 'electric');

INSERT INTO trainer(first_name, last_name, favorite_pokemon_types)
VALUES('Justin', 'Dong', 'water');

INSERT INTO trainer(first_name, last_name, favorite_pokemon_types)
VALUES('Kaarina', 'Tulleau', 'ice');

INSERT INTO trainer(first_name, last_name, favorite_pokemon_types)
VALUES('Katherine', 'Wei', 'flying');

INSERT INTO trainer(first_name, last_name, favorite_pokemon_types)
VALUES('Katherine', 'Guo', 'fire');

