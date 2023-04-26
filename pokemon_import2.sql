

--TO achieve 2NF, create pokemon_2nf and type tables 
CREATE TABLE pokemon_2nf(
  attack INTEGER, base_egg_steps INTEGER,
  base_happiness INTEGER, base_total INTEGER, capture_rate INTEGER,classification TEXT,
  defense INTEGER, experience_growth INTEGER, height_m REAL, hp INTEGER, name TEXT,
  percentage_male REAL, pokedex_number INTEGER, sp_attack INTEGER,
  sp_defense INTEGER, speed INTEGER, weight_kg REAL,
  generation INTEGER, is_legendary INTEGER); 

-- against_x data depends on type1 and ype2 together, so creeate a type table, here type_id is equvalent to pokedex_number in pokemon_2nf table
CREATE TABLE type(type_id INTEGER, type1 TEXT, type2 TEXT, against_bug REAL, against_dark REAL, against_dragon REAL, against_electric REAL,
  against_fairy REAL, against_fight REAL, against_fire REAL, against_flying REAL,
  against_ghost REAL, against_grass REAL, against_ground REAL, against_ice REAL,
  against_normal REAL, against_poison REAL, against_psychic REAL, against_rock REAL,
  against_steel REAL, against_water REAL);


--INSERT data to pokemon_2nf table
INSERT INTO pokemon_2nf SELECT attack  , base_egg_steps  ,
  base_happiness  , base_total  , capture_rate  ,classification  ,
  defense  , experience_growth  , height_m  , hp  , name  ,
  percentage_male  , pokedex_number  , sp_attack  ,
  sp_defense  , speed  , weight_kg  ,
  generation  , is_legendary     FROM imported_pokemon_data;

--insert data to type table
INSERT INTO type SELECT pokedex_number,type1, type2, against_bug, against_dark, against_dragon  , against_electric,
  against_fairy  , against_fight  , against_fire  , against_flying  ,
  against_ghost  , against_grass  , against_ground  , against_ice  ,
  against_normal  , against_poison  , against_psychic  , against_rock  ,
  against_steel  , against_water   FROM imported_pokemon_data;

















