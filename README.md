# Healthy Helper

** Healthy eating has never been easier **

[Try the app here](https://radiant-cliffs-99607.herokuapp.com/)

## The App

Healthy-eating involves months -- if not years -- of research, knowledge, and meticulously reading labels of every food item that you buy.
Looking for something that's sugar-free? Do you want to start a Keto diet, but don't know where to begin? Curious to try Paleo out but you don't even know what the word even means? Healthy Helper is a virtual food label that categorizes your favorite items into different dietry concerns,
so you'll never have to read another food label again.

Currently, in beta-testing, healthy helper is available across Trader Joe's nationwide, you can search for the following diets:

* Organic
* Paleo
* Keto
* Vegan
* Gluten Free
* Paleo


This app searches for specific diets, by joining together two tables in PSQL and filtering the results for the diet_name, check out this very special function from the app's model:

```
  findDiet(filter) {
    return db.many(`
      SELECT food.id, food.name, food.img_url, food.review, diet.diet_name
        FROM food INNER JOIN diet
        ON food.diet_id = diet.id
        WHERE diet.diet_name = $/diet_name/
    ORDER BY id
    `, filter);
  },

```
