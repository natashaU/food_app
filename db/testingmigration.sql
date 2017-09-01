# using this file to experiment with 3 tables, 3 tables works succesfully,
# I can find an item with many to many attributes, for example it works
# to "search for ID" when I find

#got 3 tables, many 2 many working with testing.sql files, when searching for food by ID, but gonna abandon 3 tables in favor of 2, because "creating a new food item" is way too complicated and it's taking too long to solve how to do it after numerous experimentations, i won't have time to finish my app if I keep working on 3 tables. The working code is saved in the testing.sql files, that i WILL NOT use in my final project.'


\c projectesting2

DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS diets;


CREATE TABLE food (
  id SERIAL PRIMARY KEY,
  date_created TIMESTAMP NOT NULL DEFAULT NOW(),
  name VARCHAR (255),
  img_url VARCHAR(255),
  review TEXT
);

CREATE TABLE diet (
  id SERIAL PRIMARY KEY,
  diet_name VARCHAR (255)
);

CREATE TABLE cross_reference (
  food_id INTEGER REFERENCES food,
  diet_id INTEGER REFERENCES diet,
  PRIMARY KEY (food_id, diet_id)
);

CREATE INDEX ON food (name);
CREATE INDEX ON diet (diet_name);

# SELECT food.name, food.img_url, food.review, diet.diet_name, cross_reference.food_id
SELECT f.*, STRING_AGG(d.diet_name, ',')
FROM cross_reference as x
JOIN food as f ON (x.food_id = f.id)
JOIN diet as d on (x.diet_id = d.id)
WHERE x.food_id = 2
GROUP BY f.id

#Create New /Add psuedocode
# INSERT INTO food (name, img_url, review) VALUES ('$/name/', , 'good'); *
# INSERT INTO diet (diet_name) VALUES ('keto', ' vegan');
# INSERT INTO  cross_reference(food_id, diet_id) VALUES (food.id, diet.id);

# $/content/, $/author/, $/genre_id/

# INSERT INTO cross_reference (food_id, diet_id) VALUES (
 #  INSERT INTO food (name, img_url, review) VALUES ('chips', 'www.chips.com', 'good')
 #    RETURNING ID,
  #   INSERT INTO diet (diet_name) VALUES ('paleo')
  #     RETURNING ID
   #  );





