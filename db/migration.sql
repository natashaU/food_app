\c trader_joe_grocerylist

DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS diets;

CREATE TABLE diet (
  id SERIAL PRIMARY KEY,
  diet_name VARCHAR (255)
);

CREATE TABLE food (
  id SERIAL PRIMARY KEY,
  diet_id INTEGER REFERENCES diet(id),
  date_created TIMESTAMP NOT NULL DEFAULT NOW(),
  name VARCHAR (255),
  img_url VARCHAR(255),
  review TEXT
);


CREATE INDEX ON food (name);
CREATE INDEX ON diet (diet_name);
