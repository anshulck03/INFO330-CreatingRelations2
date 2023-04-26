-- create a original pokemon table, which will contains all original data from csv file
CREATE TABLE pokemon(
  abilities TEXT,
  against_bug REAL, against_dark REAL, against_dragon REAL, against_electric REAL,
  against_fairy REAL, against_fight REAL, against_fire REAL, against_flying REAL,
  against_ghost REAL, against_grass REAL, against_ground REAL, against_ice REAL,
  against_normal REAL, against_poison REAL, against_psychic REAL, against_rock REAL,
  against_steel REAL, against_water REAL, attack INTEGER, base_egg_steps INTEGER,
  base_happiness INTEGER, base_total INTEGER, capture_rate INTEGER,classification TEXT,
  defense INTEGER, experience_growth INTEGER, height_m REAL, hp INTEGER, name TEXT,
  percentage_male REAL, pokedex_number INTEGER, sp_attack INTEGER,
  sp_defense INTEGER, speed INTEGER, type1 TEXT, type2 TEXT, weight_kg REAL,
  generation INTEGER, is_legendary INTEGER);
-- insert data from csv file
INSERT INTO pokemon SELECT * FROM imported_pokemon_data;

-- To achieve 1NF, create pokemon_abilities and pokemon_1NF tables

CREATE TABLE pokemon_abilities(pokedex_number INTEGER, ability TEXT);

CREATE TABLE pokemon_1NF(
  against_bug REAL, against_dark REAL, against_dragon REAL, against_electric REAL,
  against_fairy REAL, against_fight REAL, against_fire REAL, against_flying REAL,
  against_ghost REAL, against_grass REAL, against_ground REAL, against_ice REAL,
  against_normal REAL, against_poison REAL, against_psychic REAL, against_rock REAL,
  against_steel REAL, against_water REAL, attack INTEGER, base_egg_steps INTEGER,
  base_happiness INTEGER, base_total INTEGER, capture_rate INTEGER,classification TEXT,
  defense INTEGER, experience_growth INTEGER, height_m REAL, hp INTEGER, name TEXT,
  percentage_male REAL, pokedex_number INTEGER, sp_attack INTEGER,
  sp_defense INTEGER, speed INTEGER, type1 TEXT, type2 TEXT, weight_kg REAL,
  generation INTEGER, is_legendary INTEGER);

-- CTE, split mutiple abilities and insert data to pokemon_abilities table
WITH split(pokemon_number, ability, nextability) AS (
SELECT pokedex_number, '' AS ability, abilities || ',' AS nextability
FROM pokemon
UNION ALL
SELECT pokemon_number,
substr(nextability, 0 , instr(nextability, ',')) AS ability,
substr(nextability, instr(nextability,',') + 1) AS nextability
FROM split
WHERE nextability !=''
)
INSERT INTO pokemon_abilities (pokedex_number, ability)
SELECT pokemon_number, ability
FROM split
WHERE ability !=''
ORDER BY pokemon_number;

--insert data into pokemon_1NF table
INSERT INTO pokemon_1NF SELECT against_bug, against_dark  , against_dragon  , against_electric  ,
  against_fairy  , against_fight  , against_fire  , against_flying  ,
  against_ghost  , against_grass  , against_ground  , against_ice  ,
  against_normal  , against_poison  , against_psychic  , against_rock  ,
  against_steel  , against_water  , attack  , base_egg_steps  ,
  base_happiness  , base_total  , capture_rate  ,classification  ,
  defense  , experience_growth  , height_m  , hp  , name  ,
  percentage_male  , pokedex_number  , sp_attack  ,
  sp_defense  , speed  , type1  , type2  , weight_kg  ,
  generation  , is_legendary   FROM imported_pokemon_data;
