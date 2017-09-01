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
INSERT INTO food (name, img_url, review) VALUES ('$/name/', , 'good'); *
INSERT INTO diet (diet_name) VALUES ('keto', ' vegan');
INSERT INTO  cross_reference(food_id, diet_id) VALUES (food.id, diet.id);

$/content/, $/author/, $/genre_id/

INSERT INTO cross_reference (food_id, diet_id) VALUES (
  INSERT INTO food (name, img_url, review) VALUES ('chips', 'www.chips.com', 'good')
    RETURNING ID,
    INSERT INTO diet (diet_name) VALUES ('paleo')
      RETURNING ID
    );





