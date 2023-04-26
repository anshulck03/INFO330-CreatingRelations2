
--TO achieve 3NF, create pokemon_3nf, base, and attribute tables 
CREATE TABLE pokemon_3nf(pokedex_number INTEGER, name TEXT, classification TEXT,  base_total INTEGER, capture_rate INTEGER, generation INTEGER, is_legendary INTEGER); 

CREATE TABLE base(base_total INTEGER, base_egg_steps INTEGER, base_happiness INTEGER);

CREATE TABLE attribute( classification TEXT, attack INTEGER,sp_attack INTEGER, defense INTEGER, sp_defense INTEGER, percentage_male REAL, speed INTEGER, weight_kg REAL,experience_growth INTEGER, height_m REAL, hp INTEGER);

--insert data to pokeon_3nf table
INSERT INTO pokemon_3nf SELECT pokedex_number, name, classfication, base_total, capture_rate, generation, is_legendary FROM imported_pokemon_data;

--insert data to base table
INSERT INTO base SELECT base_total, base_egg_steps, base_happiness FROM imported_pokemon_data;

--insert data to attribute table
INSERT INTO attribute SELECT classfication, attack, sp_attack, defense, sp_defense, percentage_male, speed, weight_kg, experience_growth, height_m, hp FROM imported_pokemon_data;


